<?php
include '../profile/db.php';
header('Content-Type: application/json');
$session_id = $_POST['session_id'];
$sql = "SELECT h.*, q.content as question_text, a.content as answer_text
FROM history_answers h
JOIN game_sessions g ON h.session_id = g.session_id
JOIN questions q ON h.question_id = q.question_id
JOIN answers a ON h.answer_id = a.answer_id
WHERE  h.session_id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $session_id);
$stmt->execute();
$result = $stmt->get_result();
$history = [];
while ($row = $result->fetch_assoc()) {
    $history[] = $row;
}
echo json_encode($history);
?>