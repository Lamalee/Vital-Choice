<?php
session_start();
if(!isset($_SESSION['id'])){
  header("Location: login.php");
  exit();
}
$current_exam_id = $_GET['exam_id'] ?? 0;
$id = $_SESSION['id'];
?>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Soạn thảo đề thi</title>
    <link rel="stylesheet" href="create_exam.css" />
    <script src="create_exam.js" defer></script>
    <script>
        const CURRENT_EXAM_ID = <?php echo json_encode($current_exam_id); ?>;
        const CURRENT_USER_ID = <?php echo json_encode($id); ?>;
    </script>
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

    <div class="container">
      <div class="createQuestion">
        <div class="enterQuestion">
          <input type="text" id="question" placeholder="Nhập nội dung câu hỏi..." />
        </div>
        
        <div class="enterAnswer">
          <div>
              <input type="radio" name="correct_answer" value="A" checked>
              <input type="text" id="AnswerA" placeholder="Đáp án A" />
          </div>
          <div>
              <input type="radio" name="correct_answer" value="B">
              <input type="text" id="AnswerB" placeholder="Đáp án B" />
          </div>
          <div>
              <input type="radio" name="correct_answer" value="C">
              <input type="text" id="AnswerC" placeholder="Đáp án C" />
          </div>
          <div>
              <input type="radio" name="correct_answer" value="D">
              <input type="text" id="AnswerD" placeholder="Đáp án D" />
          </div>
        </div>
      </div> <div class="container-button">
        <nav>
          <button id="backHome" onclick="backHome()">Về trang chủ</button>
        </nav>
        
        <div class="tagMode">
          <p class="highlight">Độ khó</p>
          <div class="enterTag">
            <input type="radio" name="tag" value="0" checked/> Dễ
            <input type="radio" name="tag" value="1" /> Trung bình
            <input type="radio" name="tag" value="2" /> Khó
          </div>
        </div>

        <div class="btn-function">
          <button id="rsContent" onclick="resetContent()">Làm trống ô nhập</button>
          <button id="addQuestionInLibrary" onclick="addQuestion()">Thêm vào thư viện chung</button>
          <button id="addQuestionInExam" onclick="addQuestionInExam()">Lưu & Thêm vào đề này</button>
          <button id="exitBtn" onclick="saveAndExit()" style="background-color: #f44336; color: white;">Lưu và Thoát</button>
        </div> 
      </div> <div class="container_listQuestion">
          <div id="questionList"></div>
          <div id="pagination"></div>
      </div>
    </div>

    <!-- Delete Confirmation Modal -->
    <div class="delete-backdrop" id="deleteBackdrop"></div>
    <div class="delete-modal" id="deleteModal">
      <div class="delete-modal-content">
        <h3>Xác nhận xóa</h3>
        <p id="deleteConfirmText"></p>
        <div class="delete-modal-buttons">
          <button id="confirmDeleteBtn" class="btn-confirm-delete">Xóa</button>
          <button id="cancelDeleteBtn" class="btn-cancel-delete">Hủy</button>
        </div>
      </div>
    </div>
   </body>
</html>
