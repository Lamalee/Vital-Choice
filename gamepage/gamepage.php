<?php
session_start();
include '../profile/db.php';
if (!isset($_SESSION['username'])) {
    header("Location: login.php");
    exit();
}
$exam_id = $_GET['exam_id'] ?? null;
$new_test = $_GET['new_test'] ?? null;
if ($new_test == 1) {
    unset($_SESSION['exam_questions_queue']);
}
if ($exam_id && empty($_SESSION['exam_questions_queue'])) {
    $resQ = mysqli_query($conn, "SELECT question_id FROM exam_questions WHERE exam_id = $exam_id");
    $all_ids = [];
    while ($q = mysqli_fetch_assoc($resQ)) {
        $all_ids[] = (int)$q['question_id'];
    }
    shuffle($all_ids);
    $_SESSION['exam_questions_queue'] = $all_ids;
}

?>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Gameplay</title>
        <link rel="stylesheet" href="gamepage.css">
        <script>
            const CURRENT_EXAM_ID = <?php echo json_encode($exam_id); ?>;
        </script>
        <script src="gamepage.js" defer></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    </head>

    <body>
        <div class="character_container">
            <div class="Day_container">
                <button class ="End_game" id="End_game" onclick="Confirm_Quit()">Kết thúc</button>
                <button class="Skip_day" id="Skip_day" onclick="SkipDay()">>></button>
                <div class="timer" id="Timer"></div>
            </div>

            <div class="character"></div>
            <div class="bars">

                <div class="status-bar">

                    <div class="status-fill" id="Health"></div>

                    <div class="status-label">
                        <i class="fa-solid fa-heart"></i>
                        HEALTH
                    </div>

                </div>

                <div class="status-bar">

                    <div class="status-fill" id="Hunger"></div>

                    <div class="status-label">
                        <i class="fa-solid fa-drumstick-bite"></i>
                        HUNGER
                    </div>

                </div>

                <div class="status-bar">

                    <div class="status-fill" id="Thirst"></div>

                    <div class="status-label">
                        <i class="fa-solid fa-droplet"></i>
                        THIRST
                    </div>

                </div>

                <div class="status-bar">

                    <div class="status-fill" id="Cold"></div>

                    <div class="status-label">
                        <i class="fa-solid fa-snowflake"></i>
                        COLD
                    </div>

                </div>

                <div class="status-bar">

                    <div class="status-fill" id="Illness"></div>

                    <div class="status-label">
                        <i class="fa-solid fa-virus"></i>
                        ILLNESS
                    </div>

                </div>

                <div class="status-bar">

                    <div class="status-fill" id="Sanity"></div>

                    <div class="status-label">
                        <i class="fa-solid fa-brain"></i>
                        SANITY
                    </div>

                </div>

            </div>
        </div>
        <div class="question_container">
            <div class="question" id="Question"></div>
            <div class="answer_container">
                <button class="answer_button" id="Answer1"></button>
                <button class="answer_button" id="Answer2"></button>
                <button class="answer_button" id="Answer3"></button>
                <button class="answer_button" id="Answer4"></button>
            </div>
        </div>
        <div class="items_container">
            <button class="item_button" id="Food" onclick="Food_chosen()"></button>
            <button class="item_button" id="Water" onclick="Water_chosen()"></button>
            <button class="item_button" id="Medicine" onclick="Medicine_chosen()"></button>
            <button class="item_button" id="Fire" onclick="Fire_chosen()"></button>
            <button class="item_button" id="Chess" onclick="Chess_chosen()"></button>
            <button class="item_button" id="Radio" onclick="Radio_chosen()"></button>
        </div>
        <div id="losePopup" class="popup">
            <div class="popup-content ending-popup lose">
                <img src="../image/teo_dead.png" class="ending-img" alt="Tèo chết">
                <h2>Bạn đã hy sinh!</h2>
                <p>Sinh tồn thất bại.</p>
                <button onclick="watchResult()">Xem kết quả</button>
            </div>
        </div>

        <div id="winPopup" class="popup">
            <div class="popup-content ending-popup win">
                <img src="../image/teo_win.png" class="ending-img" alt="Tèo được cứu">
                <h2>Chiến thắng!</h2>
                <p>Bạn đã sống sót thành công!</p>
                <button onclick="watchResult()">Xem kết quả</button>
            </div>
        </div>
        <div id="confirmPopup" class="popup">
            <div class="popup-content">
                <h2>Xác nhận</h2>
                <p>Bạn có chắc muốn bỏ cuộc?</p>
                <div>
                    <button onclick="confirmLose()">Có</button>
                    <button onclick="closeConfirm()">Không</button>
                </div>
            </div>
        </div>
    </body>
</html>