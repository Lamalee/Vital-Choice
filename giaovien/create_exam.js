let selectQuestionId = null;
function backHome() {
  window.location.href = "../giaovien/TeacherPage.php";
}

function closeErrorModal() {
  document.getElementById("errorModal").style.display = "none";
}

function showErrorModal(message) {
  document.getElementById("errorMessage").textContent = message;
  document.getElementById("errorModal").style.display = "block";
}

// Đóng modal khi click vào background
window.onclick = function (event) {
  const modal = document.getElementById("errorModal");
  if (event.target === modal) {
    closeErrorModal();
  }
};
function resetContent() {
  selectQuestionId = null;
  document.getElementById("question").value = "";
  document.getElementById("AnswerA").value = "";
  document.getElementById("AnswerB").value = "";
  document.getElementById("AnswerC").value = "";
  document.getElementById("AnswerD").value = "";
  let radios = document.getElementsByName("tag");
  for (let i = 0; i < radios.length; i++) {
    radios[i].checked = false;
  }
}
async function addQuestion() {
  if(selectQuestionId) {
    showErrorModal("Câu hỏi đã tồn tại.");
    return null;
  }
  let question = document.getElementById("question").value;
  let ansA = document.getElementById("AnswerA").value;
  let ansB = document.getElementById("AnswerB").value;
  let ansC = document.getElementById("AnswerC").value;
  let ansD = document.getElementById("AnswerD").value;
  let tag = document.querySelector('input[name="tag"]:checked')?.value??"null";
  let correct = document.querySelector(
    'input[name="correct_answer"]:checked',
  ).value;
  
  let formData = new FormData();
  formData.append("content", question);
  formData.append("created_by", CURRENT_USER_ID);
  formData.append("tag", tag);
  formData.append("ansA", "A. " + ansA);
  formData.append("ansB", "B. " + ansB);
  formData.append("ansC", "C. " + ansC);
  formData.append("ansD", "D. " + ansD);
  formData.append("correct", correct);
  if (
    !formData.get("content") ||
    !formData.get("ansA") ||
    !formData.get("ansB") ||
    !formData.get("ansC") ||
    !formData.get("ansD") ||
    formData.get("tag") == "null"
  ) {
    showErrorModal("Vui lòng điền đầy đủ thông tin câu hỏi, đáp án và loại câu hỏi.");
    return;
  }
  try {
    const response = await fetch("../api/add_question.php", {
      method: "POST",
      body: formData,
    });
    let result = await response.json();
    if (result.success) {
      resetContent();
      loadQuestions(currentPage);
      return result.new_id;
    } else {
      showErrorModal("Lỗi: " + result.message);
      return null;
    }
  } catch (error) {
    console.error("Lỗi kết nối", error);
    return null;
  }
}

