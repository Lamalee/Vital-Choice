<?php
session_start();
if(!isset($_SESSION['id']) || $_SESSION['role'] !== 1){
    header("Location: login.php");
    exit();
}
$current_exam_id = $_GET['exam_id'] ?? 0;
?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Xem lịch sử làm bài</title>
    <link rel="stylesheet" href="history_of_student.css">
    <script>
        const CURRENT_EXAM_ID = <?php echo json_encode($current_exam_id); ?>;
    </script>
</head>
<body>
    <div class="header-wrapper">
        <h2>Lịch sử làm bài của học sinh</h2>
        <button class="back-btn" onclick="window.location.href='thuviengiaovien.php'">← Quay lại</button>
    </div>
    <div id="display-history">
    </div>
    <div class="popup-overlay" id="popup-overlay"></div>
    <div class="popup" id="popup-detail-history">
        <button id="close-popup">Đóng</button>
        <h3>Chi tiết lịch sử làm bài</h3>
        <div id="detail-history">
        </div>
    </div>
</body>
<script src="history_of_student.js"></script>
</html>