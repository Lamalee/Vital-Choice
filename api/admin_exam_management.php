<?php
include '../profile/db.php';
include 'send_email.php';
session_start();

// Check admin access
if (!isset($_SESSION['id']) || $_SESSION['role'] != 2) {
    http_response_code(403);
    echo "error";
    exit;
}

if ($_SERVER["REQUEST_METHOD"] !== "POST") {
    http_response_code(405);
    echo "error";
    exit;
}

$action = $_POST['action'] ?? '';
$id = intval($_POST['id'] ?? 0);

// Delete exam
if ($action === "delete_exam") {
    $sql = "DELETE FROM exams WHERE exam_id = $id";
    echo $conn->query($sql) ? "success" : "error";
    exit;
}

// Get exam questions
if ($action === "get_questions") {
    header("Content-Type: application/json");

    $sql = "SELECT q.* FROM questions q 
            JOIN exam_questions eq ON q.question_id = eq.question_id
            WHERE eq.exam_id = $id";

    $result = $conn->query($sql);

    if (!$result) {
        echo json_encode(["error" => $conn->error]);
        exit;
    }

    $data = [];
    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }

    echo json_encode($data);
    exit;
}

// Approve exam
if ($action === "approve_exam") {
    $getExamSql = "SELECT e.exam_code, e.teacher_id, p.username, p.email FROM exams e 
                   JOIN players p ON e.teacher_id = p.id 
                   WHERE e.exam_id = $id";
    $examResult = $conn->query($getExamSql);
    $examInfo = $examResult->fetch_assoc();

    $sql = "UPDATE exams SET pending = 1 WHERE exam_id = $id";

    if ($conn->query($sql)) {
        if ($examInfo && !empty($examInfo['email'])) {
            sendExamApprovalEmail($examInfo['email'], $examInfo['username'], $examInfo['exam_code']);
        }
        echo "success";
    } else {
        echo "error";
    }
    exit;
}

// Deny exam
if ($action === "deny_exam") {
    $getExamSql = "SELECT e.exam_code, e.teacher_id, p.username, p.email FROM exams e 
                   JOIN players p ON e.teacher_id = p.id 
                   WHERE e.exam_id = $id";
    $examResult = $conn->query($getExamSql);
    $examInfo = $examResult->fetch_assoc();

    $reason = $_POST['reason'] ?? '';

    $sql = "DELETE FROM exams WHERE exam_id = $id";

    if ($conn->query($sql)) {
        if ($examInfo && !empty($examInfo['email'])) {
            sendExamRejectionEmail($examInfo['email'], $examInfo['username'], $examInfo['exam_code'], $reason);
        }
        echo "success";
    } else {
        echo "error";
    }
    exit;
}

http_response_code(400);
echo "error";
?>

