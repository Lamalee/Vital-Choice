<?php
include '../profile/db.php';
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $exam_id = $_POST['exam_id'] ?? null;
    $question_id = $_POST['question_id'] ?? null;

    if ($exam_id && $question_id) {
        $sql = "INSERT INTO exam_questions (exam_id, question_id) VALUES ('$exam_id', '$question_id')";
        
        if ($conn->query($sql)) {
            echo json_encode(["success" => true]);
        } else {
            echo json_encode(["success" => false, "message" => $conn->error]);
        }
    } else {
        echo json_encode(["success" => false, "message" => "Thiếu dữ liệu"]);
    }
} else {
    echo json_encode(["success" => false, "message" => "Yêu cầu không hợp lệ"]);
}
?>