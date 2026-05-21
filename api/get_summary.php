<?php
session_start();
include '../profile/db.php';
header('Content-Type: application/json');

$player_id = $_SESSION['id'] ?? null;

if (!$player_id) {
    echo json_encode(["success" => false, "message" => "User not logged in"]);
    exit;
}


$sessionResult = mysqli_query(
    $conn,
    "SELECT session_id, ranking 
     FROM game_sessions 
     WHERE player_id = '$player_id' 
     ORDER BY session_id DESC 
     LIMIT 1"
);

if (!$sessionResult || mysqli_num_rows($sessionResult) == 0) {
    echo json_encode([
        "success" => true,
        "data" => [
            "rank" => null,
            "correct" => 0,
            "wrong" => 0,
            "details" => []
        ]
    ]);
    exit;
}

$session = mysqli_fetch_assoc($sessionResult);
$session_id = intval($session['session_id']);
$rank = $session['ranking'];

$summaryResult = mysqli_query(
    $conn,
    "SELECT 
        COUNT(*) AS total, 
        SUM(is_correct = 1) AS correct
     FROM history_answers 
     WHERE session_id = '$session_id'"
);

$summary = mysqli_fetch_assoc($summaryResult);
$total = intval($summary['total']);
$correct = intval($summary['correct']);
$wrong = $total - $correct;

$detailsResult = mysqli_query(
    $conn,
    "SELECT h.question_id, q.content, h.is_correct
     FROM history_answers h 
     LEFT JOIN questions q 
     ON h.question_id = q.question_id
     WHERE h.session_id = '$session_id'
     ORDER BY h.id ASC"
);

$details = [];
while ($row = mysqli_fetch_assoc($detailsResult)) {
    $details[] = [
        "question_id" => intval($row['question_id']),
        "content"     => $row['content'],  
        "is_correct"  => intval($row['is_correct']) === 1
    ];
}

echo json_encode([
    "success" => true,
    "data" => [
        "rank" => $rank,
        "correct" => $correct,
        "wrong" => $wrong,
        "details" => $details
    ]
]);
?>