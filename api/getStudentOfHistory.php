<?php
include '../profile/db.php';
header('Content-Type: application/json');
$exam_id = $_POST['exam_id'];
$sql = "SELECT p.id, p.username, g.ranking, g.session_id FROM players p JOIN game_sessions g ON p.id = g.player_id WHERE g.exam_id = ? ";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $exam_id);
$stmt->execute();
$result = $stmt->get_result();
$students = [];
while ($row = $result->fetch_assoc()) {
    $students[] = $row;
}
echo json_encode($students);
?>