<?php
include '../profile/db.php';
session_start();

$error = "";
$ban="";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = trim($_POST['username'] ?? "");
    $password = $_POST['password'] ?? "";
    $stmt = $conn->prepare("SELECT * FROM players WHERE username=? LIMIT 1");
    $stmt->bind_param("s", $username); 
    $stmt->execute(); 
    $result = $stmt->get_result(); 
    if ($result->num_rows > 0) { 
    $row = $result->fetch_assoc();
    if ($row['status'] == 0) { $ban = "banned"; 
    } else if(password_verify($password, $row['password'])) { 
      $_SESSION['id'] = $row['id'];
      $_SESSION['username'] = $row['username']; 
      $_SESSION['role'] = $row['role']; 
      if ($row['role'] == 2) { 
        header("Location: ../admin/admin.php"); 
        } elseif ($row['role'] == 1) { 
          header("Location: ../giaovien/Teacherpage.php"); 
          } else {
        header("Location: ../mainpage/mainpage2.php"); } exit(); 
        } else { 
          $error = "Sai tài khoản hoặc mật khẩu!"; 
          } 
        } else { 
          $error = "Tài khoản không tồn tại!"; 
          } 
        }
?>
<!doctype html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login</title>
    <link rel="stylesheet" href="loginn.css" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
    />
  </head>

  <body>
    <div class="top-right-nav">
      <span>Chưa có tài khoản?</span>
      <a href="register.php" class="register-link">Đăng ký</a>
    </div>

    <div class="login-box">
      <h2>Login</h2>

      <form method="POST">
        <div>
          <input type="text" name="username" placeholder="Username" required />
        </div>
        <div class="password-box">
          <input
            type="password"
            id="password"
            name="password"
            placeholder="Password"
            required
          />
          <span class="toggle-password" onclick="togglePassword()">
            <i class="fa-solid fa-eye"></i>
          </span>
        </div>
        <div class="button-container">
          <button type="submit">Login</button>
        </div>
      </form>

      <?php if (!empty($error)): ?>
      <p style="color: red; text-align: center; margin-top: 10px">
        <?php echo $error; ?>
      </p>
      <?php endif; ?>
    </div>
    <div id="banPopup" class="popup">
      <div class="popup-content">
        <p>Tài khoản của bạn đã bị cấm!</p>
        <button
          onclick="document.getElementById('banPopup').style.display = 'none'"
        >
          OK
        </button>
      </div>
    </div>
    <?php if ($ban == "banned"): ?>
    <script>
      document.getElementById("banPopup").style.display = "flex";
    </script>
    <?php endif; ?>
  </body>
  <script>

function togglePassword() {
    const password = document.getElementById("password");
    const icon = document.querySelector(".toggle-password i");
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

</script>
</html>
