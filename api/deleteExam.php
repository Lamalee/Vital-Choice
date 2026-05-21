<?php
include '../profile/db.php';
header('Content-Type: application/json');
$exam_id = $_POST['exam_id'] ?? 0;
if ($exam_id > 0) {
    $sql = "DELETE FROM exams WHERE exam_id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $exam_id);
    if ($stmt->execute()) {
        echo json_encode(["success" => true]);
    } else {
        echo json_encode(["success" => false, "message" => "Lỗi Database"]);
    }
    $stmt->close();
} else {
    echo json_encode(["success" => false, "message" => "ID không hợp lệ"]);
}
$conn->close();
?>