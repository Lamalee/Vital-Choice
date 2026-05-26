<?php
include '../profile/db.php';
$msg = "";
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];
    $password = $_POST['password'];
    $confirm = $_POST['confirm_password'];
    $role = $_POST['role'];

    if ($password != $confirm) {
        $msg = "Mật khẩu không khớp!";
    } else {
        $check = $conn->prepare("SELECT * FROM players WHERE username=?");
        $check->bind_param("s", $username);
        $check->execute();
        $res = $check->get_result();
        if ($res->num_rows > 0) {
            $msg = "Tài khoản đã tồn tại!";
        } else {
            $hash = password_hash($password, PASSWORD_DEFAULT);
            $stmt = $conn->prepare("INSERT INTO players (username, password, role) VALUES (?, ?, ?)");
            $stmt->bind_param("ssi", $username, $hash, $role);
            if ($stmt->execute()) {
                $msg = "Đăng ký thành công!";
            } else {
                $msg = "Lỗi hệ thống!";
            }
        }
    }
}
?>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<title>Register</title>
<link rel="stylesheet" href="register.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>
<body>
    <div class="top-right-nav">
    <span>Đã có tài khoản?</span>
    <a href="login.php" class="login-link">Đăng nhập</a>
</div>
<form method="POST">
    <h2>Register</h2>
    <input type="text" name="username" placeholder="Username" required>
   <div class="password-box">

    <input
        type="password"
        id="password"
        name="password"
        placeholder="Password"
        required
    >

    <span class="toggle-password" onclick="togglePassword('password', this)">
        <i class="fa-solid fa-eye"></i>
    </span>

</div>

<div class="password-box">

    <input
        type="password"
        id="confirm_password"
        name="confirm_password"
        placeholder="Confirm"
        required
    >

    <span class="toggle-password" onclick="togglePassword('confirm_password', this)">
        <i class="fa-solid fa-eye"></i>
    </span>

</div>
<div class="role">
    <label>
        <input type="radio" name="role" value="0" required> Student
    </label>
    <label>
        <input type="radio" name="role" value="1"> Teacher
    </label>
</div>
    <button type="submit" class="btn">Đăng ký</button>
</form>
<?php if ($msg != ""): ?>
<div class="popup" id="popup">
    <div class="box">
        <h3><?php echo $msg; ?></h3>
        <button class="btnClose" onclick="closePopup()">
            OK
        </button>
    </div>
</div>
<?php endif; ?>
<script>
function togglePassword(inputId, element) {
    const password = document.getElementById(inputId);
    const icon = element.querySelector("i");
    if (password.type === "password") {
        password.type = "text";
        icon.classList.remove("fa-eye");
        icon.classList.add("fa-eye-slash");
    } else {
        password.type = "password";
        icon.classList.remove("fa-eye-slash");
        icon.classList.add("fa-eye");
    }
}
function closePopup(){
    document.getElementById("popup").style.display = "none";
    let msg = "<?php echo $msg; ?>";
    if (msg.includes("thành công")) {
        window.location.href = "login.php";
    }
}

</script>
</body>
</html>