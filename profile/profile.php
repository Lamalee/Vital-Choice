<?php
session_start();
if (!isset($_SESSION['id'])) {
    header("Location: login.php");
    exit();
}
?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Vital Choice - Profile</title>
     <link
      href="https://fonts.googleapis.com/css2?family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&family=Molle:ital@1&family=Pixelify+Sans:wght@400..700&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="profile.css">
    <script src="profile.js" defer></script>
</head>
<body>

<div class="container">
    <div class="card profile-header">
        <div class="title-line"><span></span><h2>Hồ sơ sinh tồn</h2></div>
        <div class="header-flex">
            <div class="avatar-box">👾</div>
            <div class="user-info">
                <p><b>Username:</b> <span class="highlight" id="user_display_name">Đang tải...</span></p>
                <p><b>ID Người chơi:</b> <span class="highlight" id="user_display_id">#0000</span></p>
            </div>
        </div>
    </div>

    <div class="game-grid">
        <div class="card">
            <div class="title-line"><span></span><h2>Thống kê tổng quát</h2></div>
            <div class="stat-item"><span>🎮 Tổng lượt chơi</span><span class="val" id="stat_total_games">0</span></div>
            <div class="stat-item"><span>🏆 Kỷ lục sống</span><span class="val" id="stat_longest_survival">0 ngày</span></div>
            <div class="stat-item"><span>⭐ Điểm cao nhất</span><span class="val" id="stat_best_score">0%</span></div>
            <div class="stat-item"><span>❌ Tổng câu sai</span><span class="val" id="stat_wrong_answers">0</span></div>
        </div>

        <div class="card">
            <div class="title-line"><span></span><h2>Thành tựu</h2></div>
            <div class="badge-container" id="badge_list">
                <div class="badge locked" id="badge_100_days" title="Sống sót qua 100 ngày">⏳</div>
                <div class="badge locked" id="badge_perfect_game" title="Trả lời đúng 100% một game">🎯</div>
            </div>
            <p class="badge-note">Hoàn thành thử thách để mở khóa huy chương</p>
        </div>
    </div>

    <div class="card">
        <div class="title-line"><span></span><h2>Hiệu suất trả lời</h2></div>
        <div class="perf-item">
            <div class="perf-label">
                <span>CHÍNH XÁC</span>
                <span id="perf_correct_percent">0%</span>
            </div>
            <div class="bar">
                <div class="fill green" id="bar_correct" style="width: 0%"></div>
            </div>
        </div>
        <div class="perf-item">
            <div class="perf-label">
                <span>SAI SÓT</span>
                <span id="perf_wrong_percent">0%</span>
            </div>
            <div class="bar">
                <div class="fill red" id="bar_wrong" style="width: 0%"></div>
            </div>
        </div>
    </div>

    <div class="card">
        <div class="title-line"><span></span><h2>Lịch sử 10 trận gần nhất</h2></div>
        <div class="history-list" id="history_container">
            <div class="no-data" id="history_empty_msg">Chưa có dữ liệu sinh tồn. Hãy bắt đầu trận đấu đầu tiên!</div>
        </div>
    </div>
</div>

</body>
</html>