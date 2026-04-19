<?php
include 'db.php';
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
</head>

<body>

<form method="POST">
    <h2>Register</h2>

    <input type="text" name="username" placeholder="Username" required>
    <input type="password" name="password" placeholder="Password" required>
    <input type="password" name="confirm_password" placeholder="Confirm" required>
<div class="role">
    <label>
        <input type="radio" name="role" value="0" required> Student
    </label>
    <label>
        <input type="radio" name="role" value="1"> Teacher
    </label>
</div>
    <button type="submit">Đăng ký</button>
</form>
<?php if ($msg != ""): ?>
<div class="popup" id="popup">
    <div class="box">
        <h3><?php echo $msg; ?></h3>
        <button onclick="closePopup()">
            OK
        </button>
    </div>
</div>
<?php endif; ?>
<script>
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