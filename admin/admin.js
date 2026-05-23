document.addEventListener("DOMContentLoaded", () => {
  let currentRow = null;
  let currentType = "";

  const contextMenu = document.getElementById("contextMenu");
  const playerMenu = document.getElementById("playerActions");
  const pendingMenu = document.getElementById("pendingActions");
  const examMenu = document.getElementById("examActions");

  const modal = document.getElementById("playerModal");
  const modalTitle = document.getElementById("modalTitle");
  const modalContent = document.getElementById("playerInfo");
  const closeBtn = document.querySelector("#playerModal .close");

  const popup = document.getElementById("popup");
  const popupText = document.getElementById("popupText");
  const popupOk = document.getElementById("popupOk");
  const popupCancel = document.getElementById("popupCancel");

  const examPopup = document.getElementById("examPopup");
  const questionList = document.getElementById("questionList");
  const closeExamPopup = document.getElementById("closeExamPopup");

  function showMessage(message) {
    return new Promise((resolve) => {
      popup.style.display = "flex";
      popupText.innerText = message;

      popupCancel.style.display = "none";

      popupOk.onclick = () => {
        popup.style.display = "none";
        resolve();
      };
    });
  }
  function showConfirm(message, onOk) {
    popup.style.display = "flex";
    popupText.innerText = message;
    popupCancel.style.display = "inline-block";

    popupOk.onclick = () => {
      popup.style.display = "none";
      onOk();
    };

    popupCancel.onclick = () => {
      popup.style.display = "none";
    };
  }

  async function loadExamQuestions(examId) {
    try {
      const response = await fetch("../api/admin_exam_management.php", {
        method: "POST",
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        body: `action=get_questions&id=${examId}`,
      });

      const data = await response.json();

      questionList.innerHTML = "";
      if (!Array.isArray(data) || data.length === 0) {
        questionList.innerHTML = `
                    <p style="text-align:center;color:#999;">
                        Không có câu hỏi
                    </p>
                `;
      } else {
        data.forEach((item, index) => {
          const wrapper = document.createElement("div");
          wrapper.className = "question-item";

          const title = document.createElement("h3");
          title.innerText = `Câu ${index + 1}`;

          const content = document.createElement("div");
          content.innerText = item.content;

          wrapper.appendChild(title);
          wrapper.appendChild(content);

          questionList.appendChild(wrapper);
        });
      }

      examPopup.style.display = "flex";
    } catch (error) {
      console.log(error);
      showMessage("❌ Lỗi tải câu hỏi (server hoặc JSON)");
    }
  }

  document.addEventListener("click", (e) => {
    if (!contextMenu.contains(e.target)) {
      contextMenu.style.display = "none";
    }
  });

  document.addEventListener("contextmenu", (e) => {
    const row = e.target.closest("tbody tr");

    if (!row) return;

    const playerTable = row.closest("#playerTable");
    const examTable = row.closest("#examTable");
    const pendingTable = row.closest("#pendingTable");
    const pendingExamTable = row.closest("#pendingExamTable");

    if (!playerTable && !examTable && !pendingTable && !pendingExamTable)
      return;

    e.preventDefault();

    currentRow = row;

    if (playerTable) {
      currentType = "player";
      playerMenu.style.display = "block";
      pendingMenu.style.display = "none";
      examMenu.style.display = "none";
      document.getElementById("pendingExamActions").style.display = "none";
    }

    if (pendingTable) {
      currentType = "pending";
      playerMenu.style.display = "none";
      pendingMenu.style.display = "block";
      examMenu.style.display = "none";
      document.getElementById("pendingExamActions").style.display = "none";
    }

    if (examTable) {
      currentType = "exam";
      playerMenu.style.display = "none";
      pendingMenu.style.display = "none";
      examMenu.style.display = "block";
      document.getElementById("pendingExamActions").style.display = "none";
    }

    if (pendingExamTable) {
      currentType = "pendingExam";
      playerMenu.style.display = "none";
      pendingMenu.style.display = "none";
      examMenu.style.display = "none";
      document.getElementById("pendingExamActions").style.display = "block";
    }

    contextMenu.style.display = "block";
    contextMenu.style.left = e.clientX + "px";
    contextMenu.style.top = e.clientY + "px";
  });

  document.querySelectorAll("#playerTable tbody tr").forEach((row) => {
    row.addEventListener("click", () => {
      currentRow = row;
      currentType = "player";

      const cells = row.children;

      modalTitle.innerText = "👤 User Information";

      modalContent.innerHTML = `
                <div class="modal-info">
                    <p><strong>ID:</strong> <span>${cells[0].innerText}</span></p>
                    <p><strong>Username:</strong> <span>${cells[1].innerText}</span></p>
                    <p><strong>Role:</strong> 
                        <span class="role-badge">${cells[2].innerText}</span>
                    </p>
                    <p><strong>Created At:</strong> 
                        <span>${cells[3].innerText}</span>
                    </p>
                </div>
            `;

      modal.style.display = "flex";
    });
  });

  document.querySelectorAll("#examTable tbody tr").forEach((row) => {
    row.addEventListener("click", () => {
      currentRow = row;
      currentType = "exam";

      const cells = row.children;

      modalTitle.innerText = "📚 Exam Information";

      modalContent.innerHTML = `
                <div class="modal-info">
                    <p><strong>Exam ID:</strong> 
                        <span>${cells[0].innerText}</span>
                    </p>
                    <p><strong>Teacher ID:</strong> 
                        <span>${cells[1].innerText}</span>
                    </p>
                    <p><strong>Created At:</strong> 
                        <span>${cells[2].innerText}</span>
                    </p>
                    <p><strong>Exam Code:</strong> 
                        <span class="exam-code">${cells[3].innerText}</span>
                    </p>
                    <br>
                    <button class="btn-view-exam">
                        👁️ Xem đề
                    </button>
                </div>
            `;

      modal.style.display = "flex";
    });
  });

  document.querySelectorAll("#pendingTable tbody tr").forEach((row) => {
    row.addEventListener("click", () => {
      currentRow = row;
      currentType = "pending";

      const cells = row.children;

      modalTitle.innerText = "Information of pending account";

      modalContent.innerHTML = `
                <div class="modal-info">
                    <p><strong>ID:</strong> <span>${cells[0].innerText}</span></p>
                    <p><strong>Username:</strong> <span>${cells[1].innerText}</span></p>
                    <p><strong>Role:</strong> 
                        <span class="role-badge">${cells[2].innerText}</span>
                    </p>
                    <p><strong>Created At:</strong> 
                        <span>${cells[3].innerText}</span>
                    </p>
                </div>
            `;

      modal.style.display = "flex";
    });
  });

  closeBtn.onclick = () => {
    modal.style.display = "none";
  };

  closeExamPopup.onclick = () => {
    examPopup.style.display = "none";
  };

  window.addEventListener("click", (e) => {
    if (e.target === modal) {
      modal.style.display = "none";
    }

    if (e.target === examPopup) {
      examPopup.style.display = "none";
    }
  });

  document.getElementById("viewExam").addEventListener("click", async () => {
    if (currentType !== "exam") return;

    contextMenu.style.display = "none";

    const examId = currentRow.children[0].innerText.trim();

    await loadExamQuestions(examId);
  });

  document.addEventListener("click", async (e) => {
    if (e.target.classList.contains("btn-view-exam")) {
      const examId = currentRow.children[0].innerText.trim();

      modal.style.display = "none";

      await loadExamQuestions(examId);
    }
  });

  document.getElementById("banAccount").addEventListener("click", () => {
    if (currentType !== "player") return;

    contextMenu.style.display = "none";

    const id = currentRow.children[0].innerText.trim();

    showConfirm("Bạn chắc chắn muốn cấm tài khoản?", async () => {
      const response = await fetch("../api/admin_user_management.php", {
        method: "POST",
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        body: `action=ban_user&id=${id}`,
      });

      const data = await response.text();

      if (data.trim() === "success") {
        currentRow.classList.add("banned");
        await showMessage("🚫 Đã cấm tài khoản");
        location.reload();
      } else {
        await showMessage("❌ " + data);
      }
    });
  });

  document.getElementById("unbanAccount").addEventListener("click", () => {
    if (currentType !== "player") return;

    contextMenu.style.display = "none";

    const id = currentRow.children[0].innerText.trim();

    showConfirm("Bạn chắc chắn muốn mở cấm tài khoản?", async () => {
      const response = await fetch("../api/admin_user_management.php", {
        method: "POST",
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        body: `action=unban_user&id=${id}`,
      });

      const data = await response.text();

      if (data.trim() === "success") {
        currentRow.classList.remove("banned");
        await showMessage("✅ Đã mở cấm tài khoản");
        location.reload();
      } else {
        await showMessage("❌ " + data);
      }
    });
  });

  document.getElementById("deleteAccount").addEventListener("click", () => {
    if (currentType !== "player") return;

    contextMenu.style.display = "none";

    const id = currentRow.children[0].innerText.trim();

    showConfirm("Bạn chắc chắn muốn xóa user?", async () => {
      const response = await fetch("../api/admin_user_management.php", {
        method: "POST",
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        body: `action=delete_user&id=${id}`,
      });

      const data = await response.text();

      if (data.trim() === "success") {
        currentRow.remove();
        await showMessage("✅ Xóa user thành công");
        location.reload();
      } else {
        await showMessage("❌ " + data);
      }
    });
  });

  document.getElementById("deleteExam").addEventListener("click", () => {
    if (currentType !== "exam") return;

    contextMenu.style.display = "none";

    const examId = currentRow.children[0].innerText.trim();

    showConfirm("Bạn chắc chắn muốn xóa exam?", async () => {
      const response = await fetch("../api/admin_exam_management.php", {
        method: "POST",
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        body: `action=delete_exam&id=${examId}`,
      });

      const data = await response.text();

      if (data.trim() === "success") {
        currentRow.remove();
        await showMessage("✅ Xóa exam thành công");
        location.reload();
      } else {
        await showMessage("❌ " + data);
      }
    });
  });

  document.getElementById("approveAccount").addEventListener("click", () => {
    if (currentType !== "pending") return;

    contextMenu.style.display = "none";

    const id = currentRow.children[0].innerText.trim();

    showConfirm("Bạn chắc chắn muốn phê duyệt tài khoản này?", async () => {
      const response = await fetch("../api/admin_user_management.php", {
        method: "POST",
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        body: `action=approve_user&id=${id}`,
      });

      const data = await response.text();

      if (data.trim() === "success") {
        currentRow.remove();
        await showMessage("✅ Đã phê duyệt tài khoản");
        location.reload();
      } else {
        await showMessage("❌ " + data);
      }
    });
  });

  document
    .getElementById("deletePendingAccount")
    .addEventListener("click", () => {
      if (currentType !== "pending") return;

      contextMenu.style.display = "none";

      const id = currentRow.children[0].innerText.trim();

      showConfirm("Bạn chắc chắn muốn xóa tài khoản?", async () => {
        const response = await fetch("../api/admin_user_management.php", {
          method: "POST",
          headers: {
            "Content-Type": "application/x-www-form-urlencoded",
          },
          body: `action=delete_user&id=${id}`,
        });

        const data = await response.text();

        if (data.trim() === "success") {
          currentRow.remove();
          await showMessage("✅ Từ chối phê duyệt thành công");
          location.reload();
        } else {
          await showMessage("❌ " + data);
        }
      });
    });

  document.addEventListener("click", async (e) => {
    if (e.target.classList.contains("btn-approve-account")) {
      const id = currentRow.children[0].innerText.trim();

      showConfirm("Bạn chắc chắn muốn phê duyệt tài khoản này?", async () => {
        const response = await fetch("../api/admin_user_management.php", {
          method: "POST",
          headers: {
            "Content-Type": "application/x-www-form-urlencoded",
          },
          body: `action=approve_user&id=${id}`,
        });

        const data = await response.text();

        if (data.trim() === "success") {
          currentRow.remove();
          modal.style.display = "none";
          await showMessage("✅ Đã phê duyệt tài khoản");
          location.reload();
        } else {
          await showMessage("❌ " + data);
        }
      });
    }
  });

  // Pending Exam Table Rows
  document.querySelectorAll("#pendingExamTable tbody tr").forEach((row) => {
    row.addEventListener("click", () => {
      currentRow = row;
      currentType = "pendingExam";

      const cells = row.children;

      modalTitle.innerText = "📋 Pending Exam Information";

      modalContent.innerHTML = `
                <div class="modal-info">
                    <p><strong>Exam ID:</strong> 
                        <span>${cells[0].innerText}</span>
                    </p>
                    <p><strong>Teacher ID:</strong> 
                        <span>${cells[1].innerText}</span>
                    </p>
                    <p><strong>Exam Code:</strong> 
                        <span class="exam-code">${cells[2].innerText}</span>
                    </p>
                    <p><strong>Created At:</strong> 
                        <span>${cells[3].innerText}</span>
                    </p>
                    <br>
                    <button class="btn-view-pending-exam">
                        👁️ Xem đề
                    </button>
                </div>
            `;

      modal.style.display = "flex";
    });
  });

  // View Pending Exam
  document
    .getElementById("viewPendingExam")
    .addEventListener("click", async () => {
      if (currentType !== "pendingExam") return;

      contextMenu.style.display = "none";

      const examId = currentRow.children[0].innerText.trim();

      await loadExamQuestions(examId);
    });

  document.addEventListener("click", async (e) => {
    if (e.target.classList.contains("btn-view-pending-exam")) {
      const examId = currentRow.children[0].innerText.trim();

      modal.style.display = "none";

      await loadExamQuestions(examId);
    }
  });

  // Approve Pending Exam
  document
    .getElementById("approvePendingExam")
    .addEventListener("click", () => {
      if (currentType !== "pendingExam") return;

      contextMenu.style.display = "none";

      const examId = currentRow.children[0].innerText.trim();

      showConfirm("Bạn chắc chắn muốn phê duyệt đề thi này?", async () => {
        const response = await fetch("../api/admin_exam_management.php", {
          method: "POST",
          headers: {
            "Content-Type": "application/x-www-form-urlencoded",
          },
          body: `action=approve_exam&id=${examId}`,
        });

        const data = await response.text();

        if (data.trim() === "success") {
          currentRow.remove();
          await showMessage("✅ Đã phê duyệt đề thi");
          location.reload();
        } else {
          await showMessage("❌ " + data);
        }
      });
    });

  // Deny Pending Exam
  document.getElementById("denyPendingExam").addEventListener("click", () => {
    if (currentType !== "pendingExam") return;

    contextMenu.style.display = "none";

    const denyReasonModal = document.getElementById("denyReasonModal");
    const denyReasonTextarea = document.getElementById("denyReason");

    denyReasonTextarea.value = "";
    denyReasonModal.style.display = "flex";
  });

  const denyReasonModal = document.getElementById("denyReasonModal");
  const closeDenyModal = document.getElementById("closeDenyModal");
  const confirmDeny = document.getElementById("confirmDeny");
  const cancelDeny = document.getElementById("cancelDeny");
  const denyReason = document.getElementById("denyReason");

  closeDenyModal.onclick = () => {
    denyReasonModal.style.display = "none";
  };

  cancelDeny.onclick = () => {
    denyReasonModal.style.display = "none";
  };

  window.addEventListener("click", (e) => {
    if (e.target === denyReasonModal) {
      denyReasonModal.style.display = "none";
    }
  });

  confirmDeny.addEventListener("click", async () => {
    const examId = currentRow.children[0].innerText.trim();
    const reason = denyReason.value.trim();

    if (!reason) {
      await showMessage("⚠️ Vui lòng nhập lý do từ chối");
      return;
    }

    denyReasonModal.style.display = "none";

    showConfirm("Bạn chắc chắn muốn từ chối đề thi này?", async () => {
      const response = await fetch("../api/admin_exam_management.php", {
        method: "POST",
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        body: `action=deny_exam&id=${examId}&reason=${encodeURIComponent(reason)}`,
      });

      const data = await response.text();

      if (data.trim() === "success") {
        currentRow.remove();
        await showMessage("✅ Đã từ chối đề thi");
        location.reload();
      } else {
        await showMessage("❌ " + data);
      }
    });
  });
});
