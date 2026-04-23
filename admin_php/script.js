let rightClickRow = null;
let currentTable = '';
let selectedRowData = {};
const playerMenu = document.getElementById('playerActions');
const examMenu = document.getElementById('examActions');
const contextMenu = document.getElementById('contextMenu');
const playerModal = document.getElementById('playerModal');

document.addEventListener('click', (e) => {
    const row = e.target.closest('tr');
    if (!row?.closest('#playerTable')) return;
    
    e.stopPropagation();
    const cells = Array.from(row.children);
    selectedRowData = {
        id: cells[0]?.innerText || '',
        username: cells[1]?.innerText || '',
        role: cells[2]?.innerText || '',
        createdAt: cells[3]?.innerText || '',
        status: cells[4]?.textContent?.trim() || 'Active'
    };
    
    showPlayerModal(
        `👤 User Information: ${selectedRowData.username}`,
        `
            <div class="modal-info">
                <p><strong>🆔 ID:</strong> <span>${selectedRowData.id}</span></p>
                <p><strong>👤 Username:</strong> <span>${selectedRowData.username}</span></p>
                <p><strong>🎭 Role:</strong> <span class="role-badge">${selectedRowData.role}</span></p>
                <p><strong>📅 Created:</strong> <span>${selectedRowData.createdAt}</span></p>
                <p><strong>🔴 Status:</strong> <span class="status-badge">${selectedRowData.status}</span></p>
            </div>
        `
    );
});

document.addEventListener("contextmenu", (e) => {
    const row = e.target.closest("tr");
    if (!row) return;

    const playerTable = row.closest("#playerTable");
    const examTable = row.closest("#ExamTable");
    if (!playerTable && !examTable) return;

    e.preventDefault();
    
    rightClickRow = row;
    const cells = Array.from(row.children);
    const tableWrapper = row.closest('.table-wrapper');

    if (playerMenu) playerMenu.style.display = "none";
    if (examMenu) examMenu.style.display = "none";

    if (playerTable) {
        currentTable = "player";
        selectedRowData = {
            id: cells[0]?.innerText || '',
            username: cells[1]?.innerText || '',
            role: cells[2]?.innerText || '',
            createdAt: cells[3]?.innerText || '',
            status: cells[4]?.textContent?.trim() || 'Active'
        };
        playerMenu.style.display = "block";
    }

    else if (examTable) {
        currentTable = "exam";
        selectedRowData = {
            examId: cells[0]?.innerText || '',
            teacherId: cells[1]?.innerText || '',
            createdAt: cells[2]?.innerText || '',
            examCode: cells[3]?.innerText || '',
            status: cells[4]?.textContent?.trim() || ''
        };
        examMenu.style.display = "block";
    }

    positionContextMenuPerfect(e);
});

function positionContextMenuPerfect(e) {
    if (!contextMenu) return;

    const menuWidth = 220;
    const menuHeight = 180;

    let x = e.clientX;
    let y = e.clientY;

    if (x + menuWidth > window.innerWidth) {
        x = window.innerWidth - menuWidth - 10;
    }

    if (y + menuHeight > window.innerHeight) {
        y = window.innerHeight - menuHeight - 10;
    }

    contextMenu.style.left = x + "px";
    contextMenu.style.top = y + "px";
    contextMenu.style.display = "block";
}

['click', 'scroll'].forEach(event => {
    document.addEventListener(event, (e) => {
        if (contextMenu && !contextMenu.contains(e.target)) {
            hideContextMenu();
        }
    });
});

document.addEventListener('keydown', (e) => {
    if (e.key === 'Escape') {
        hideContextMenu();
        playerModal.style.display = 'none';
    }
});

function hideContextMenu() {
    if (contextMenu) contextMenu.style.display = 'none';
    if (playerMenu) playerMenu.style.display = 'none';
    if (examMenu) examMenu.style.display = 'none';
}

document.getElementById('banAccount')?.addEventListener('click', () => {
    if (currentTable !== 'player' || !rightClickRow) return;
    
    showConfirmDialog(
        `🚫 Bạn có chắc muốn cấm "${selectedRowData.username}"?`,
        () => {
            rightClickRow.classList.add('banned');
            rightClickRow.children[4].innerHTML = 'BANNED';
            hideContextMenu();
            showNotification(`Đã cấm ${selectedRowData.username}!`, 'error');
        }
    );
});

