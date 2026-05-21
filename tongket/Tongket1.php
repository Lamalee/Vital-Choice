<?php 
session_start();
if (!isset($_SESSION['id'])) {
    header("Location: ../login_register/login.php");
    exit();
}
?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Kết quả chơi game</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&family=Pixelify+Sans:wght@400..700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="Tongket.css">

    
    <script src="Tongket.js" defer></script>
</head>

<body>
<div class="container">
    <div class="card result-card">
        <div class="title-line">
            <span></span>
            <h2>Kết quả bài làm</h2>
        </div>

        <div class="summary-grid">
            <div class="result-badge" id="rankBadge">N/A</div>

            <div class="result-stats">
                <div class="stat-row"><span>Số câu đúng</span><strong id="correctCount">0</strong></div>
                <div class="stat-row"><span>Số câu sai</span><strong id="wrongCount">0</strong></div>
            </div>
        </div>

        <div class="button-row">
            <?php if (isset($_SESSION['role']) && $_SESSION['role'] === 0): ?>
            <a href="../mainpage/mainpage2.php" class="nut">Về trang chủ</a>
            <?php elseif (isset($_SESSION['role']) && $_SESSION['role'] === 1): ?>
            <a href="../giaovien/thuviengiaovien.php" class="nut">Về thư viện</a>
            <?php endif; ?>
        </div>
    </div>

    <div class="card detail-card">
        <div class="title-line">
            <span></span>
            <h2>Chi tiết bài làm</h2>
        </div>

        <div class="question-list" id="questionList">
            <div class="no-data" id="noDataText">Đang tải chi tiết bài làm...</div>
        </div>
    </div>
</div>

</body>
</html>