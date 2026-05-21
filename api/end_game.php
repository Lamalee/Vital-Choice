<?php
session_start();
include '../profile/db.php';
if (isset($_SESSION['current_session_id']) && isset($_SESSION['id'])) {
    $session_id = $_SESSION['current_session_id'];
    $player_id = $_SESSION['id'];
    $current_day = $_POST['day'];
    $sql_perf = "SELECT COUNT(*) as total, SUM(is_correct) as correct 
                 FROM history_answers WHERE session_id = '$session_id'";
    $res_perf = mysqli_query($conn, $sql_perf);
    $perf = mysqli_fetch_assoc($res_perf);
    $session_score = ($perf['total'] > 0) ? round(($perf['correct'] * 100) / $perf['total']) : 0;
    $session_wrongs = $perf['total'] - $perf['correct'];
    $sql_update = "INSERT INTO summary_status (player_id, total_games, best_score, longest_survival, wrong_answers) 
                   VALUES ('$player_id', 1, '$session_score', '$current_day', '$session_wrongs')
                   ON DUPLICATE KEY UPDATE 
                   total_games = total_games + 1,
                   wrong_answers = wrong_answers + $session_wrongs,
                   best_score = GREATEST(best_score, $session_score),
                   longest_survival = GREATEST(longest_survival, $current_day)";
    mysqli_query($conn, $sql_update);
   
    unset($_SESSION['current_session_id']); 
}
?>