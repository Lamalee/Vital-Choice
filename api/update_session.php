<?php
session_start();
include '../profile/db.php';
if (isset($_SESSION['current_session_id'])) {
    $session_id = $_SESSION['current_session_id'];
    $hp = $_POST['hp'];
    $day = $_POST['day'];
    $rank = trim($_POST['rank']);
    $sql = "UPDATE game_sessions SET health = '$hp', current_day = '$day', ranking = '$rank' WHERE session_id = '$session_id'";

    mysqli_query($conn, $sql);
    $sql1 = "DELETE FROM game_sessions
WHERE NOT EXISTS (
    SELECT 1
    FROM history_answers
    WHERE history_answers.session_id = game_sessions.session_id
);";
    mysqli_query($conn, $sql1);
    // if nếu history không có câu hỏi thì xóa session


}
?>