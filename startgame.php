<?php
session_start();
include 'db.php';
if (!isset($_SESSION['id'])) {
    header("Location: login.php");
    exit();
}
if($_SERVER['REQUEST_METHOD']=='POST'){
    $player_id = $_SESSION['id'];
    $mode = $_POST['game_mode'];
    $sql = "INSERT INTO game_sessions (player_id, current_day, health, mode) 
            VALUES ('$player_id', 1, 20, '$mode')";
    if(mysqli_query($conn, $sql)){
    $current_session_id = mysqli_insert_id($conn);
    $_SESSION['current_session_id'] = $current_session_id;
    $_SESSION['mode'] = $mode;
    header("Location: gamepage.php");
    exit();
    } else {
        echo "Lỗi khởi tạo game!";
        }   
}
?>