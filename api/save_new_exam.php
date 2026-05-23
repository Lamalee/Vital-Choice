<?php
include '../profile/db.php';
header('Content-Type: application/json');
$exam_code = $_POST['exam_code'];
$content = $_POST['content'];
$teacher_id = $_POST['teacher_id'];
$time = $_POST['time'];

// Insert exam with pending = 0 (waiting for approval)
$sql = "INSERT INTO exams (exam_code, teacher_id, created_at, content, time, pending) VALUES (?, ?, NOW(), ?, ?, 0)";
$stmt = $conn->prepare($sql);
$stmt->bind_param("sisi", $exam_code, $teacher_id, $content, $time);
if ($stmt->execute()) {
    $new_id = $conn->insert_id;
    echo json_encode(["success" => true, "exam_id" => $new_id]);
} else {
    echo json_encode(["success" => false, "message" => "Lỗi tạo đề"]);
}
$stmt->close();
?>