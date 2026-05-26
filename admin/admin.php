<?php
include '../profile/db.php';
session_start();
if(!isset($_SESSION['id']) || $_SESSION['role'] != 2){
    header("Location: login.php");
    exit;
}

if ($_SERVER["REQUEST_METHOD"] === "POST") {

    $type = $_POST['type'] ?? '';
    $id = intval($_POST['id'] ?? 0);

    if ($type === "delete_user") {

        $sql = "DELETE FROM players WHERE id = $id";

        echo $conn->query($sql) ? "success" : "error";

        exit;
    }

    if ($type === "delete_exam") {

        $sql = "DELETE FROM exams WHERE exam_id = $id";

        echo $conn->query($sql) ? "success" : "error";

        exit;
    }

    if ($type === "get_questions") {

        header("Content-Type: application/json");

        $sql = " SELECT q.* FROM questions q  JOIN exam_questions eq ON q.question_id = eq.question_id
        WHERE eq.exam_id = $id";

        $result = $conn->query($sql);

        if (!$result) {

            echo json_encode([
                "error" => $conn->error
            ]);

            exit;
        }

        $data = [];

        while ($row = $result->fetch_assoc()) {

            $data[] = $row;

        }

        echo json_encode($data);

        exit;
    }

    if ($type === "ban_user") {

        $sql = "UPDATE players SET status = 0 WHERE id = $id";

        echo $conn->query($sql) ? "success" : "error";

        exit;
    }

    if ($type === "unban_user") {

        $sql = "UPDATE players SET status = 1 WHERE id = $id";

        echo $conn->query($sql) ? "success" : "error";

        exit;
    }
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

                $sql = "SELECT * FROM players WHERE role = 0 OR role = 1 ";
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

                $sql = "SELECT * FROM exams";
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
    <div id="examActions" style="display:none;">

        <div class="context-menu-item" id="viewExam">
            👁️ Xem đề
        </div>

        <div class="context-menu-item" id="deleteExam">
            🗑️ Xóa exam
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
<script>

document.addEventListener("DOMContentLoaded", () => {

    let currentRow = null;
    let currentType = "";

    const contextMenu = document.getElementById("contextMenu");
    const playerMenu = document.getElementById("playerActions");
    const examMenu = document.getElementById("examActions");

    const modal = document.getElementById("playerModal");
    const modalTitle = document.getElementById("modalTitle");
    const modalContent = document.getElementById("playerInfo");
    const closeBtn = document.querySelector("#playerModal .close");

    const popup = document.getElementById("popup");
    const popupText = document.getElementById("popupText");
    const popupOk = document.getElementById("popupOk");
    const popupCancel = document.getElementById("popupCancel");

    const examPopup = document.getElementById("examPopup");
    const questionList = document.getElementById("questionList");
    const closeExamPopup = document.getElementById("closeExamPopup");

    function showMessage(message){

        popup.style.display = "flex";

        popupText.innerText = message;

        popupCancel.style.display = "none";

        popupOk.onclick = () => {

            popup.style.display = "none";

        };

    }

    function showConfirm(message,onOk){

        popup.style.display = "flex";

        popupText.innerText = message;

        popupCancel.style.display = "inline-block";

        popupOk.onclick = () => {

            popup.style.display = "none";

            onOk();

        };

        popupCancel.onclick = () => {

            popup.style.display = "none";

        };

    }
async function loadExamQuestions(examId) {

    try {

        const response = await fetch("admin.php", {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: `type=get_questions&id=${examId}`
        });

        const data = await response.json();

        questionList.innerHTML = "";
        if (!Array.isArray(data) || data.length === 0) {
            questionList.innerHTML = `
                <p style="text-align:center;color:#999;">
                    Không có câu hỏi
                </p>
            `;

        } else {
            data.forEach((item, index) => {
                const wrapper = document.createElement("div");
                wrapper.className = "question-item";

                const title = document.createElement("h3");
                title.innerText = `Câu ${index + 1}`;

                const content = document.createElement("div");
                content.innerText = item.content; 

                wrapper.appendChild(title);
                wrapper.appendChild(content);

                questionList.appendChild(wrapper);
            });
        }

        examPopup.style.display = "flex";

    } catch (error) {

        console.log(error);
        showMessage("❌ Lỗi tải câu hỏi (server hoặc JSON)");

    }
}

    document.addEventListener("click",(e) => {

        if(!contextMenu.contains(e.target)){

            contextMenu.style.display = "none";

        }

    });

    document.addEventListener("contextmenu",(e) => {

        const row = e.target.closest("tbody tr");

        if(!row) return;

        const playerTable = row.closest("#playerTable");
        const examTable = row.closest("#examTable");

        if(!playerTable && !examTable) return;

        e.preventDefault();

        currentRow = row;

        if(playerTable){

            currentType = "player";

            playerMenu.style.display = "block";

            examMenu.style.display = "none";

        }

        if(examTable){

            currentType = "exam";

            playerMenu.style.display = "none";

            examMenu.style.display = "block";

        }

        contextMenu.style.display = "block";

        contextMenu.style.left = e.clientX + "px";

        contextMenu.style.top = e.clientY + "px";

    });

    document.querySelectorAll("#playerTable tbody tr").forEach(row => {

        row.addEventListener("click",() => {

            currentRow = row;

            currentType = "player";

            const cells = row.children;

            modalTitle.innerText = "👤 User Information";

            modalContent.innerHTML = `
                <div class="modal-info">

                    <p><strong>ID:</strong> <span>${cells[0].innerText}</span></p>

                    <p><strong>Username:</strong> <span>${cells[1].innerText}</span></p>

                    <p><strong>Role:</strong> 
                        <span class="role-badge">${cells[2].innerText}</span>
                    </p>

                    <p><strong>Created At:</strong> 
                        <span>${cells[3].innerText}</span>
                    </p>

                </div>
            `;

            modal.style.display = "flex";

        });

    });

    document.querySelectorAll("#examTable tbody tr").forEach(row => {

        row.addEventListener("click",() => {

            currentRow = row;

            currentType = "exam";

            const cells = row.children;

            modalTitle.innerText = "📚 Exam Information";

            modalContent.innerHTML = `
                <div class="modal-info">

                    <p><strong>Exam ID:</strong> 
                        <span>${cells[0].innerText}</span>
                    </p>

                    <p><strong>Teacher ID:</strong> 
                        <span>${cells[1].innerText}</span>
                    </p>

                    <p><strong>Created At:</strong> 
                        <span>${cells[2].innerText}</span>
                    </p>

                    <p><strong>Exam Code:</strong> 
                        <span class="exam-code">${cells[3].innerText}</span>
                    </p>

                    <br>

                    <button class="btn-view-exam">
                        👁️ Xem đề
                    </button>

                </div>
            `;

            modal.style.display = "flex";

        });

    });

    closeBtn.onclick = () => {

        modal.style.display = "none";

    };

    closeExamPopup.onclick = () => {

        examPopup.style.display = "none";

    };

    window.addEventListener("click",(e) => {

        if(e.target === modal){

            modal.style.display = "none";

        }

        if(e.target === examPopup){

            examPopup.style.display = "none";

        }

    });

    document.getElementById("viewExam").addEventListener("click",async () => {

        if(currentType !== "exam") return;

        contextMenu.style.display = "none";

        const examId = currentRow.children[0].innerText.trim();

        await loadExamQuestions(examId);

    });

    document.addEventListener("click",async (e) => {

        if(e.target.classList.contains("btn-view-exam")){

            const examId = currentRow.children[0].innerText.trim();

            modal.style.display = "none";

            await loadExamQuestions(examId);

        }

    });

    document.getElementById("banAccount").addEventListener("click",() => {

        if(currentType !== "player") return;

        contextMenu.style.display = "none";

        const id = currentRow.children[0].innerText.trim();

        showConfirm("Bạn chắc chắn muốn cấm tài khoản?",async () => {

            const response = await fetch("admin.php",{

                method:"POST",

                headers:{
                    "Content-Type":"application/x-www-form-urlencoded"
                },

                body:`type=ban_user&id=${id}`

            });

            const data = await response.text();

            if(data.trim() === "success"){

                currentRow.classList.add("banned");

                showMessage("🚫 Đã cấm tài khoản");

            }else{

                showMessage("❌ " + data);

            }

        });

    });

    document.getElementById("unbanAccount").addEventListener("click",() => {

        if(currentType !== "player") return;

        contextMenu.style.display = "none";

        const id = currentRow.children[0].innerText.trim();

        showConfirm("Bạn chắc chắn muốn mở cấm tài khoản?",async () => {

            const response = await fetch("admin.php",{

                method:"POST",

                headers:{
                    "Content-Type":"application/x-www-form-urlencoded"
                },

                body:`type=unban_user&id=${id}`

            });

            const data = await response.text();

            if(data.trim() === "success"){

                currentRow.classList.remove("banned");

                showMessage("✅ Đã mở cấm tài khoản");

            }else{

                showMessage("❌ " + data);

            }

        });

    });

    document.getElementById("deleteAccount").addEventListener("click",() => {

        if(currentType !== "player") return;

        contextMenu.style.display = "none";

        const id = currentRow.children[0].innerText.trim();

        showConfirm("Bạn chắc chắn muốn xóa user?",async () => {

            const response = await fetch("admin.php",{

                method:"POST",

                headers:{
                    "Content-Type":"application/x-www-form-urlencoded"
                },

                body:`type=delete_user&id=${id}`

            });

            const data = await response.text();

            if(data.trim() === "success"){

                currentRow.remove();

                showMessage("✅ Xóa user thành công");

            }else{

                showMessage("❌ " + data);

            }

        });

    });

    document.getElementById("deleteExam").addEventListener("click",() => {

        if(currentType !== "exam") return;

        contextMenu.style.display = "none";

        const examId = currentRow.children[0].innerText.trim();

        showConfirm("Bạn chắc chắn muốn xóa exam?",async () => {

            const response = await fetch("admin.php",{

                method:"POST",

                headers:{
                    "Content-Type":"application/x-www-form-urlencoded"
                },

                body:`type=delete_exam&id=${examId}`

            });

            const data = await response.text();

            if(data.trim() === "success"){

                currentRow.remove();

                showMessage("✅ Xóa exam thành công");

            }else{

                showMessage("❌ " + data);

            }

        });

    });

});

</script>

</body>
</html>
