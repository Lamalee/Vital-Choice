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
        <div class="header">
            <h1>Vital Admin</h1>
        </div>

        <div class="table-container">
            <div class="table-header">
                <h2>👥 User Management (5 Users)</h2>
            </div>
            <div class="table-wrapper">
                <table id="playerTable">
                    <thead>
                        <tr>
                            <th>ID Player</th>
                            <th>Username</th>
                            <th>Role</th>
                            <th>Created At</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody> 
                        <?php
                        $users = [
                            [1, "admin_master", "admin", "2024-01-15 10:30", "Active"],
                            [2, "teacher_john", "teacher", "2024-02-20 14:22", "Active"],
                            [3, "student_alice", "student", "2024-03-10 09:15", "Active"],
                            [4, "user_hacked", "user", "2024-04-05 16:45", "Banned"],
                            [5, "premium_vip", "premium", "2024-05-01 11:20", "Active"]
                        ];

                        foreach ($users as $u) {
                            echo "<tr>\n";
                            echo "    <td class='id-cell'>{$u[0]}</td>\n";
                            echo "    <td>{$u[1]}</td>\n";
                            echo "    <td>{$u[2]}</td>\n";
                            echo "    <td>{$u[3]}</td>\n";
                            echo "    <td><span class='status-active'>● Active</span></td>\n";
                            echo "</tr>\n";
                        }
                        ?>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="table-container">
            <div class="table-header">
                <h2>📚 Exam Management (5 Exams)</h2>
            </div>
            <div class="table-wrapper">
                <table id="ExamTable">
                    <thead>
                        <tr>
                            <th>Exam ID</th>
                            <th>Teacher ID</th>
                            <th>Created At</th>
                            <th>Exam Code</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $exams = [
                            [101, "T001", "2024-01-20 08:30", "MATH-A1", "Published"],
                            [102, "T002", "2024-02-15 13:45", "PHYS-B2", "Draft"],
                            [103, "T001", "2024-03-05 10:15", "CHEM-C3", "Published"],
                            [104, "T003", "2024-04-12 15:20", "BIO-D4", "Published"],
                            [105, "T002", "2024-05-08 09:50", "ENG-E5", "Draft"]
                        ];

                        foreach ($exams as $e) {
                            $statusClass = $e[4] === 'Published' ? 'status-published' : 'status-draft';
                            echo "<tr>\n";
                            echo "    <td>{$e[0]}</td>\n";
                            echo "    <td>{$e[1]}</td>\n";
                            echo "    <td>{$e[2]}</td>\n";
                            echo "    <td>{$e[3]}</td>\n";
                            echo "    <td><span class='{$statusClass}'>● {$e[4]}</span></td>\n";
                            echo "</tr>\n";
                        }
                        ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div id="contextMenu" class="context-menu">
        <div class="menu-section" id="playerActions">
            <div class="context-menu-item" id="banAccount">🚫 Cấm tài khoản</div>
            <div class="context-menu-item" id="deleteAccount">🗑️ Xóa tài khoản</div>
        </div>
        <div class="menu-section" id="examActions" style="display:none;">
            <div class="context-menu-item" id="viewExam">👁️ Xem bài exam</div>
            <div class="context-menu-item" id="deleteExam">🗑️ Xóa bài exam</div>
        </div>
    </div>

    <div id="playerModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h2 id="modalTitle">User Information</h2>
            <div id="playerInfo"></div>
        </div>
    </div>

    <script src="script.js"></script>
</body>
</html>