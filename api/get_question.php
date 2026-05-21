<?php
session_start();
include '../profile/db.php';
header('Content-Type: application/json');
$exam_id = $_POST['exam_id'] ?? null;
$type = $_POST['type'] ?? 0;
$tag = $_POST['tag'] ?? 0;
$data = null;

if ($exam_id && $exam_id !== 'null' && $exam_id !== '') {
    if (empty($_SESSION['exam_questions_queue'])) {
        $resQ = mysqli_query($conn, "SELECT question_id FROM exam_questions WHERE exam_id = $exam_id");
        $all_ids = [];
        while ($q = mysqli_fetch_assoc($resQ)) {
            $all_ids[] = (int)$q['question_id'];
        }
        shuffle($all_ids); 
        $_SESSION['exam_questions_queue'] = $all_ids;
    }
    if (!empty($_SESSION['exam_questions_queue'])) {
        $question_id = array_shift($_SESSION['exam_questions_queue']);
        $sql = "SELECT * FROM questions WHERE question_id = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("i", $question_id);
        $stmt->execute();
        $data = $stmt->get_result()->fetch_assoc();
    }
}
if (!$data && (!$exam_id || $exam_id === 'null' || $exam_id === '')) {
    $sql = "SELECT * FROM questions WHERE type = ? AND tag = ? ORDER BY RAND() LIMIT 1";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ii", $type, $tag);
    $stmt->execute();
    $data = $stmt->get_result()->fetch_assoc();
}
if (!$data) {
    echo json_encode(["error" => "No question found"]);
    exit();
}
$question_id = $data['question_id'];
$sql1 = "SELECT * FROM answers WHERE question_id = ?";
$stmt1 = $conn->prepare($sql1);
$stmt1->bind_param("i", $question_id);
$stmt1->execute();
$result1 = $stmt1->get_result();
$answers = [];
while ($row = $result1->fetch_assoc()) {
    $answers[] = $row;
}
shuffle($answers); 
echo json_encode([
    "question_id" => $data['question_id'],
    "question" => $data['content'],
    "answers" => $answers
]);

if(isset($stmt)) $stmt->close();
$stmt1->close();
$conn->close();
?>