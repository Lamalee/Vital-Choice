 <?php
 include 'db.php';
 ?>
 <!DOCTYPE html>
 <html lang="en">
 <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
 </head>
 <body>
    <h2>Đăng ký</h2>
    <form method="POST">
    Username: <input type="text" name="username" required><br>
    Password: <input type="password" name="password" required><br>
    Confirm Password: <input type="password" name="confirm_password" required><br>
    Role: <input type="radio" name="role" value="0" required> Student
    <input type="radio" name="role" value="1" required> Teacher<br>
    <button type="submit" name="register" required>Đăng ký</button>
    </form>
<?php
include 'db.php';
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];
    $password = $_POST['password'];
    $confirm_password = $_POST['confirm_password'];
    $role = $_POST['role'];
    if ($password != $confirm_password) {
        echo "Mật khẩu không khớp!";
        exit();
    }
    $check = "SELECT * FROM players WHERE username = '$username'";
    $result = $conn->query($check);
    if ($result->num_rows > 0) {
        echo "Tài khoản đã tồn tại!";
        exit();
    }
    $password_hash = password_hash($password, PASSWORD_DEFAULT);
    $sql = "INSERT INTO players (username, password, role) 
            VALUES ('$username', '$password_hash', '$role')";
    if ($conn->query($sql)) {
        echo "Đăng ký thành công!";
    } else {
        echo "Lỗi!";
    }
}
?>
 </body>
 </html>