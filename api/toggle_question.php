<?php
include '../profile/db.php';
$exam_id = $_POST['exam_id'];
$question_id = $_POST['question_id'];
$action = $_POST['action'];
$tag = $_POST['tag'] ?? 'null';
if ($action === 'add') {
    $sql = "INSERT IGNORE INTO exam_questions (exam_id, question_id, tag) VALUES ('$exam_id', '$question_id', '$tag')";
} else {
    $sql = "DELETE FROM exam_questions WHERE exam_id = '$exam_id' AND question_id = '$question_id'";
}

if ($conn->query($sql)) {
    echo json_encode(["success" => true]);
} else {
    echo json_encode(["success" => false]);
}