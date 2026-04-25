    <?php
    session_start();
    include 'db.php';
    if (!isset($_SESSION['username'])) {
        header("Location: login.php");
        exit();
    }

    $t = 90;
    ?>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Gameplay</title>
        <link rel="stylesheet" href="gamepage.css">
        <script>
            const TIME_LIMIT = <?php echo json_encode($t); ?>;
        </script>
        <script src="gamepage.js" defer></script>
    </head>

    <body>
        <div class="character_container">
            <div class="Day_container">
                <button class="Skip_day" id="Skip_day" onclick="SkipDay()">>></button>
                <div class="timer" id="Timer"></div>
            </div>

            <div class="character"></div>
            <div class="bars">
                <div class="bar" id="Health"></div>
                <div class="bar" id="Hunger"></div>
                <div class="bar" id="Thirst"></div>
                <div class="bar" id="Cold"></div>
                <div class="bar" id="Illness"></div>
                <div class="bar" id="Sanity"></div>
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
    </body>

    </html>