<?php
include '../profile/db.php';
header('Content-Type: application/json');
if($_SERVER['REQUEST_METHOD'] === 'POST'){
    $question_id = $_POST['question_id'] ?? 0;
    $question_content = $_POST['content'] ?? '';
    $answerA = $_POST['ansA'] ?? '';
    $answerB = $_POST['ansB'] ?? '';
    $answerC = $_POST['ansC'] ?? '';
    $answerD = $_POST['ansD'] ?? '';
    $correct_answer = $_POST['correct'] ?? 'A';
    $tag = $_POST['tag'] ?? 0;
    
    $sql = "UPDATE questions SET content = ?, tag = ? WHERE question_id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sii", $question_content, $tag, $question_id);
    if (!$stmt->execute()) {
        echo json_encode(["success" => false, "message" => "Lỗi cập nhật câu hỏi"]);
        exit();
    }
    
    $choices = ['A' => $answerA, 'B' => $answerB, 'C' => $answerC, 'D' => $answerD];
    foreach ($choices as $choice => $text) {
        $sql = "SELECT * FROM answers WHERE question_id = ? AND choice = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("is", $question_id, $choice);
        $stmt->execute();
        $result = $stmt->get_result();
        if ($result->num_rows > 0) {
            $sql_update = "UPDATE answers SET content = ?, is_correct = ? WHERE question_id = ? AND choice = ?";
            $stmt_update = $conn->prepare($sql_update);
            $is_correct = ($correct_answer === $choice) ? 1 : 0;
            $stmt_update->bind_param("siss", $text, $is_correct, $question_id, $choice);
            if (!$stmt_update->execute()) {
                echo json_encode(["success" => false, "message" => "Lỗi cập nhật đáp án"]);
                exit();
            }
        } 
    }
    echo json_encode(["success" => true, "message" => "Câu hỏi đã được cập nhật thành công"]);
}
?>