<?php
include 'db.php';
?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
</head>
<body>
    <h2>Login</h2>
    <form method="POST">
        <p>
            <label>username</label1><br>
            <input type="text" name="username" required>
            </p>
            <p>
                <label>Password</label><br>
                <input type="password" name="password" required>
            </p>
        <p>
            <label>Chọn vai trò:</label><br>
            <select name="role" required>
                <option >-- Chọn vai trò --</option>
                <option value="0">Student</option>
                <option value="1">Teacher</option>
                <option value="2">Admin</option>
            </select>
        </p>
        <button type="submit">Login</button>
    </form>
    <?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];
    $password = $_POST['password'];
    $role = $_POST['role'];
    $sql = "SELECT * FROM players WHERE username='$username' AND role='$role'";
    $result = $conn->query($sql);
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        if (password_verify($password, $row['password'])) {
            echo "Đăng nhập thành công!";
        } else {
            echo "Sai tài khoản hoặc mật khẩu!";
        }
    } else {
        echo "Tài khoản không tồn tại!";
    }
}
    ?>
</body>
</html>