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

            <!-- PAGE BANNER -->

            <div class="items-banner">

                <h1>ITEMS</h1>

                <p>
                    Danh sách các vật phẩm sinh tồn
                    xuất hiện trong Vital Choice.
                </p>

            </div>

            <!-- ITEMS GRID -->

            <div class="items-grid">

                <!-- FOOD -->

                <div class="item-card">

                    <div class="item-image food-image"></div>

                    <div class="item-content">

                        <h2>ĐỒ ĂN</h2>

                        <p>
                            Dùng để duy trì trạng thái no
                            và kéo dài khả năng sinh tồn.
                        </p>

                        <div class="item-info">

                            <div>
                                ĐỘ KHÓ
                                <span>DỄ</span>
                            </div>

                            <div>
                                HIỆU ỨNG
                                <span>- ĐÓI</span>
                            </div>

                        </div>

                    </div>

                    <div class="item-popup">
                        <h3>ĐÓI</h3>
                        <p>Khi hết thanh mỗi ngày sẽ mất thêm máu</p>
                    </div>

                </div>

                <!-- WATER -->

                <div class="item-card">

                    <div class="item-image water-image"></div>

                    <div class="item-content">

                        <h2>NƯỚC UỐNG</h2>

                        <p>
                            Giảm trạng thái khát
                            và tránh mất máu theo ngày.
                        </p>

                        <div class="item-info">

                            <div>
                                ĐỘ KHÓ
                                <span>DỄ</span>
                            </div>

                            <div>
                                HIỆU ỨNG
                                <span>- KHÁT</span>
                            </div>

                        </div>

                    </div>

                    <div class="item-popup">
                        <h3>KHÁT</h3>
                        <p>Khi hết thanh mỗi ngày sẽ mất thêm máu.</p>
                    </div>

                </div>

                <!-- MEDICINE -->

                <div class="item-card">

                    <div class="item-image medicine-image"></div>

                    <div class="item-content">

                        <h2>THUỐC</h2>

                        <p>
                            Làm giảm trạng thái bệnh
                            và ổn định sức khỏe người chơi.
                        </p>

                        <div class="item-info">

                            <div>
                                ĐỘ KHÓ
                                <span>TRUNG BÌNH</span>
                            </div>

                            <div>
                                HIỆU ỨNG
                                <span>- BỆNH</span>
                            </div>

                        </div>

                    </div>

                    <div class="item-popup">
                        <h3>BỆNH</h3>
                        <p>Khi đầy thanh sẽ mau đói, khát và mất máu</p>
                    </div>

                </div>

                <!-- BOARD -->

                <div class="item-card">

                    <div class="item-image chess-image"></div>

                    <div class="item-content">

                        <h2>BÀN CỜ</h2>

                        <p>
                            Giúp người chơi giảm
                            trạng thái ảo giác.
                        </p>

                        <div class="item-info">

                            <div>
                                ĐỘ KHÓ
                                <span>TRUNG BÌNH</span>
                            </div>

                            <div>
                                HIỆU ỨNG
                                <span>- ẢO GIÁC</span>
                            </div>

                        </div>

                    </div>

                    <div class="item-popup">
                        <h3>ẢO GIÁC</h3>
                        <p>Ăn như không ăn, uống như không uống, không phân biệt được nút trên radio</p>
                    </div>

                </div>

                <!-- FIRE -->

                <div class="item-card">

                    <div class="item-image fire-image"></div>

                    <div class="item-content">

                        <h2>LỬA</h2>

                        <p>
                            Giữ ấm cơ thể trong môi trường lạnh
                            và làm giảm trạng thái rét.
                        </p>
                        <div class="item-info">

                            <div>
                                ĐỘ KHÓ
                                <span>TRUNG BÌNH</span>
                            </div>

                            <div>
                                HIỆU ỨNG
                                <span>- RÉT</span>
                            </div>

                        </div>

                    </div>

                    <div class="item-popup">
                        <h3>RÉT</h3>
                        <p>Dễ bệnh hơn, mau đói và khát hơn.</p>
                    </div>

                </div>

                <!-- RADIO -->

                <div class="item-card">

                    <div class="item-image radio-image"></div>

                    <div class="item-content">

                        <h2>RADIO</h2>

                        <p>
                            Vật phẩm quan trọng nhất
                            để gửi tín hiệu cứu hộ.
                        </p>

                        <div class="item-info">

                            <div>
                                ĐỘ KHÓ
                                <span>KHÓ</span>
                            </div>

                            <div>
                                HIỆU ỨNG
                                <span>WIN CONDITION</span>
                            </div>

                        </div>

                    </div>

                    <div class="item-popup">
                        <h3>RADIO</h3>
                        <p>ĐỪNG BAO GIỜ BỎ LỠ NÓ!!!!!</p>
                    </div>

                </div>

            </div>

        </div>

    </div>

</body>

</html>