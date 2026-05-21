<?php
include '../profile/db.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $question_id = $_POST['question_id'] ?? 0;

    if (!$question_id) {
        echo json_encode(["success" => false, "message" => "Thiếu thông tin"]);
        exit();
    }

    // Check if the question exists in history_answers
    $check_sql = "SELECT COUNT(*) as count FROM history_answers WHERE question_id = $question_id";
    $check_result = $conn->query($check_sql);
    $row = $check_result->fetch_assoc();
    $exists_in_history = $row['count'] > 0;

    if ($exists_in_history) {
        // If question is used in history, mark as inactive
        $update_sql = "UPDATE questions SET is_active = 0 WHERE question_id = $question_id";
        
        if ($conn->query($update_sql)) {
            echo json_encode(["success" => true, "message" => "Câu hỏi đã được vô hiệu hóa"]);
        } else {
            echo json_encode(["success" => false, "message" => "Lỗi cập nhật câu hỏi: " . $conn->error]);
        }
    } else {
        // If not used, permanently delete it
        // First delete from exam_questions (foreign key constraint)
        $delete_exam_sql = "DELETE FROM exam_questions WHERE question_id = $question_id";
        $conn->query($delete_exam_sql);

        // Then delete the question
        $delete_sql = "DELETE FROM questions WHERE question_id = $question_id";
        
        if ($conn->query($delete_sql)) {
            echo json_encode(["success" => true, "message" => "Xóa câu hỏi thành công"]);
        } else {
            echo json_encode(["success" => false, "message" => "Lỗi xóa câu hỏi: " . $conn->error]);
        }
    }
} else {
    echo json_encode(["success" => false, "message" => "Phương thức không được hỗ trợ"]);
}
?>
