document.addEventListener("DOMContentLoaded", function () {
  loadData();
  setupPopupListeners();
});

function setupPopupListeners() {
  const popup = document.getElementById("popup-detail-history");
  const overlay = document.getElementById("popup-overlay");
  const closeBtn = document.getElementById("close-popup");

  closeBtn.addEventListener("click", closePopup);
  overlay.addEventListener("click", closePopup);
}

function openPopup() {
  const popup = document.getElementById("popup-detail-history");
  const overlay = document.getElementById("popup-overlay");
  popup.classList.add("show");
  overlay.classList.add("show");
}

function closePopup() {
  const popup = document.getElementById("popup-detail-history");
  const overlay = document.getElementById("popup-overlay");
  popup.classList.remove("show");
  overlay.classList.remove("show");
}

async function loadData() {
  const fd = new FormData();
  fd.append("exam_id", CURRENT_EXAM_ID);
  const response = await fetch("../api/getStudentOfHistory.php", {
    method: "POST",
    body: fd,
  });
  const data = await response.json();
  const displayExam = document.getElementById("display-history");
  displayExam.innerHTML = "";

  if (!data || data.length === 0) {
    displayExam.innerHTML =
      '<div class="empty-state"><div class="empty-state-icon">📋</div><div class="empty-state-text">Không có dữ liệu lịch sử làm bài</div></div>';
    return;
  }

  const table = document.createElement("table");
  const thead = document.createElement("thead");
  const headerRow = document.createElement("tr");

  const headers = ["ID", "username", "Rank", "Xem chi tiết"];
  headers.forEach((header) => {
    const th = document.createElement("th");
    th.textContent = header;
    headerRow.appendChild(th);
  });

  thead.appendChild(headerRow);
  table.appendChild(thead);

  const tbody = document.createElement("tbody");
  data.forEach((student) => {
    const row = document.createElement("tr");

    const idCell = document.createElement("td");
    idCell.textContent = student.id || "";
    row.appendChild(idCell);

    const usernameCell = document.createElement("td");
    usernameCell.textContent = student.username || "";
    row.appendChild(usernameCell);

    const rankingCell = document.createElement("td");
    rankingCell.textContent = student.ranking || "N/A";
    row.appendChild(rankingCell);

    const actionCell = document.createElement("td");
    const btn = document.createElement("button");
    btn.className = "btn-action btn-view-detail";
    btn.textContent = "Xem";
    btn.addEventListener("click", function () {
      seeDetail(student.session_id);
    });
    actionCell.appendChild(btn);
    row.appendChild(actionCell);

    tbody.appendChild(row);
  });

  table.appendChild(tbody);
  displayExam.appendChild(table);
}
async function seeDetail(sessionId) {
  const fd = new FormData();
  fd.append("session_id", sessionId);

  const response = await fetch("../api/getDetailHistoryOfStudent.php", {
    method: "POST",
    body: fd,
  });

  const data = await response.json();
  const detail = document.getElementById("detail-history");
  detail.innerHTML = "";

  if (!data || data.length === 0) {
    detail.innerHTML =
      '<div class="empty-state"><div class="empty-state-text">Không có chi tiết nào</div></div>';
    openPopup();
    return;
  }

  data.forEach((item, index) => {
    const detailSection = document.createElement("div");
    detailSection.className = "detail-section";

    const questionTitle = document.createElement("div");
    questionTitle.className = "question-title";
    questionTitle.textContent = `Câu ${index + 1}`;
    detailSection.appendChild(questionTitle);

    const questionDiv = document.createElement("div");
    questionDiv.className = "detail-item";
    const questionLabel = document.createElement("span");
    questionLabel.className = "detail-label";
    questionLabel.textContent = "Câu hỏi:";
    const questionValue = document.createElement("span");
    questionValue.className = "detail-value";
    questionValue.textContent = item.question_text || "";
    questionDiv.appendChild(questionLabel);
    questionDiv.appendChild(questionValue);
    detailSection.appendChild(questionDiv);

    const answerDiv = document.createElement("div");
    answerDiv.className = "detail-item";
    const answerLabel = document.createElement("span");
    answerLabel.className = "detail-label";
    answerLabel.textContent = "Đáp án chọn:";
    const answerValue = document.createElement("span");
    answerValue.className = "detail-value";
    answerValue.textContent = item.answer_text || "";
    answerDiv.appendChild(answerLabel);
    answerDiv.appendChild(answerValue);
    detailSection.appendChild(answerDiv);

    const resultDiv = document.createElement("div");
    resultDiv.className = "detail-item";
    const resultLabel = document.createElement("span");
    resultLabel.className = "detail-label";
    resultLabel.textContent = "Kết quả:";
    const resultValue = document.createElement("span");
    resultValue.className = `detail-value answer-result ${
      item.is_correct == 1 ? "correct" : "incorrect"
    }`;
    resultValue.textContent = item.is_correct == 1 ? "✓ Đúng" : "✗ Sai";
    resultDiv.appendChild(resultLabel);
    resultDiv.appendChild(resultValue);
    detailSection.appendChild(resultDiv);

    detail.appendChild(detailSection);
  });

  openPopup();
}

document.getElementById("close-popup").addEventListener("click", function () {
  closePopup();
});
