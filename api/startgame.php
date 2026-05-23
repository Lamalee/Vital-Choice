<?php
session_start();
include '../profile/db.php';
if (!isset($_SESSION['id'])) {
    header("Location: login.php");
    exit();
}
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $player_id = $_SESSION['id'];
    $mode = $_POST['game_mode'];
    $exam_code = trim($_POST['exam_code'] ?? "");
    $exam_id = null;

    if (!empty($exam_code)) {
        $stmt = $conn->prepare("SELECT exam_id FROM exams WHERE exam_code = ? AND pending = 1");
        $stmt->bind_param("s", $exam_code);
        $stmt->execute();
        $res = $stmt->get_result();
        
        if ($row = $res->fetch_assoc()) {
            $exam_id = $row['exam_id'];
        } else {
            $_SESSION['error_message'] = 'Mã đề thi không tồn tại!';
            header("Location: ../mainpage/mainpage2.php");
            exit();
        }
    }
    unset($_SESSION['exam_questions_queue']);
    $_SESSION['used_questions'] = [];
    if ($exam_id === null) {
    $sql = "INSERT INTO game_sessions 
            (player_id, current_day, health, mode, exam_id)
            VALUES ('$player_id', 1, 20, '$mode', NULL)";
} else {
    $sql = "INSERT INTO game_sessions 
            (player_id, current_day, health, mode, exam_id)
            VALUES ('$player_id', 1, 20, '$mode', '$exam_id')";
}
            
    if (mysqli_query($conn, $sql)) {
        $_SESSION['current_session_id'] = mysqli_insert_id($conn);
        $_SESSION['mode'] = $mode;
        $redirect_url = "../gamepage/gamepage.php";
        if ($exam_id) {
            $redirect_url .= "?exam_id=" . $exam_id;
        }
        header("Location: " . $redirect_url);
        exit();
    } else {
        echo "Lỗi khởi tạo game!";
    }   
}
?>