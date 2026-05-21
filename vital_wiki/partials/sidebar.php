<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vital Choice Wiki</title>
</head>
<body>
        <div class="left">
            <div class="sidebar"> 
                <h3>NAVIGATION</h3>

                <ul>
            <li>
                <a href="wiki.php">
                    <i class="fa-solid fa-house"></i> HOME
                </a>
            </li>

            <li>
                <a href="story.php">
                    <i class="fa-solid fa-book-open"></i> STORY
                </a>
            </li>

            <li>
                <a href="gameplay.php">
                    <i class="fa-solid fa-gamepad"></i> GAMEPLAY
                </a>
            </li>

            <li>
                <a href="character.php">
                    <i class="fa-solid fa-user"></i> CHARACTERS
                </a>
            </li>

            <li>
                <a href="items.php">
                    <i class="fa-solid fa-box"></i> ITEMS
                </a>
            </li>

            <li>
                <a href="endings.php">
                    <i class="fa-solid fa-skull"></i> ENDINGS
                </a>
            </li>
        </ul>
            </div>
            
            <div class="infor">
                    <h3>GAME INFO</h3>
                    <div>RELEASE: <label>2026</label></div>
                    <div>DEVELOPERS: <label>Pyro Studio</label></div>
                    <div>GENRE: <label>Survival - Quiz</label></div>
                    <div>PLATFORMS: <label>Web</label></div>
                    <?php if (isset($_SESSION['role']) && $_SESSION['role'] == 0): ?>
                        <a href="../mainpage/mainpage2.php">
                            <button class="btn">Về trang chủ →</button>
                        </a>
                    <?php elseif (isset($_SESSION['role']) && $_SESSION['role'] == 1): ?> 
                        <a href="../giaovien/TeacherPage.php">
                            <button class="btn">Về trang chủ →</button>
                        </a>
                    <?php else: ?>
                        <a href="../mainpage/mainpage.php">
                            <button class="btn">Về trang chủ →</button>
                        </a>
                    <?php endif; ?>
                    
            </div>
        </div>
</body>
</html>
