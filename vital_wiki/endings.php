<!DOCTYPE html>
<html lang="vi">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
    content="width=device-width, initial-scale=1.0">

    <title>Vital Choice Wiki</title>

    <link rel="stylesheet" href="wiki.css">

    <link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inconsolata:wght@400;700&display=swap"
    rel="stylesheet">

</head>

<body>

    <?php include 'partials/header.php'; ?>

    <div class="container">

        <?php include 'partials/sidebar.php'; ?>

        <div class="main">

            <!-- BANNER -->

            <div class="items-banner">

                <h1>ENDINGS</h1>

                <p>
                    Mỗi lựa chọn trong hành trình sinh tồn
                    sẽ dẫn người chơi đến một kết cục khác nhau.
                </p>

            </div>

            <!-- ENDINGS -->

            <div class="ending-showcase">

                <!-- SURVIVAL -->

                <div class="ending-panel good-panel">

                    <div class="ending-overlay"></div>

                    <div class="ending-header">

                        <div class="ending-icon">
                            <i class="fa-solid fa-signal"></i>
                        </div>

                        <div>
                            <span class="ending-type">GOOD ENDING</span>

                            <h2>SURVIVAL ENDING</h2>
                        </div>

                    </div>

                    <div class="ending-art good-art"></div>
                    
                    <div class="ending-body">

                        <p>
                            Sau nhiều ngày sinh tồn,
                            người chơi thành công gửi tín hiệu cứu hộ
                            bằng radio và sống sót cho tới khi được giải cứu.
                        </p>

                        <div class="ending-features">

                            <div class="ending-feature">
                                <i class="fa-solid fa-check"></i>
                                <span>Gửi tín hiệu thành công</span>
                            </div>

                            <div class="ending-feature">
                                <i class="fa-solid fa-check"></i>
                                <span>Sống sót đến cuối game</span>
                            </div>

                            <div class="ending-feature">
                                <i class="fa-solid fa-check"></i>
                                <span>Được đội cứu hộ phát hiện</span>
                            </div>

                        </div>

                    </div>

                    <div class="ending-footer">

                        <div class="ending-status success-status">
                            RESCUED
                        </div>

                    </div>

                </div>

                <!-- DEATH -->

                <div class="ending-panel bad-panel">

                    <div class="ending-overlay"></div>

                    <div class="ending-header">

                        <div class="ending-icon">
                            <i class="fa-solid fa-skull"></i>
                        </div>

                        <div>
                            <span class="ending-type">BAD ENDING</span>

                            <h2>DEATH ENDING</h2>
                        </div>

                    </div>

                    <div class="ending-art bad-art"></div>

                    <div class="ending-body">

                        <p>
                            Người chơi không thể chống chọi với đói khát,
                            bệnh tật và các trạng thái tiêu cực trước khi
                            đội cứu hộ kịp đến hòn đảo.
                        </p>

                        <div class="ending-features">

                            <div class="ending-feature">
                                <i class="fa-solid fa-xmark"></i>
                                <span>Thanh máu giảm về 0</span>
                            </div>

                            <div class="ending-feature">
                                <i class="fa-solid fa-xmark"></i>
                                <span>Không thể gửi tín hiệu cứu hộ</span>
                            </div>

                            <div class="ending-feature">
                                <i class="fa-solid fa-xmark"></i>
                                <span>Thất bại trong sinh tồn</span>
                            </div>

                        </div>

                    </div>

                    <div class="ending-footer">

                        <div class="ending-status dead-status">
                            DECEASED
                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>

</body>

</html>