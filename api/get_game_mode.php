<?php
session_start();
include '../profile/db.php';
$session_id = $_SESSION['current_session_id'];
$stmt = $conn->prepare("SELECT mode FROM game_sessions WHERE session_id = ?");
$stmt->bind_param("i", $session_id);
$stmt->execute();
$result = $stmt->get_result();
if ($row = $result->fetch_assoc()) {
    echo json_encode(['mode' => (int)$row['mode']]);
}
$stmt->close();
?>
