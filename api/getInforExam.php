<?php
header('Content-Type: application/json');
include '../profile/db.php';

$teacher_id = $_POST['teacher_id'] ?? null;
if (empty($teacher_id)) {
    echo json_encode([]);
    exit;
}

$sql = "SELECT * FROM exams WHERE teacher_id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $teacher_id);
$stmt->execute();
$result = $stmt->get_result();
$data = [];

$countSql = "SELECT tag, COUNT(*) AS total FROM exam_questions WHERE exam_id = ? GROUP BY tag";
$countStmt = $conn->prepare($countSql);

$deleteSql = "DELETE FROM exams WHERE exam_id = ?";
$deleteStmt = $conn->prepare($deleteSql);

while ($row = $result->fetch_assoc()) {
    $exam_id = intval($row['exam_id']);
    $counts = [0 => 0, 1 => 0, 2 => 0];

    $countStmt->bind_param("i", $exam_id);
    $countStmt->execute();
    $countResult = $countStmt->get_result();
    while ($countRow = $countResult->fetch_assoc()) {
        $tag = intval($countRow['tag']);
        if (array_key_exists($tag, $counts)) {
            $counts[$tag] = intval($countRow['total']);
        }
    }

    $invalid = false;
    if ($counts[0] < 7 || $counts[1] < 6 || $counts[2] < 2) {
        $invalid = true;
    }

    if ($invalid) {
        $deleteStmt->bind_param("i", $exam_id);
        $deleteStmt->execute();
        continue;
    }

    $data[] = $row;
}

echo json_encode($data);

$stmt->close();
$countStmt->close();
$deleteStmt->close();
$conn->close();
?>