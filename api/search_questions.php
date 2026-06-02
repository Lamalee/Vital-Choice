<?php 
include '../profile/db.php';
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $created_by = $_POST['created_by'] ?? 0;
    $difficulty = $_POST['difficulty'] ?? 3; // 
    $keyword = $_POST['keyword'] ?? '';
    $sql = "SELECT * FROM questions WHERE created_by = $created_by AND is_active = 1";
    
    if ($difficulty != 3) {
        $sql .= " AND tag = $difficulty";
    }
    
    if (!empty($keyword)) {
        $sql .= " AND content LIKE '%$keyword%'";
    }
    $sql .= " ORDER BY question_id ASC";
    
    $result = $conn->query($sql);
    $questions = [];
    
    if ($result) {
        while($row = $result->fetch_assoc()) {
            $questions[] = $row;
        }
        echo json_encode(["success" => true, "questions" => $questions]);
    } else {
        echo json_encode(["success" => false, "message" => "Lỗi truy xuất dữ liệu"]);
    }
}
?>