const rankClassMap = {
  master: "rank-master",
  senior: "rank-senior",
  intermediate: "rank-intermediate",
  junior: "rank-junior",
  fresher: "rank-fresher",
  jobless: "rank-jobless",
};

async function loadSummary() {
  const correctCount = document.getElementById("correctCount");
  const wrongCount = document.getElementById("wrongCount");
  const rankBadge = document.getElementById("rankBadge");
  const questionList = document.getElementById("questionList");
  const noDataText = document.getElementById("noDataText");

  try {
    const response = await fetch("../api/get_summary.php");
    const payload = await response.json();
    console.log(payload);

    if (!payload.success) {
      noDataText.textContent = payload.message || "Không thể tải dữ liệu.";
      return;
    }

    const summary = payload.data;
    correctCount.textContent = summary.correct ?? 0;
    wrongCount.textContent = summary.wrong ?? 0;

    const rankValue = summary.rank || "N/A";
    rankBadge.textContent = rankValue.toUpperCase();
    rankBadge.className = "result-badge";

    if (summary.rank && rankClassMap[summary.rank]) {
      rankBadge.classList.add(rankClassMap[summary.rank]);
    }

    questionList.innerHTML = "";

    if (!summary.details || summary.details.length === 0) {
      questionList.innerHTML =
        '<div class="no-data">Không có dữ liệu chi tiết.</div>';
      return;
    }

    summary.details.forEach((item, index) => {
      const div = document.createElement("div");
      div.className = `question-item ${item.is_correct ? "correct" : "incorrect"}`;

      div.innerHTML = `
    <span class="status-icon">${item.is_correct ? "✔" : "✖"}</span>
    <div class="question-text">
        <pre></pre>
    </div>
    <div class="question-tag">${item.is_correct ? "Đúng" : "Sai"}</div>
`;

      div.querySelector("pre").textContent =
        `Câu ${index + 1} - ${item.content}`;

      questionList.appendChild(div);
    });
  } catch (error) {
    console.error(error);
    noDataText.textContent = "Lỗi khi tải dữ liệu.";
  }
}

document.addEventListener("DOMContentLoaded", loadSummary);
