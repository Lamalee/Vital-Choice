<?php
session_start();
if (isset($_COOKIE['remember_login'])) {
    $data = json_decode($_COOKIE['remember_login'], true);
    if ($data && isset($data['time'], $data['id'], $data['role'])) {

        if (time() - $data['time'] <= 1800) {
            $_SESSION['id'] = $data['id'];
            $_SESSION['username'] = $data['username'];
            $_SESSION['role'] = $data['role'];
            if ($data['role'] == 2) {
                header("Location: ../admin/admin.php");
            } else if ($data['role'] == 1) {
                header("Location: ../giaovien/Teacherpage.php");
            } else {
                header("Location: ../mainpage/mainpage2.php");
            }
            exit;
        } else {
            setcookie("remember_login", "", time() - 3600, "/");
            session_unset();
            session_destroy();
        }

    } else {
        setcookie("remember_login", "", time() - 3600, "/");
        session_unset();
        session_destroy();
    }
}
?>
<!doctype html>
<html lang="vi">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />

  <title>Vital Choice - Login</title>

  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@500;700&family=Pixelify+Sans:wght@400;700&display=swap" rel="stylesheet">

  <link rel="stylesheet" href="loginn.css">

  <script src="https://accounts.google.com/gsi/client" async defer></script>
</head>

<body>
  <video autoplay muted loop playsinline preload="auto" id="bg-video">
    <source src="../video/login.mp4" type="video/mp4">
  </video>
  <div class="particle gold" style="width:4px;height:4px;left:5%;animation-duration:12s;"></div>
  <div class="particle gold" style="width:6px;height:6px;left:12%;animation-duration:15s;"></div>
  <div class="particle gold" style="width:5px;height:5px;left:18%;animation-duration:18s;"></div>
  <div class="particle gold" style="width:3px;height:3px;left:25%;animation-duration:10s;"></div>
  <div class="particle gold" style="width:7px;height:7px;left:30%;animation-duration:20s;"></div>
  <div class="particle gold" style="width:5px;height:5px;left:36%;animation-duration:14s;"></div>
  <div class="particle gold" style="width:4px;height:4px;left:42%;animation-duration:16s;"></div>

  <div class="particle purple" style="width:5px;height:5px;left:55%;animation-duration:13s;"></div>
  <div class="particle purple" style="width:7px;height:7px;left:62%;animation-duration:17s;"></div>
  <div class="particle purple" style="width:4px;height:4px;left:70%;animation-duration:12s;"></div>
  <div class="particle purple" style="width:6px;height:6px;left:78%;animation-duration:19s;"></div>
  <div class="particle purple" style="width:5px;height:5px;left:85%;animation-duration:14s;"></div>
  <div class="particle purple" style="width:3px;height:3px;left:92%;animation-duration:11s;"></div>

  <div class="particle gold" style="width:2px;height:2px;left:15%;animation-duration:9s;"></div>
  <div class="particle gold" style="width:2px;height:2px;left:48%;animation-duration:11s;"></div>
  <div class="particle purple" style="width:2px;height:2px;left:66%;animation-duration:10s;"></div>
  <div class="particle purple" style="width:2px;height:2px;left:88%;animation-duration:8s;"></div>

  <div class="login-box">

    <h2>LOGIN</h2>

    <p class="subtitle">
      Hệ thống ôn tập trắc nghiệm kiến thức 
    </p>

    <div class="google-btn-wrapper">

  <p class="google-text">
    Đăng nhập bằng Google để tiếp tục <br>
    (Chưa có tài khoản, tài khoản mới sẽ tạo tự động)
  </p>

  <div id="g_id_onload"
    data-client_id="63291630669-bu4mcmmm96dcniruhg83j8g9r3l6mdou.apps.googleusercontent.com"
    data-callback="handleCredentialResponse">
  </div>

  <div class="google-icon-wrapper">

    <div
      class="g_id_signin"
      data-type="icon"
      data-theme="filled_black"
      data-size="large"
      data-shape="pill">
    </div>

  </div>

</div>

    <p id="error-msg" class="error-text"></p>

  </div>

  <!-- BANNED POPUP -->

  <div id="banPopup" class="popup">

    <div class="popup-content">

      <div class="popup-icon">⚠️</div>

      <p>Tài khoản của bạn đã bị cấm khỏi hệ thống!</p>

      <button onclick="closePopup('banPopup')">
        OK
      </button>

    </div>

  </div>

  <!-- PENDING POPUP -->

  <div id="pendingPopup" class="popup">

    <div class="popup-content">

      <div class="popup-icon">⏳</div>

      <p>Tài khoản của bạn đang chờ quản trị viên phê duyệt!</p>

      <button onclick="closePopup('pendingPopup')">
        OK
      </button>

    </div>

  </div>

  <script>


const video = document.getElementById("bg-video");

video.addEventListener("ended", () => {

  video.style.opacity = "0.92";

  setTimeout(() => {
    video.style.opacity = "1";
  }, 200);

});


    function closePopup(id) {
      document.getElementById(id).classList.remove("active");
    }

    function handleCredentialResponse(response) {

      const id_token = response.credential;

      const errorEl = document.getElementById("error-msg");

      errorEl.classList.remove("active");

      fetch("../api/login_google_action.php", {

        method: "POST",

        headers: {
          "Content-Type": "application/x-www-form-urlencoded"
        },

        body: "token=" + encodeURIComponent(id_token)

      })

      .then(res => res.json())

      .then(data => {

        if (data.success) {

          if (data.role == 2) {

            window.location.href = "../admin/admin.php";

          } else if (data.role == 1) {

            window.location.href = "../giaovien/Teacherpage.php";

          } else {

            window.location.href = "../mainpage/mainpage2.php";

          }

        } else {

          if (data.error_type === "banned") {

            document.getElementById("banPopup")
              .classList.add("active");

          } else if (data.error_type === "pending") {

            document.getElementById("pendingPopup")
              .classList.add("active");

          } else {

            errorEl.innerText = data.message;

            errorEl.classList.add("active");

          }

        }

      })

      .catch(error => {

        console.error(error);

        errorEl.innerText = "Lỗi kết nối máy chủ!";

        errorEl.classList.add("active");

      });

    }
</script>

</body>
</html>