async function saveAndExit() {
  let formDataLink = new FormData();
  formDataLink.append("exam_id", CURRENT_EXAM_ID);
  try {
    const response = await fetch("../api/check_new_exam.php", {
      method: "POST",
      body: formDataLink,
    });
    const result = await response.json();
    if (result.success) {
      window.location.href = "thuviengiaovien.php";
    } else {
      showErrorModal(result.message);
      console.log("Lỗi: ", result.message);
    }
  } catch (error) {
    console.error("Lỗi kết nối:", error);
  }
  
}
async function addQuestionInExam() {
  let newID = await addQuestion();
  if (!newID) return;
  await loadQuestionDetails(newID);
  let formDataLink = new FormData();
  formDataLink.append("exam_id", CURRENT_EXAM_ID);
  formDataLink.append("question_id", newID);
  formDataLink.append("question_tag", document.querySelector('input[name="tag"]:checked').value);
  try {
    const response = await fetch("../api/add_question_to_exam.php", {
      method: "POST",
      body: formDataLink,
    });
    const result = await response.json();
    if (result.success) {
      resetContent();
      showErrorModal("Đã thêm câu hỏi vào đề thi thành công!");
      loadQuestions(currentPage);
    } else {
      showErrorModal("Lỗi thêm câu hỏi!");
      console.log("Lỗi: ", result.message);
    }
  } catch (error) {
    console.error("Lỗi kết nối:", error);
  }
}
let currentPage = 1;
async function loadQuestions(page = 1) {
  currentPage = page;
  const formData = new FormData();
  formData.append("exam_id", CURRENT_EXAM_ID);
  formData.append("created_by", CURRENT_USER_ID);
  formData.append("page", page);
  const response = await fetch("../api/create_exam_get_Q.php", {
    method: "POST",
    body: formData,
  });
  const data = await response.json();
  const listContainer = document.getElementById("questionList");
  listContainer.innerHTML = "";

  if (!data.questions || data.questions.length === 0) {
    const emptyMsg = document.createElement("div");
    emptyMsg.style.textAlign = "center";
    emptyMsg.style.color = "#999";
    emptyMsg.style.padding = "20px";
    emptyMsg.innerText = "Không có câu hỏi nào. Hãy tạo câu hỏi mới!";
    listContainer.appendChild(emptyMsg);
    return;
  }

  data.questions.forEach(function (q) {
    const div = document.createElement("div");
    div.className = "question-item";
    div.dataset.questionId = q.question_id;

    div.addEventListener("click", (e) => {
      if (e.target.tagName !== "INPUT") {
        selectQuestionId = q.question_id;
        loadQuestionDetails(q.question_id);
      }
    });

    // Add right-click context menu
    div.addEventListener("contextmenu", (e) => {
      e.preventDefault();
      showDeleteConfirmation(q.question_id, q.content);
    });

    const qText = document.createElement("div");
    qText.className = "q-text";
    qText.innerText = q.content;
    const checkbox = document.createElement("input");
    checkbox.type = "checkbox";
    if (q.is_selected == 1) {
      checkbox.checked = true;
    }
    checkbox.onchange = function () {
      toggleQuestion(checkbox, q.question_id);
    };
    div.appendChild(qText);
    div.appendChild(checkbox);
    listContainer.appendChild(div);
  });
  renderPagination(data.total_pages, data.current_page);
}
async function toggleQuestion(checkbox, questionId) {
  const action = checkbox.checked ? "add" : "remove";
  const formData = new FormData();
  formData.append("exam_id", CURRENT_EXAM_ID);
  formData.append("question_id", questionId);
  await loadQuestionDetails(questionId);
  formData.append("tag", document.querySelector('input[name="tag"]:checked').value);
  formData.append("action", action);
  const response = await fetch("../api/toggle_question.php", {
    method: "POST",
    body: formData,
  });
  const result = await response.json();
  if (!result.success) {
    showErrorModal("Lỗi cập nhật trạng thái!");
    checkbox.checked = !checkbox.checked;
  }
}
function renderPagination(totalPages, current) {
  const pagenavi = document.getElementById("pagination");
  pagenavi.innerHTML = "";
  if (totalPages <= 1) return;
  const prevBtn = document.createElement("button");
  prevBtn.innerText = "<";
  prevBtn.className = "page-nav-btn";
  if (current === 1) {
    prevBtn.disabled = true;
  } else {
    prevBtn.onclick = function () {
      loadQuestions(current - 1);
    };
  }
  pagenavi.appendChild(prevBtn);
  const pageInfo = document.createElement("span");
  pageInfo.className = "page-info";
  pageInfo.innerText = "Trang " + current + " / " + totalPages;
  pagenavi.appendChild(pageInfo);
  const nextBtn = document.createElement("button");
  nextBtn.innerText = ">";
  nextBtn.className = "page-nav-btn";
  if (current === totalPages) {
    nextBtn.disabled = true;
  } else {
    nextBtn.onclick = function () {
      loadQuestions(current + 1);
    };
  }
  pagenavi.appendChild(nextBtn);
}

function showDeleteConfirmation(questionId, questionContent) {
  const modal = document.getElementById("deleteModal");
  const backdrop = document.getElementById("deleteBackdrop");
  const confirmText = document.getElementById("deleteConfirmText");
  const confirmBtn = document.getElementById("confirmDeleteBtn");
  const cancelBtn = document.getElementById("cancelDeleteBtn");

  const displayText = questionContent.substring(0, 100);
  confirmText.innerText = `Bạn chắc chắn muốn xóa câu hỏi này? "${displayText}${questionContent.length > 100 ? "..." : ""}"`;

  confirmBtn.onclick = function () {
    deleteQuestion(questionId);
    closeDeleteModal();
  };

  cancelBtn.onclick = function () {
    closeDeleteModal();
  };

  backdrop.onclick = function () {
    closeDeleteModal();
  };

  modal.classList.add("show");
  backdrop.classList.add("show");
}

