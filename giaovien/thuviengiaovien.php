<?php
session_start();
 if(!isset($_SESSION['id']) || $_SESSION['role'] != 1){
  header("Location: login.php");
  exit();
}
$current_teacher_id = $_SESSION['id'];
?>
<!doctype html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <title>Thư viện bộ đề</title>
       <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&family=Molle:ital@1&family=Pixelify+Sans:wght@400..700&display=swap"
      rel="stylesheet"
    />
    <style>
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Inter', sans-serif;
      }

      body {
        background: #0a0a0a;
        color: #ffffff;
        min-height: 100vh;
      }

      .header {
        background: #0f0f0f;
        border-bottom: 3px solid #d4af37;
        color: #d4af37;
        padding: 25px 20px;
        text-align: center;
        font-size: 40px;
        font-weight: bold;
        letter-spacing: 2px;
        text-shadow: 0 0 10px rgba(212, 175, 55, 0.3);
        font-family: 'Pixelify Sans', sans-serif;
      }

      .container-createExam {
        max-width: 1200px;
        margin: 30px auto;
        padding: 20px;
        background: rgba(15, 15, 15, 0.8);
        border: 2px solid #d4af37;
        border-radius: 8px;
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 15px;
        text-align: center;
      }

      input[type="text"] {
        background: #1a1a1a;
        border: 2px solid #333333;
        color: #ffffff;
        padding: 12px 15px;
        margin: 5px;
        border-radius: 4px;
        font-size: 14px;
        transition: all 0.3s ease;
        width: 100%;
        max-width: 400px;
       
      }

      input[type="text"]:focus {
        border-color: #d4af37;
        box-shadow: 0 0 8px rgba(212, 175, 55, 0.3);
        outline: none;
      }

      input[type="text"]::placeholder {
        color: #666666;
        font-family: 'Inter', sans-serif;
      }

      .create-btn {
        background: #d4af37;
        color: #0a0a0a;
        padding: 12px 24px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        margin: 5px;
        font-weight: bold;
        font-size: 15px;
        transition: all 0.3s ease;
        
      }

      .create-btn:hover {
        background: #e5c158;
        box-shadow: 0 0 15px rgba(212, 175, 55, 0.5);
        transform: translateY(-2px);
      }

      button {
        padding: 8px 12px;
        margin-right: 5px;
        border: none;
        cursor: pointer;
        border-radius: 4px;
        font-weight: 600;
        transition: all 0.3s ease;
      }

      button:hover {
        transform: translateY(-2px);
      }

      table {
        width: 100%;
        border-collapse: collapse;
        margin: 30px auto;
        background: #1a1a1a;
        border: 2px solid #d4af37;
        border-radius: 8px;
        overflow: hidden;
      }

      thead {
        background: #0f0f0f;
        border-bottom: 3px solid #d4af37;
      }

      th {
        color: #d4af37;
        padding: 18px 15px;
        text-align: left;
        font-size: 15px;
        font-weight: bold;
        letter-spacing: 1px;
        text-transform: uppercase;
   
      }

      td {
        padding: 15px;
        border-bottom: 1px solid #333333;
        color: #ffffff;
        font-size: 14px;
      }

      tbody tr {
        transition: background 0.3s ease;
      }

      tbody tr:hover {
        background: #252525;
      }

      tbody tr:last-child td {
        border-bottom: none;
      }

      .btn-action {
          padding: 8px 14px;
          border: 2px solid #d4af37;
          border-radius: 4px;
          cursor: pointer;
          font-size: 13px;
          margin-right: 8px;
          color: #ffffff;
          font-weight: 700;
          transition: all 0.3s ease;
          background: transparent;
          text-transform: uppercase;
          letter-spacing: 0.5px;
         
      }

      .btn-edit {
          border-color: #2196F3;
          color: #2196F3;
      }

      .btn-edit:hover {
          background-color: #2196F3;
          color: #ffffff;
          box-shadow: 0 0 15px rgba(33, 150, 243, 0.6);
          transform: translateY(-2px);
      }

      .btn-delete {
          border-color: #f44336;
          color: #f44336;
      }

      .btn-delete:hover {
          background-color: #f44336;
          color: #ffffff;
          box-shadow: 0 0 15px rgba(244, 67, 54, 0.6);
          transform: translateY(-2px);
      }

      .btn-test {
          border-color: #d4af37;
          color: #d4af37;
      }

      .btn-test:hover {
          background-color: #d4af37;
          color: #0a0a0a;
          box-shadow: 0 0 15px rgba(212, 175, 55, 0.6);
          transform: translateY(-2px);
      }
      .btn-checkHistoryOfStudent {
          border-color: #f8f8f8;
          color: #feffff;
      }
      .btn-checkHistoryOfStudent:hover {
          background-color: #fefffe;
          color: #060606;
          box-shadow: 0 0 15px rgba(242, 243, 242, 0.6);
          transform: translateY(-2px);
      }

      table td:last-child {
          display: flex;
          justify-content: space-around;
          align-items: center;
      }

      .header-wrapper {
        display: flex;
        justify-content: space-between;
        align-items: center;
        background: #0f0f0f;
        border-bottom: 3px solid #d4af37;
        padding: 25px 20px;
      }

      .back-btn {
        background: #d4af37;
        color: #0a0a0a;
        padding: 10px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-weight: bold;
        font-size: 14px;
        transition: all 0.3s ease;
      }

      .back-btn:hover {
        background: #e5c158;
        box-shadow: 0 0 15px rgba(212, 175, 55, 0.5);
        transform: translateY(-2px);
      }

      .modal {
        display: none;
        position: fixed;
        z-index: 1000;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.6);
      }

      .modal-content {
        background-color: #1a1a1a;
        margin: 15% auto;
        padding: 30px;
        border: 2px solid #d4af37;
        border-radius: 8px;
        width: 90%;
        max-width: 400px;
        text-align: center;
        box-shadow: 0 0 20px rgba(212, 175, 55, 0.4);
      }

      .modal-content h2 {
        color: #d4af37;
        margin-bottom: 15px;
        font-size: 24px;
      }

      .modal-content p {
        color: #ffffff;
        margin-bottom: 25px;
        font-size: 16px;
      }

      .modal-close-btn {
        background-color: #d4af37;
        color: #0a0a0a;
        padding: 10px 30px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 15px;
        font-weight: bold;
        transition: all 0.3s ease;
      }

      .modal-close-btn:hover {
        background-color: #e5c158;
        box-shadow: 0 0 15px rgba(212, 175, 55, 0.5);
      }
    </style>
    <script> const CURRENT_TEACHER_ID = <?php echo json_encode($current_teacher_id);?>; </script>
  </head>
  <body>
    <!-- Modal Popup -->
    <div id="errorModal" class="modal">
      <div class="modal-content">
        <h2>Thông báo</h2>
        <p id="errorMessage"></p>
        <button class="modal-close-btn" onclick="closeErrorModal()">Đóng</button>
      </div>
    </div>

    <div class="header-wrapper">
      <div class="header">Library</div>
      <button class="back-btn" onclick="window.location.href='TeacherPage.php'">← Quay lại</button>
    </div>

    <div class="container-createExam">
      <button class="create-btn">+ Tạo đề mới</button>
      <input
        type="text"
        name="code_exam"
        id="code_exam"
        placeholder="Nhập mã code đề để tạo" required
      />
      <input
        type="text"
        id="content_exam"
        placeholder="Nhập tên bộ đề" required
      />
      <input
        type="text"
        id="time_exam"
        placeholder="Nhập thời gian mỗi ngày (giây)" required
      />
    </div>
    <table border="1">
      <thead>
        <tr>
          <th>Mã đề</th>
          <th>Tên đề</th>
          <th>Thời gian 1 ngày</th>
          <th>Thời gian tạo</th>
          <th>Cập nhật | Test | Xóa</th>
        </tr>
      </thead>
      <tbody id="examTableBody"></tbody>
    </table>
    <script src="thuviengiaovien.js"></script>
  </body>
</html>
