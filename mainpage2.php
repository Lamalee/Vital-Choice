<?php
session_start();
if (!isset($_SESSION['username'])) {
    header("Location: login.php");
    exit();
}
?>
<!doctype html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="mainpage.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&family=Molle:ital@1&family=Pixelify+Sans:wght@400..700&display=swap"
      rel="stylesheet"
    />
    <title>Trang Chủ Game</title>
  </head>
  <body>
    <header>
      <h1>Vital Choice</h1>
      <nav>
        <ul>
          <li><a href="#aboutus">About Us</a></li>
          <li><a href="logout.php">Logout</a></li>
        </ul>
      </nav>
    </header>
    <main>
      <section id="home">
        <h2 class="welcome">Welcome, <?php echo $_SESSION['username']; ?>!</h2>
        <h2 class="welcome">Your <u>CHOICE</u> for your <u>LIFE</u>!!!</h2>
        <a href="gamepage.php">
          <button >Play</button>
        </a>
      </section>
      <section id="aboutus">
        <div class="card">
          <img src="image/team.png" alt="Team" />
          <div class="card-content">
            <h2 class="card-title">About Us</h2>
            <p>
              Pyro Team được thành lập vào năm 2024, là một nhóm gồm 5 thành
              viên: Lê Ngọc Lâm, Trần Đình Phát, Nguyễn Tú Cường, Đỗ Chính Đạt
              và Võ Trọng Khải. Tất cả đều là sinh viên lớp CNTT 47C tại Trường
              Đại học Quy Nhơn. Với niềm đam mê công nghệ, chúng tôi phát triển
              game quiz "Vital Choice" nhằm mang lại trải nghiệm vừa học vừa
              chơi thú vị cho người dùng.
            </p>
          </div>
        </div>
        <div class="card">
          <img src="image/libraryQNU.png" alt="Contact" />
          <div class="card-content">
            <h2 class="card-title">Contact Us</h2>
            <p>
              Email: pyroteam@gmail.com <br />
              Facebook: Pyro Team <br />
            </p>
          </div>
        </div>
        <div class="card">
          <h2 class="card-title">Adress:</h2>
          <p>Thư viện Trường Đại học Quy Nhơn</p>
          <iframe
            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3875.330043007114!2d109.21528237485605!3d13.75895968663363!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x316f6daeb9638003%3A0x7e92ee7b4fafd974!2zU8OibiB0aMawIHZp4buHbiwgxJDhuqFpIGjhu41jIFF1eSBOaMahbg!5e0!3m2!1svi!2s!4v1776503823448!5m2!1svi!2s"
            width="600"
            height="450"
            style="border: 0"
            allowfullscreen=""
            loading="lazy"
            referrerpolicy="no-referrer-when-downgrade"
          ></iframe>
        </div>
      </section>
    </main>
    <footer>
      <p>&copy; Developed by Pyro Team</p>
    </footer>
  </body>
</html>
