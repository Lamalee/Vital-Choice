<?php
include '../profile/db.php';
    $teacher_id = $_POST['teacher_id'];
    $sql = "SELECT * FROM exams WHERE teacher_id=?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $teacher_id);
    $stmt->execute(); 
    $result = $stmt->get_result();
    $data = [];
    while($row = $result->fetch_assoc()){
        $data[]= $row;
    }
   echo json_encode($data);
   $stmt->close();
   
?>