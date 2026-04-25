<?php
include 'db.php';
$type = $_GET['type'];
$tag = $_GET['tag'];
$sql = "SELECT * FROM questions WHERE type=? AND tag=? ORDER BY RAND() LIMIT 1";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ii", $type, $tag);
$stmt->execute();
$result = $stmt->get_result();
$data = $result->fetch_assoc();
$question_id = $data['question_id'];
$sql1 = "SELECT * FROM answers WHERE question_id=?";
$stmt1 = $conn->prepare($sql1);
$stmt1->bind_param("i", $question_id);
$stmt1->execute();
$result1 = $stmt1->get_result();
$answers = [];
while ($row = $result1->fetch_assoc()) {
$row['content'] = preg_replace('/^[A-D]\.\s*/', '', $row['content']);
$answers[] = $row;
}
shuffle($answers);
echo json_encode([
"question" => $data['content'],
"answers" => $answers
]);