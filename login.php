<?php
include 'db.php';
session_start();
$error = "";
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = trim($_POST['username']);
    $password = $_POST['password'];
    $role = $_POST['role'];
    if ($role === "") {
        $error = "Vui lòng chọn vai trò!";
    } else {
        $stmt = $conn->prepare("SELECT * FROM players WHERE username=? AND role=?");
        $stmt->bind_param("si", $username, $role);
        $stmt->execute();
        $result = $stmt->get_result();
        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            if (password_verify($password, $row['password'])) {
                $_SESSION['id'] =$row['id'];
                $_SESSION['username'] = $row['username'];
                $_SESSION['role'] = $row['role'];
                if ($role == 2) {
                    header("Location: admin.php");
                } elseif ($role == 1) {
                    header("Location: teacher.php");
                } else {
                    header("Location: mainpage2.php");
                }
                exit();
            } else {
                $error = "Sai tài khoản hoặc mật khẩu!";
            }
        } else {
            $error = "Tài khoản không tồn tại hoặc sai vai trò!";
        }
    }
}
?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="loginn.css">
</head>

<body>

<div class="login-box">

    <h2>Login</h2>

    <form method="POST">

        <p>
            
            <input type="text" name="username" placeholder="Username" required>
        </p>

        <p>
          
            <input type="password" name="password" placeholder="Password" required>
        </p>

        <p>
            <select name="role" required>
                <option value="" disabled selected>-- Chọn vai trò --</option>
                <option value="0">Student</option>
                <option value="1">Teacher</option>
                <option value="2">Admin</option>
            </select>
        </p>
        <div class="button-container">
            <button type="submit">Login</button>
        </div>
    </form>

    <?php if (!empty($error)): ?>
        <p style="color:red; text-align:center; margin-top:10px;">
            <?php echo $error; ?>
        </p>
    <?php endif; ?>

</div>

</body>
</html>