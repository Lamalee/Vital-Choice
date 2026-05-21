document.addEventListener("DOMContentLoaded", () => {
  fetch("../api/get_profile_data.php")
    .then((res) => res.json())
    .then((data) => {
      document.getElementById("user_display_name").textContent = data.user.name;
      document.getElementById("user_display_id").textContent =
        "#" + data.user.id;
      document.getElementById("stat_total_games").textContent =
        data.stats.total_games || 0;
      document.getElementById("stat_longest_survival").textContent =
        (data.stats.longest_survival || 0) + " ngày";
      document.getElementById("stat_best_score").textContent =
        (data.stats.best_score || 0) + "%";
      document.getElementById("stat_wrong_answers").textContent =
        data.stats.wrong_answers || 0;
      const badge100 = document.getElementById("badge_100_days");
      if (parseInt(data.stats.longest_survival) >= 100) {
        badge100.classList.remove("locked");
        badge100.style.filter = "none";
        badge100.style.opacity = "1";
      }

      const badgePerfect = document.getElementById("badge_perfect_game");
      if (parseInt(data.stats.best_score) >= 100) {
        badgePerfect.classList.remove("locked");
        badgePerfect.style.filter = "none";
        badgePerfect.style.opacity = "1";
      }
      const total = parseInt(data.overall.t) || 0;
      const correct = parseInt(data.overall.c) || 0;
      const correctPct = total > 0 ? Math.round((correct * 100) / total) : 0;
      const wrongPct = total > 0 ? 100 - correctPct : 0;

      document.getElementById("perf_correct_percent").textContent =
        correctPct + "%";
      document.getElementById("bar_correct").style.width = correctPct + "%";
      document.getElementById("perf_wrong_percent").textContent =
        wrongPct + "%";
      document.getElementById("bar_wrong").style.width = wrongPct + "%";

      const container = document.getElementById("history_container");
      if (data.history && data.history.length > 0) {
        const emptyMsg = document.getElementById("history_empty_msg");
        if (emptyMsg) emptyMsg.style.display = "none";

        container.innerHTML = "";

        data.history.forEach((item) => {
          const pct = Math.round((item.c * 100) / item.t);
          const row = document.createElement("div");
          row.className = "history-row";
          let rankText = item.rank;
          let rankClass = "rank-" + rankText;

          row.innerHTML = `
            <span>Phiên #${item.session_id}</span> | 
            <span>Ngày ${item.day}</span> | 
            <span style="color:lime">Đúng: ${pct}%</span> | 
            <span class="${rankClass}">Hạng: ${rankText}</span>
          `;
          container.appendChild(row);
        });
      }
    })
    .catch((err) => console.error("Lỗi lấy dữ liệu:", err));
});
