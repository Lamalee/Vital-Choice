<?php
include '../profile/db.php';
header('Content-Type: application/json');
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $content = $_POST['content'];
    $created_by = $_POST['created_by'];
    $tag = $_POST['tag'];
    $ansData = [
        'A' => $_POST['ansA'],
        'B' => $_POST['ansB'],
        'C' => $_POST['ansC'],
        'D' => $_POST['ansD']
    ];
    $correctChoice = $_POST['correct']; 
    $sqlQ = "INSERT INTO questions (content, type, created_by, tag, is_active) VALUES (?, 1, ?, ?, 1)";
    $stmtQ = $conn->prepare($sqlQ);
    $stmtQ->bind_param("sii", $content, $created_by, $tag);
    if ($stmtQ->execute()) {
        $new_q_id = $conn->insert_id;
        $sqlA = "INSERT INTO answers (question_id, choice, content, is_correct) VALUES (?, ?, ?, ?)";
        $stmtA = $conn->prepare($sqlA);
        foreach ($ansData as $choice => $text) {
            $is_correct = ($choice === $correctChoice) ? 1 : 0;
            $stmtA->bind_param("issi", $new_q_id, $choice, $text, $is_correct);
            $stmtA->execute();
        }
        echo json_encode(["success" => true, "new_id" => $new_q_id]);
    } else {
        echo json_encode(["success" => false, "message" => "Lỗi lưu câu hỏi"]);
    }
}
?>