<!doctype html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login với Google</title>
    <!-- Giữ lại CSS cũ của bạn -->
    <link rel="stylesheet" href="loginn.css" />
    <!-- Nhúng thư viện Google Identity Services -->
    <script src="https://accounts.google.com/gsi/client" async defer></script>
  </head>

  <body>
    <div class="login-box" style="text-align: center;">
      <h2>Login</h2>
      <p style="color: #666; margin-bottom: 25px;">Hệ thống sử dụng đăng nhập duy nhất bằng Google</p>

      <!-- Nút Đăng nhập Google được căn giữa gọn gàng -->
      <div style="display: flex; justify-content: center; margin-top: 20px;">
          <div id="g_id_onload"
               data-client_id="63291630669-bu4mcmmm96dcniruhg83j8g9r3l6mdou.apps.googleusercontent.com"
               data-callback="handleCredentialResponse">
          </div>
          <div class="g_id_signin" data-type="standard" data-theme="outline" data-size="large"></div>
      </div>

      <!-- Nơi hiển thị thông báo lỗi nếu có lỗi từ hệ thống -->
      <p id="error-msg" style="color: red; text-align: center; margin-top: 15px; display: none;"></p>
    </div>

    <!-- Popup Banned -->
    <div id="banPopup" class="popup" style="display: none;">
      <div class="popup-content">
        <p>Tài khoản của bạn đã bị cấm!</p>
        <button onclick="document.getElementById('banPopup').style.display = 'none'">
          OK
        </button>
      </div>
    </div>
    
    <!-- Popup Pending Approval -->
    <div id="pendingPopup" class="popup" style="display: none;">
      <div class="popup-content">
        <p>Tài khoản của bạn đang chờ duyệt!</p>
        <button onclick="document.getElementById('pendingPopup').style.display = 'none'">
          OK
        </button>
      </div>
    </div>

    <script>
    function handleCredentialResponse(response) {
        const id_token = response.credential;
        const errorEl = document.getElementById("error-msg");
        errorEl.style.display = "none";

        // Gửi token qua AJAX (Fetch API) lên file action xử lý
        fetch('../api/login_google_action.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: 'token=' + encodeURIComponent(id_token)
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
                if (data.error_type === 'banned') {
                   
                    document.getElementById("banPopup").style.display = "flex";
                } else if (data.error_type === 'pending') {
                   
                    document.getElementById("pendingPopup").style.display = "flex";
                } else {
                    errorEl.innerText = data.message;
                    errorEl.style.display = "block";
                }
            }
        })
        .catch(error => {
            console.error('Lỗi:', error);
            errorEl.innerText = "Lỗi kết nối máy chủ!";
            errorEl.style.display = "block";
        });
    }
    </script>
  </body>
</html>