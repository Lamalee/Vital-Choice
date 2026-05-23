<?php
include '../profile/db.php';
session_start();
if(!isset($_SESSION['id']) || $_SESSION['role'] != 2){
    header("Location: ../login_register/login.php");
    exit;
}
?>

<!DOCTYPE html>
<html lang="vi">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Vital Admin</title>

    <link rel="stylesheet" href="admin.css">

    <link href="https://fonts.googleapis.com/css2?family=Pixelify+Sans:wght@400..700&display=swap" rel="stylesheet">
    <script src="admin.js"></script>
</head>

<body>

<div class="container">
    <div class="logout">
        <a href="../api/logout.php"><button>Đăng xuất</button></a>
    </div>
    <div class="header">
        <h1>Vital Admin</h1>
    </div>

    <div class="table-container">

        <div class="table-header">
            <h2>👥 User Management</h2>
        </div>

        <div class="table-wrapper">

            <table id="playerTable">

                <thead>
                    <tr>
                        <th>ID Player</th>
                        <th>Username</th>
                        <th>Role</th>
                        <th>Created At</th>
                    </tr>
                </thead>

                <tbody>

                <?php

    $sql = "SELECT * FROM players WHERE (role = 0 AND pending = 1) OR (role = 1 AND pending = 1)";
    $result = $conn->query($sql);

    while ($u = $result->fetch_assoc()) {

    $rowClass = ($u['status'] == 0) ? "banned" : "";

    echo "<tr class='$rowClass'>";

    echo "<td class='id-cell'>{$u['id']}</td>";

    echo "<td>{$u['username']}</td>";

    if($u['role'] == 0){

        $roleDisplay = "student";

    } else {

        $roleDisplay = "teacher";

    }

    echo "<td>$roleDisplay</td>";

    echo "<td>{$u['created_at']}</td>";

    echo "</tr>";

}
                ?>
                </tbody>

            </table>

        </div>

    </div>

    <div class="table-container">

        <div class="table-header">
            <h2>👤 Pending Approvals</h2>
        </div>

        <div class="table-wrapper">

            <table id="pendingTable">

                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Username</th>
                        <th>Role</th>
                        <th>Created At</th>
                    </tr>
                </thead>

                <tbody>

                <?php

                $sql = "SELECT * FROM players WHERE pending = 0 ORDER BY created_at DESC";
                $result = $conn->query($sql);

                while ($p = $result->fetch_assoc()) {

                    echo "<tr>";

                    echo "<td class='id-cell'>{$p['id']}</td>";

                    echo "<td>{$p['username']}</td>";

                    if($p['role'] == 0){

                        $roleDisplay = "student";

                    } else {

                        $roleDisplay = "teacher";

                    }

                    echo "<td>$roleDisplay</td>";

                    echo "<td>{$p['created_at']}</td>";

                    echo "</tr>";

                }
                ?>
                </tbody>

            </table>

        </div>

    </div>

    <div class="table-container">

        <div class="table-header">
            <h2>📋 Pending Exam Approvals</h2>
        </div>

        <div class="table-wrapper">

            <table id="pendingExamTable">

                <thead>
                    <tr>
                        <th>Exam ID</th>
                        <th>Teacher ID</th>
                        <th>Exam Code</th>
                        <th>Created At</th>
                    </tr>
                </thead>

                <tbody>

                <?php

                $sql = "SELECT * FROM exams WHERE pending = 0 ORDER BY created_at DESC";
                $result = $conn->query($sql);

                while ($e = $result->fetch_assoc()) {

                    echo "<tr>";

                    echo "<td>{$e['exam_id']}</td>";
                    echo "<td>{$e['teacher_id']}</td>";
                    echo "<td>{$e['exam_code']}</td>";
                    echo "<td>{$e['created_at']}</td>";

                    echo "</tr>";

                }

                ?>

                </tbody>

            </table>

        </div>

    </div>

    <div class="table-container">

        <div class="table-header">
            <h2>📚 Exam Management</h2>
        </div>

        <div class="table-wrapper">

            <table id="examTable">

                <thead>
                    <tr>
                        <th>Exam ID</th>
                        <th>Teacher ID</th>
                        <th>Created At</th>
                        <th>Exam Code</th>
                    </tr>
                </thead>

                <tbody>

                <?php

                $sql = "SELECT * FROM exams WHERE pending = 1";
                $result = $conn->query($sql);

                while ($e = $result->fetch_assoc()) {

                    echo "<tr>";

                    echo "<td>{$e['exam_id']}</td>";
                    echo "<td>{$e['teacher_id']}</td>";
                    echo "<td>{$e['created_at']}</td>";
                    echo "<td>{$e['exam_code']}</td>";

                    echo "</tr>";
                }

                ?>

                </tbody>

            </table>

        </div>

    </div>

</div>

<div id="contextMenu" class="context-menu">

    <div id="playerActions">

        <div class="context-menu-item" id="banAccount">
            🚫 Cấm tài khoản
        </div>

        <div class="context-menu-item" id="deleteAccount">
            🗑️ Xóa tài khoản
        </div>
        <div class="context-menu-item" id="unbanAccount">
            🔓 Mở cấm tài khoản
        </div>
    </div>

    <div id="pendingActions" style="display:none;">

        <div class="context-menu-item" id="approveAccount">
            ✅ Phê duyệt tài khoản
        </div>

        <div class="context-menu-item" id="deletePendingAccount">
            ❌ Từ chối phê duyệt
        </div>

    </div>

    <div id="examActions" style="display:none;">

        <div class="context-menu-item" id="viewExam">
            👁️ Xem đề
        </div>

        <div class="context-menu-item" id="deleteExam">
            🗑️ Xóa exam
        </div>

    </div>

    <div id="pendingExamActions" style="display:none;">

        <div class="context-menu-item" id="viewPendingExam">
            👁️ Xem đề
        </div>

        <div class="context-menu-item" id="approvePendingExam">
            ✅ Phê duyệt đề thi
        </div>

        <div class="context-menu-item" id="denyPendingExam">
            ❌ Từ chối đề thi
        </div>

    </div>

</div>

<div id="playerModal" class="modal">

    <div class="modal-content">

        <span class="close">&times;</span>

        <h2 id="modalTitle"></h2>

        <div id="playerInfo"></div>

    </div>

</div>
<div id="popup" class="popup">

    <div class="popup-content">

        <p id="popupText"></p>

        <div class="popup-btns">

            <button id="popupOk">OK</button>

            <button id="popupCancel">Hủy</button>

        </div>

    </div>

</div>
<div id="examPopup" class="modal">

    <div class="modal-content exam-popup-content">

        <span id="closeExamPopup" class="close">&times;</span>

        <h2>📚 Danh sách câu hỏi</h2>

        <div id="questionList"></div>

    </div>

</div>

<div id="denyReasonModal" class="modal">

    <div class="modal-content">

        <span class="close" id="closeDenyModal">&times;</span>

        <h2>Lý do từ chối</h2>

        <textarea id="denyReason" placeholder="Nhập lý do từ chối..." rows="5"></textarea>

        <div class="modal-buttons">
            <button id="confirmDeny">Xác nhận</button>
            <button id="cancelDeny">Hủy</button>
        </div>

    </div>

</div>

</body>
</html>
