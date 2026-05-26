document.addEventListener("DOMContentLoaded", function () {
  loadData();
  const btnCreate = document.querySelector(".create-btn");
  if (btnCreate) {
    btnCreate.onclick = async function () {
      const code = document.getElementById("code_exam").value;
      const content = document.getElementById("content_exam").value;
      const time = document.getElementById("time_exam").value;
      if (!code || !content || !time) {
        showErrorModal("Vui lòng điền đầy đủ thông tin!");
        return;
      }
      const fd = new FormData();
      fd.append("exam_code", code);
      fd.append("content", content);
      fd.append("time", time);
      fd.append("teacher_id", CURRENT_TEACHER_ID);
      const response = await fetch("../api/save_new_exam.php", {
        method: "POST",
        body: fd,
      });
      const result = await response.json();
      if (result.success) {
        window.location.href = "create_exam.php?exam_id=" + result.exam_id;
      } else {
        showErrorModal("Lỗi: " + result.message);
      }
    };
  }
});

function closeErrorModal() {
  document.getElementById("errorModal").style.display = "none";
}

function showErrorModal(message) {
  document.getElementById("errorMessage").textContent = message;
  document.getElementById("errorModal").style.display = "block";
}

window.onclick = function (event) {
  const modal = document.getElementById("errorModal");
  if (event.target === modal) {
    closeErrorModal();
  }
};
async function loadData() {
  const fd = new FormData();
  fd.append("teacher_id", CURRENT_TEACHER_ID);
  const response = await fetch("../api/getInforExam.php", {
    method: "POST",
    body: fd,
  });
  const data = await response.json();
  const tableBody = document.getElementById("examTableBody");
  tableBody.innerHTML = "";
  data.forEach(function (item) {
    const row = document.createElement("tr");
    row.innerHTML =
      "<td>" +
      item.exam_code +
      "</td>" +
      "<td>" +
      item.content +
      "</td>" +
      "<td>" +
      item.time +
      " giây" +
      "</td>" +
      "<td>" +
      item.created_at +
      "</td>" +
      "<td>" +
      "<button class='btn-action btn-edit' onclick='goToUpdate(" +
      item.exam_id +
      ")'>Cập nhật</button>" +
      "<button class='btn-action btn-test' onclick='goToTest(" +
      item.exam_id +
      ")'>Test</button>" +
      "<button class='btn-action btn-delete' onclick='deleteExam(" +
      item.exam_id +
      ")'>Xóa</button>" +
      "<button class='btn-action btn-checkHistoryOfStudent' onclick = seeHistory(" +
      item.exam_id +
      ")>Lịch sử làm bài </button>" +
      "</td>";

    tableBody.appendChild(row);
  });
}
function seeHistory(examId) {
  window.location.href = "history_of_student.php?exam_id=" + examId;
}
function goToTest(examId) {
  window.location.href =
    "../gamepage/gamepage.php?exam_id=" + examId + "&new_test=1";
}
function goToUpdate(examId) {
  window.location.href = "create_exam.php?exam_id=" + examId;
}
async function deleteExam(examId) {
  const confirmDelete = confirm("Bạn có chắc chắn muốn xóa bộ đề này?");
  if (confirmDelete) {
    const fd = new FormData();
    fd.append("exam_id", examId);
    const response = await fetch("../api/deleteExam.php", {
      method: "POST",
      body: fd,
    });
    const result = await response.json();
    if (result.success) {
      showErrorModal("Xóa bộ đề thành công!");
      loadData();
    } else {
      showErrorModal("Xóa thất bại: " + result.message);
    }
  }
}
