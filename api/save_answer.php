<?php
session_start();
include '../profile/db.php';

if (isset($_SESSION['current_session_id'])) {
    $session_id = $_SESSION['current_session_id'];
    $question_id = $_POST['question_id'];
    $answer_id = $_POST['answer_id'];
    $is_correct = $_POST['is_correct'];
    $day = $_POST['day'];
    $exam_id = $_POST['exam_id'];

    $sql = "INSERT INTO history_answers (session_id, question_id, answer_id, is_correct, day, exam_id) 
            VALUES (?, ?, ?, ?, ?, ?)";
    
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, "iiiiii", $session_id, $question_id, $answer_id, $is_correct, $day, $exam_id);
    mysqli_stmt_execute($stmt);
}
?>