function closeDeleteModal() {
  const modal = document.getElementById("deleteModal");
  const backdrop = document.getElementById("deleteBackdrop");
  modal.classList.remove("show");
  backdrop.classList.remove("show");
}

async function deleteQuestion(questionId) {
  const formData = new FormData();
  formData.append("question_id", questionId);

  try {
    const response = await fetch("../api/delete_question.php", {
      method: "POST",
      body: formData,
    });
    const result = await response.json();
    if (result.success) {
      resetContent();
      loadQuestions(currentPage);
    } else {
      showErrorModal("Lỗi xóa câu hỏi: " + result.message);
    }
  } catch (error) {
    console.error("Lỗi kết nối:", error);
  }
}

loadQuestions();

async function loadQuestionDetails(questionId) {
  try {
    const formData = new FormData();
    formData.append("question_id", questionId);
    const response = await fetch("../api/get_question_details.php", {
      method: "POST",
      body: formData,
    });
    const result = await response.json();
    if (result.success) {
      document.getElementById("question").value = result.question.content || "";

      const answers = result.answers;
      const answerMap = {};
      answers.forEach((ans) => {
        answerMap[ans.choice] = ans.content;
      });

      document.getElementById("AnswerA").value = answerMap["A"] || "";
      document.getElementById("AnswerB").value = answerMap["B"] || "";
      document.getElementById("AnswerC").value = answerMap["C"] || "";
      document.getElementById("AnswerD").value = answerMap["D"] || "";

      answers.forEach((ans) => {
        if (ans.is_correct == 1) {
          const radios = document.getElementsByName("correct_answer");
          for (let i = 0; i < radios.length; i++) {
            if (radios[i].value === ans.choice) {
              radios[i].checked = true;
            }
          }
        }
      });
      const tagRadios = document.getElementsByName("tag");
      for (let i = 0; i < tagRadios.length; i++) {
        if (tagRadios[i].value == result.question.tag) {
          tagRadios[i].checked = true;
        }
      }
    } else {
      showErrorModal("Lỗi: " + result.message);
    }
  } catch (error) {
    console.error("Lỗi kết nối", error);
    showErrorModal("Không thể tải chi tiết câu hỏi");
  }
}
async function updateQuestion() {
  if (!selectQuestionId) {
    showErrorModal("Vui lòng chọn một câu hỏi để cập nhật.");
    return;
  }
  const formData = new FormData();
  formData.append("question_id", selectQuestionId);
  formData.append("content", document.getElementById("question").value);
  formData.append(
    "tag",
    document.querySelector('input[name="tag"]:checked').value,
  );
  formData.append("ansA", document.getElementById("AnswerA").value);
  formData.append("ansB", document.getElementById("AnswerB").value);
  formData.append("ansC", document.getElementById("AnswerC").value);
  formData.append("ansD", document.getElementById("AnswerD").value);
  formData.append(
    "correct",
    document.querySelector('input[name="correct_answer"]:checked').value,
  );
  if (
    !formData.get("content") ||
    !formData.get("ansA") ||
    !formData.get("ansB") ||
    !formData.get("ansC") ||
    !formData.get("ansD")
  ) {
    showErrorModal("Vui lòng điền đầy đủ thông tin câu hỏi và đáp án.");
    return;
  }
  try {
    const response = await fetch("../api/update_question.php", {
      method: "POST",
      body: formData,
    });
    const result = await response.json();
    if (result.success) {
      showErrorModal("Cập nhật câu hỏi thành công!");
      loadQuestions(currentPage);
    } else {
      showErrorModal("Lỗi cập nhật câu hỏi: " + result.message);
    }
  } catch (error) {
    console.error("Lỗi kết nối:", error);
    showErrorModal("Không thể cập nhật câu hỏi");
  }
}
