<?php
session_start();
include '../profile/db.php';
$player_id = $_SESSION['id'];
$sum = mysqli_query($conn, "SELECT * FROM summary_status WHERE player_id = '$player_id'");
$stats = mysqli_fetch_assoc($sum) ?? ["total_games"=>0, "best_score"=>0, "longest_survival"=>0, "wrong_answers"=>0];
$perf = mysqli_query($conn, "SELECT COUNT(*) as t, SUM(is_correct) as c FROM history_answers h JOIN game_sessions s ON h.session_id = s.session_id WHERE s.player_id = '$player_id'");
$p_data = mysqli_fetch_assoc($perf);
$hist = mysqli_query($conn, "SELECT h.session_id, MAX(h.day) as day, SUM(h.is_correct) as c, COUNT(*) as t, s.ranking as rank FROM history_answers h JOIN game_sessions s ON h.session_id = s.session_id WHERE s.player_id = '$player_id' GROUP BY h.session_id ORDER BY h.session_id DESC LIMIT 10");
$history = [];
while($r = mysqli_fetch_assoc($hist)) { $history[] = $r; }
echo json_encode([
    "user" => ["name" => $_SESSION['username'], "id" => $player_id],
    "stats" => $stats,
    "overall" => $p_data,
    "history" => $history
]);
?>