<?php
include '../profile/db.php';
header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $question_id = $_POST['question_id'] ?? 0;
    
    $sql = "SELECT * FROM questions WHERE question_id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $question_id);
    $stmt->execute();
    $result = $stmt->get_result();
    $question = $result->fetch_assoc();
    $stmt->close();
    
    if (!$question) {
        echo json_encode(["success" => false, "message" => "Câu hỏi không tồn tại"]);
        exit();
    }
    
    $sql = "SELECT * FROM answers WHERE question_id = ? ORDER BY choice ASC";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $question_id);
    $stmt->execute();
    $result = $stmt->get_result();
    $answers = [];
    while ($row = $result->fetch_assoc()) {
        $answers[] = $row;
    }
    $stmt->close();
    
    echo json_encode([
        "success" => true,
        "question" => $question,
        "answers" => $answers
    ]);
} else {
    echo json_encode(["success" => false, "message" => "Invalid request method"]);
}
?>
