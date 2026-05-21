<?php
include '../profile/db.php';
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $exam_id = $_POST['exam_id'] ?? 0;
    $created_by = $_POST['created_by'] ?? 0;
    $page = $_POST['page'] ?? 1;
    $limit = 10;
    $offset = ($page - 1) * $limit;
    $total_res = $conn->query("SELECT COUNT(*) as total FROM questions WHERE created_by = $created_by AND is_active = 1");
    $total_questions = $total_res->fetch_assoc()['total'];
    $total_pages = ceil($total_questions / $limit);
    $sql = "SELECT q.*, (CASE WHEN eq.exam_id IS NULL THEN 0 ELSE 1 END) as is_selected 
            FROM questions q 
            LEFT JOIN exam_questions eq ON q.question_id = eq.question_id AND eq.exam_id = $exam_id
            WHERE q.created_by = $created_by AND q.is_active = 1
            ORDER BY q.question_id ASC LIMIT $limit OFFSET $offset";
    $result = $conn->query($sql);
    $questions = [];
    
    if ($result) {
        while($row = $result->fetch_assoc()) {
            $questions[] = $row;
        }
        echo json_encode([
            "success" => true,
            "questions" => $questions,
            "total_pages" => $total_pages,
            "current_page" => (int)$page
        ]);
    } else {
        echo json_encode(["success" => false, "message" => "Lỗi truy vấn SQL"]);
    }

} 
?>