<?php
$conn = mysqli_connect("localhost", "root", "", "vital_choice");
if (!$conn) die("Lỗi kết nối!");
$sql = "SELECT * FROM history_answers";
$result = mysqli_query($conn, $sql);
$total = 0;
$correct = 0;
$wrong = 0;
while ($row = mysqli_fetch_assoc($result)) {
    $total++;
    if ($row['is_correct'] == 1) $correct++;
    else $wrong++;
}

$percent_correct = ($total > 0) ? round(($correct * 100)/$total) : 0;
$percent_wrong = ($total > 0) ? round(($wrong * 100)/$total) : 0;
$percent_skip = 100 - $percent_correct - $percent_wrong;
?>

<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<title>Vital Choice</title>

<link href="https://fonts.googleapis.com/css2?family=Pixelify+Sans:wght@400..700&display=swap" rel="stylesheet">

<style>
:root {
    --bg-black: #000;
    --card-gray: #1a1a1a;
    --gold: #DDB53E;
    --orange: #C27122;
    --border: #333;
}

body {
    font-family: 'Pixelify Sans';
    background: var(--bg-black);
    color: var(--gold);
    margin: 0;
    padding: 26px;
    font-size: 28px; 
}

.container {
    max-width: 1100px;
    margin: auto;
}

.card {
    background: var(--card-gray);
    padding: 25px;
    border-radius: 15px;
    margin-bottom: 20px;
    border: 1px solid var(--border);
}

.title-line {
    display: flex;
    align-items: center;
    gap: 10px;
    margin-bottom: 20px;
}
.title-line span {
    width: 6px;
    height: 30px;
    background: var(--orange);
}
h2 {
    margin: 0;
    font-size: 26px;
}

.header-flex {
    display: flex;
    gap: 30px;
    align-items: center;
}
.avatar-box {
    width: 100px;
    height: 100px;
    background: #333;
    border-radius: 10px;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 40px;
    border: 2px solid var(--gold);
}

.game-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 20px;
}

.stat-item {
    display: flex;
    justify-content: space-between;
    padding: 10px 0;
    border-bottom: 1px solid #333;
}

.perf-item { margin-bottom: 20px; }
.perf-label {
    display: flex;
    justify-content: space-between;
    margin-bottom: 5px;
}
.bar {
    background: #000;
    height: 12px;
    border-radius: 10px;
    border: 1px solid #444;
}
.fill {
    height: 100%;
}
.green { background: #2ecc71; }
.red { background: #ff4757; }
.orange { background: #ffa502; }

.history-row {
    padding: 12px;
    border-bottom: 1px solid #333;
}

.rank-gold { color: gold; }
.rank-silver { color: silver; }
.rank-bronze { color: peru; }

.no-data {
    text-align: center;
    color: #666;
    padding: 20px;
}
</style>
</head>

<body>

<div class="container">

<div class="card">
    <div class="title-line"><span></span><h2>Thông tin cá nhân</h2></div>
    <div class="header-flex">
        <div class="avatar-box">👾</div>
        <div>
            <p><b>Username:</b> Admin</p>
            <p><b>Mã SV:</b> 4751</p>
        </div>
    </div>
</div>

<div class="game-grid">

    <div class="card">
        <div class="title-line"><span></span><h2>Chỉ số nhân vật</h2></div>
        <div class="stat-item"><span>❤️ HP</span><span>0/20</span></div>
        <div class="stat-item"><span>🍖 Đói</span><span>0/15</span></div>
        <div class="stat-item"><span>💧 Khát</span><span>0/5</span></div>
        <div class="stat-item"><span>🔥 Mode</span><span>EASY</span></div>
    </div>

    <div class="card">
        <div class="title-line"><span></span><h2>Thống kê</h2></div>
        <div class="stat-item"><span>📊 Tổng câu</span><span><?= $total ?></span></div>
        <div class="stat-item"><span>🔥 Streak</span><span>0 ngày</span></div>
    </div>

</div>
<div class="card">
    <div class="title-line"><span></span><h2>Hiệu suất trả lời</h2></div>

    <div class="perf-item">
        <div class="perf-label"><span>ĐÚNG</span><span><?= $percent_correct ?>%</span></div>
        <div class="bar"><div class="fill green" style="width: <?= $percent_correct ?>%"></div></div>
    </div>

    <div class="perf-item">
        <div class="perf-label"><span>SAI</span><span><?= $percent_wrong ?>%</span></div>
        <div class="bar"><div class="fill red" style="width: <?= $percent_wrong ?>%"></div></div>
    </div>

    <div class="perf-item">
        <div class="perf-label"><span>BỎ QUA</span><span><?= $percent_skip ?>%</span></div>
        <div class="bar"><div class="fill orange" style="width: <?= $percent_skip ?>%"></div></div>
    </div>
</div>
<div class="card">
    <div class="title-line"><span></span><h2>Lịch sử gần nhất</h2></div>

<?php
$sql = "SELECT * FROM history_answers ORDER BY session_id DESC";
$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) == 0) {
    echo "<div class='no-data'>Chưa có dữ liệu sinh tồn.</div>";
} else {

    $current_session = -1;
    $count = 0;

    while ($row = mysqli_fetch_assoc($result)) {

        if ($row['session_id'] != $current_session) {

            if ($count >= 10) break;

            $session = $row['session_id'];
            $day = $row['day'];

            $sql2 = "SELECT * FROM history_answers WHERE session_id = $session";
            $rs2 = mysqli_query($conn, $sql2);

            $c = 0; $w = 0; $t = 0;

            while ($r = mysqli_fetch_assoc($rs2)) {
                $t++;
                if ($r['is_correct'] == 1) $c++;
                else $w++;
            }

            $score = ($t > 0) ? round(($c*100)/$t) : 0;

            $rank = "Bronze";
            $rankClass = "rank-bronze";

            if ($score >= 85) { $rank="Gold"; $rankClass="rank-gold"; }
            else if ($score >= 70) { $rank="Silver"; $rankClass="rank-silver"; }

            echo "<div class='history-row'>";
            echo "Session $session | Day $day | $score% | ";
            echo "<span style='color:lime'>$c đúng</span> | ";
            echo "<span style='color:red'>$w sai</span> | ";
            echo "<span class='$rankClass'>$rank</span>";
            echo "</div>";

            $current_session = $session;
            $count++;
        }
    }
}
?>

</div>

</div>

</body>
</html>