document.getElementById('deleteAccount')?.addEventListener('click', () => {
    if (currentTable !== 'player' || !rightClickRow) return;
    
    showConfirmDialog(
        `🗑️ Xóa "${selectedRowData.username}" vĩnh viễn?`,
        () => {
            rightClickRow.style.transition = 'all 0.4s cubic-bezier(0.4, 0, 0.2, 1)';
            rightClickRow.style.opacity = '0';
            rightClickRow.style.transform = 'translateX(-60px) scale(0.95)';
            setTimeout(() => {
                rightClickRow.remove();
                hideContextMenu();
                showNotification('Đã xóa user thành công!', 'success');
            }, 400);
        }
    );
});

document.getElementById('viewExam')?.addEventListener('click', () => {
    if (currentTable !== 'exam' || !selectedRowData) return;
    
    showPlayerModal(
        `📄 Exam Details: ${selectedRowData.examCode}`,
        `
            <div class="modal-info">
                <p><strong>🆔 Exam ID:</strong> <span>${selectedRowData.examId}</span></p>
                <p><strong>👨‍🏫 Teacher:</strong> <span>${selectedRowData.teacherId}</span></p>
                <p><strong>📅 Created:</strong> <span>${selectedRowData.createdAt}</span></p>
                <p><strong>🔑 Code:</strong> <span class="exam-code">${selectedRowData.examCode}</span></p>
                <p><strong>🔴 Status:</strong> <span class="status-badge">${selectedRowData.status}</span></p>

                <div style="margin-top:25px; text-align:center;">
                    <button class="btn-view-exam" onclick="viewExamDetail('${selectedRowData.examCode}')">
                        📖 Xem bài exam
                    </button>
            </div>
            </div>
        `
    );
    hideContextMenu();
});

document.getElementById('deleteExam')?.addEventListener('click', () => {
    if (currentTable !== 'exam' || !rightClickRow) return;
    
    showConfirmDialog(
        `🗑️ Xóa exam "${selectedRowData.examCode}"?`,
        () => {
            rightClickRow.style.transition = 'all 0.4s cubic-bezier(0.4, 0, 0.2, 1)';
            rightClickRow.style.opacity = '0';
            rightClickRow.style.transform = 'translateX(60px) scale(0.95)';
            setTimeout(() => {
                rightClickRow.remove();
                hideContextMenu();
                showNotification('Đã xóa exam thành công!', 'success');
            }, 400);
        }
    );
});

function showPlayerModal(title, content) {
    document.getElementById('modalTitle').innerHTML = title;
    document.getElementById('playerInfo').innerHTML = content;
    playerModal.style.display = 'flex';
}

function showConfirmDialog(message, onConfirm) {
    const overlay = document.createElement('div');
    overlay.className = 'confirm-overlay';

    overlay.innerHTML = `
        <div class="confirm-box">
            <p style="margin-bottom: 30px; font-size: 18px;">${message}</p>
            <div class="confirm-buttons">
                <button class="btn-confirm">Hủy</button>
                <button class="btn-danger">Xác nhận</button>
            </div>
        </div>
    `;

    document.body.appendChild(overlay);

    overlay.querySelector('.btn-confirm').onclick = () => {
        overlay.remove();
    };

    overlay.querySelector('.btn-danger').onclick = () => {
        onConfirm();   
        overlay.remove();
    };
}

function showNotification(message, type = 'info') {
    const notification = document.createElement('div');
    notification.className = `notification ${type}`;
    notification.textContent = message;
    document.body.appendChild(notification);
    
    requestAnimationFrame(() => notification.classList.add('show'));
    setTimeout(() => {
        notification.classList.remove('show');
        setTimeout(() => notification.remove(), 400);
    }, 3200);
}

document.addEventListener('click', (e) => {
    if (e.target === playerModal) playerModal.style.display = 'none';
});

document.querySelector('.close')?.addEventListener('click', () => {
    playerModal.style.display = 'none';
});

document.addEventListener('keydown', (e) => {
    if (e.key === 'Escape') {
        hideContextMenu();
        playerModal.style.display = 'none';
    }
});

document.addEventListener('DOMContentLoaded', () => {
    console.log('🚀 Vital Admin - Perfectly Loaded!');
});

function viewExamDetail(code) {
    alert("Xem bài exam: " + code);

    // 👉 sau này bạn thay bằng:
    // window.location.href = "exam.php?code=" + code;
}