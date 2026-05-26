<?php
session_start();
include '../profile/db.php';
header('Content-Type: application/json');
$exam_id = $_POST['exam_id'] ?? null;
$type = $_POST['type'] ?? 0;
$tag = $_POST['tag'] ?? 0;
$data = null;

if ($exam_id && $exam_id !== 'null' && $exam_id !== '') {
    if ($tag == 0) {
        if (empty($_SESSION['exam_questions_queue_0'])) {
            $resQ = mysqli_query($conn, "SELECT question_id FROM exam_questions WHERE exam_id = $exam_id AND tag = 0");
            $all_ids = [];
            while ($q = mysqli_fetch_assoc($resQ)) {
                $all_ids[] = (int)$q['question_id'];
            }
            shuffle($all_ids);
            $_SESSION['exam_questions_queue_0'] = $all_ids;
        }
        if (!empty($_SESSION['exam_questions_queue_0'])) {
            $question_id = array_shift($_SESSION['exam_questions_queue_0']);
            $sql = "SELECT * FROM questions WHERE question_id = ?";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("i", $question_id);
            $stmt->execute();
            $data = $stmt->get_result()->fetch_assoc();
        }
    }
    if ($tag == 1) {
        if (empty($_SESSION['exam_questions_queue_1'])) {
            $resQ = mysqli_query($conn, "SELECT question_id FROM exam_questions WHERE exam_id = $exam_id AND tag = 1");
            $all_ids = [];
            while ($q = mysqli_fetch_assoc($resQ)) {
                $all_ids[] = (int)$q['question_id'];
            }
            shuffle($all_ids);
            $_SESSION['exam_questions_queue_1'] = $all_ids;
        }
        if (!empty($_SESSION['exam_questions_queue_1'])) {
            $question_id = array_shift($_SESSION['exam_questions_queue_1']);
            $sql = "SELECT * FROM questions WHERE question_id = ?";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("i", $question_id);
            $stmt->execute();
            $data = $stmt->get_result()->fetch_assoc();
        }
    }
    if ($tag == 2) {
        if (empty($_SESSION['exam_questions_queue_2'])) {
            $resQ = mysqli_query($conn, "SELECT question_id FROM exam_questions WHERE exam_id = $exam_id AND tag = 2");
            $all_ids = [];
            while ($q = mysqli_fetch_assoc($resQ)) {
                $all_ids[] = (int)$q['question_id'];
            }
            shuffle($all_ids);
            $_SESSION['exam_questions_queue_2'] = $all_ids;
        }
        if (!empty($_SESSION['exam_questions_queue_2'])) {
            $question_id = array_shift($_SESSION['exam_questions_queue_2']);
            $sql = "SELECT * FROM questions WHERE question_id = ?";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("i", $question_id);
            $stmt->execute();
            $data = $stmt->get_result()->fetch_assoc();
        }
    }
}
if (!$data && (!$exam_id || $exam_id === 'null' || $exam_id === '')) {
    if ($tag == 0) {
        if (empty($_SESSION['exam_questions_queue_0'])) {
            $resQ = mysqli_query($conn, "SELECT question_id FROM questions WHERE type = 0 AND tag = 0");
            $all_ids = [];
            while ($q = mysqli_fetch_assoc($resQ)) {
                $all_ids[] = (int)$q['question_id'];
            }
            shuffle($all_ids);
            $_SESSION['exam_questions_queue_0'] = $all_ids;
        }
        if (!empty($_SESSION['exam_questions_queue_0'])) {
            $question_id = array_shift($_SESSION['exam_questions_queue_0']);
            $sql = "SELECT * FROM questions WHERE question_id = ?";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("i", $question_id);
            $stmt->execute();
            $data = $stmt->get_result()->fetch_assoc();
        }
    }
    if ($tag == 1) {
        if (empty($_SESSION['exam_questions_queue_1'])) {
            $resQ = mysqli_query($conn, "SELECT question_id FROM questions WHERE type = 0 AND tag = 1");
            $all_ids = [];
            while ($q = mysqli_fetch_assoc($resQ)) {
                $all_ids[] = (int)$q['question_id'];
            }
            shuffle($all_ids);
            $_SESSION['exam_questions_queue_1'] = $all_ids;
        }
        if (!empty($_SESSION['exam_questions_queue_1'])) {
            $question_id = array_shift($_SESSION['exam_questions_queue_1']);
            $sql = "SELECT * FROM questions WHERE question_id = ?";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("i", $question_id);
            $stmt->execute();
            $data = $stmt->get_result()->fetch_assoc();
        }
    }
    if ($tag == 2) {
        if (empty($_SESSION['exam_questions_queue_2'])) {
            $resQ = mysqli_query($conn, "SELECT question_id FROM questions WHERE type = 0 AND tag = 2");
            $all_ids = [];
            while ($q = mysqli_fetch_assoc($resQ)) {
                $all_ids[] = (int)$q['question_id'];
            }
            shuffle($all_ids);
            $_SESSION['exam_questions_queue_2'] = $all_ids;
        }
        if (!empty($_SESSION['exam_questions_queue_2'])) {
            $question_id = array_shift($_SESSION['exam_questions_queue_2']);
            $sql = "SELECT * FROM questions WHERE question_id = ?";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("i", $question_id);
            $stmt->execute();
            $data = $stmt->get_result()->fetch_assoc();
        }
    }
}
if (!$data) {
    echo json_encode(["error" => "No question found"]);
    exit();
}
$question_id = $data['question_id'];
$sql1 = "SELECT * FROM answers WHERE question_id = ?";
$stmt1 = $conn->prepare($sql1);
$stmt1->bind_param("i", $question_id);
$stmt1->execute();
$result1 = $stmt1->get_result();
$answers = [];
while ($row = $result1->fetch_assoc()) {
    $answers[] = $row;
}
shuffle($answers);
echo json_encode([
    "question_id" => $data['question_id'],
    "question" => $data['content'],
    "answers" => $answers
]);

if (isset($stmt)) $stmt->close();
$stmt1->close();
$conn->close();
