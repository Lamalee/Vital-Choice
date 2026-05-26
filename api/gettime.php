<?php
include '../profile/db.php';
header('Content-Type: application/json');
$exam_id = $_GET['exam_id'];
$sql = "SELECT time FROM exams WHERE exam_id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $exam_id);
$stmt->execute();
$result = $stmt->get_result();
if ($row = $result->fetch_assoc()) {
    echo json_encode([
        "success" => true,
        "time" => $row['time']
    ]);
}
else
    {
        echo json_encode([
            "success" => true,
            "time" => 90
        ]);
    }
$stmt->close();
?>