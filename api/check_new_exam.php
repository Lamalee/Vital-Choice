<?php
header('Content-Type: application/json');
include '../profile/db.php';


$exam_id = $_POST['exam_id'] ?? null;

$exam_id = intval($exam_id);

$sql = "SELECT tag, COUNT(*) AS total FROM exam_questions WHERE exam_id = ? GROUP BY tag";
$stmt = $conn->prepare($sql);

$stmt->bind_param("i", $exam_id);
$stmt->execute();
$result = $stmt->get_result();

$counts = [0 => 0, 1 => 0, 2 => 0];
while ($row = $result->fetch_assoc()) {
    $tag = intval($row['tag']);
    if (array_key_exists($tag, $counts)) {
        $counts[$tag] = intval($row['total']);
    }
}

$errors = [];
if ($counts[0] < 7) {
    $errors[] = "Số lượng câu hỏi dễ tối thiểu phải là 7!";
}
if ($counts[1] < 6) {
    $errors[] = "Số lượng câu hỏi trung bình tối thiểu phải là 6!";
}
if ($counts[2] < 2) {
    $errors[] = "Số lượng câu hỏi khó tối thiểu phải là 2!";
}

if (!empty($errors)) {
    echo json_encode(["success" => false, "message" => implode(" ", $errors)]);
    exit;
}

echo json_encode(["success" => true]);
