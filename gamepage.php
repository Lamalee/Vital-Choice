<<<<<<< Updated upstream
<?php
include 'db.php';
$t = 20;
$q_query = $conn->prepare("SELECT q.question_id, q.content, q.type,
       a.answer_id, a.choice, a.content AS answer_content
FROM questions q
JOIN answers a ON q.question_id = a.question_id
WHERE q.question_id = (
    SELECT question_id 
    FROM questions
    WHERE is_active = 1
    ORDER BY RAND()
    LIMIT 1
)");
$q_query -> execute();
$q_result = $q_query->get_result();
$q_row = $q_result -> fetch_assoc();
$q = $q_row['question_id'];
$ansa = $q_row['answer_content'];
$ansb = "Answer B";
$ansc = "Answer C";
$ansd = "Answer D";
?>

<script>
    let TIME_LIMIT = <?php echo json_encode($t); ?>;
    let QUESTION = <?php echo json_encode($q); ?>;
    let ANSWER_A = <?php echo json_encode($ansa); ?>;
    let ANSWER_B = <?php echo json_encode($ansb); ?>;
    let ANSWER_C = <?php echo json_encode($ansc); ?>;
    let ANSWER_D = <?php echo json_encode($ansd); ?>;
</script>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gameplay</title>
    <link rel="stylesheet" href="gamepage.css">
    <script src="gamepage.js" defer></script>
</head>

<body>
    <div class="character_container">
        <div class="timer" id="Timer"></div>
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
            <button class="answer_button" id="Answer1">A</button>
            <button class="answer_button" id="Answer2">B</button>
            <button class="answer_button" id="Answer3">C</button>
            <button class="answer_button" id="Answer4">D</button>
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
=======
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
>>>>>>> Stashed changes

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