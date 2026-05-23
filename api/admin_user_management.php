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

// Delete user
if ($action === "delete_user") {
    $getUserSql = "SELECT username, email, pending FROM players WHERE id = $id";
    $userResult = $conn->query($getUserSql);
    $userInfo = $userResult->fetch_assoc();

    $sql = "DELETE FROM players WHERE id = $id";

    if ($conn->query($sql)) {
        if ($userInfo && $userInfo['pending'] == 0 && !empty($userInfo['email'])) {
            sendRejectionEmail($userInfo['email'], $userInfo['username'], 0);
        }
        echo "success";
    } else {
        echo "error";
    }
    exit;
}

// Ban user
if ($action === "ban_user") {
    $getUserSql = "SELECT username, email, role FROM players WHERE id = $id";
    $userResult = $conn->query($getUserSql);
    $userInfo = $userResult->fetch_assoc();

    $sql = "UPDATE players SET status = 0 WHERE id = $id";

    if ($conn->query($sql)) {
        if ($userInfo && !empty($userInfo['email'])) {
            sendBanEmail($userInfo['email'], $userInfo['username']);
        }
        echo "success";
    } else {
        echo "error";
    }
    exit;
}

// Unban user
if ($action === "unban_user") {
    $getUserSql = "SELECT username, email, role FROM players WHERE id = $id";
    $userResult = $conn->query($getUserSql);
    $userInfo = $userResult->fetch_assoc();

    $sql = "UPDATE players SET status = 1 WHERE id = $id";

    if ($conn->query($sql)) {
        if ($userInfo && !empty($userInfo['email'])) {
            sendUnbanEmail($userInfo['email'], $userInfo['username']);
        }
        echo "success";
    } else {
        echo "error";
    }
    exit;
}

// Approve user
if ($action === "approve_user") {
    $getUserSql = "SELECT username, email, role FROM players WHERE id = $id";
    $userResult = $conn->query($getUserSql);
    $userInfo = $userResult->fetch_assoc();

    $sql = "UPDATE players SET pending = 1 WHERE id = $id";

    if ($conn->query($sql)) {
        if ($userInfo && !empty($userInfo['email'])) {
            sendApprovalEmail($userInfo['email'], $userInfo['username'], $userInfo['role']);
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
