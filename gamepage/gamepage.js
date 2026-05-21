let hp;
let hunger;
let thirst;
let illness;
let cold;
let halucination;
let day;
let dif_thirst = 0;
let dif_hunger = 0;
let dif_illness = 0;
let dif_cold = 0;
let dif_halucination = 0;
let radio;
let hardness = 0;
let dif_radio = 0;
let time = 0;
let time_limit = 0;
let time_dif;
let check_food = 0;
let check_water = 0;
let check_medicine = 0;
let check_fire = 0;
let check_radio = 0;
let check_chess = 0;
let rd_medicine;
let rd_fire;
let rd_radio;
let rd_chess;
let rd_illness;
let rd_cold;
let rd_halucination;
let dayanchor;
let isanswering = false;
let gameOver = false;
let paused = false;
let rank = "jobless";
let firstActionDone = false;
const characterImages = {
  normal: "../image/teo_normal.png",
  looting: "../image/teo_loot_chest.gif",

  eat: "../image/teo_eat.png",
  hungry: "../image/teo_hungry.png",

  drink: "../image/teo_drink.png",
  thirsty: "../image/teo_thirsty.png",

  medicine: "../image/teo_medicine.png",
  sick: "../image/teo_sick.png",

  warm: "../image/teo_warm.png",
  cold: "../image/teo_cold.png",

  chess: "../image/teo_chess.png",
  mentalLost: "../image/teo_mental_lost.png",

  radioSignal: "../image/radio_signal.png",
  radioLost: "../image/radio_lost.png",

  hp15: "../image/teo_hp_15_20.png",
  hp10: "../image/teo_hp_10_14.png",
  hp4: "../image/teo_hp_4_9.png",
  hp1: "../image/teo_hp_1_3.png",

  rescued: "../image/teo_rescued.png",
  dead: "../image/teo_dead.png",
};

function setCharacterImage(state) {
  const character = document.querySelector(".character");
  if (!character) return;

  character.style.backgroundImage = `url('${characterImages[state]}')`;
}
function updateCharacterByHP() {
  if (gameOver) return;

  if (hp >= 20) {
    setCharacterImage("normal");
  } else if (hp >= 15) {
    setCharacterImage("hp15");
  } else if (hp >= 10) {
    setCharacterImage("hp10");
  } else if (hp >= 4) {
    setCharacterImage("hp4");
  } else if (hp >= 1) {
    setCharacterImage("hp1");
  }
}
function Display_bars() {
  document.getElementById("Health").style.width = (hp / 20) * 100 + "%";
  document.getElementById("Hunger").style.width = (hunger / 15) * 100 + "%";
  document.getElementById("Thirst").style.width = (thirst / 5) * 100 + "%";
  document.getElementById("Illness").style.width = (illness / 10) * 100 + "%";
  document.getElementById("Cold").style.width = (cold / 10) * 100 + "%";
  document.getElementById("Sanity").style.width =
    (halucination / 10) * 100 + "%";
  if (!check_chess) {
    document.getElementById("Chess").style.backgroundImage =
      "url('../image/Chess.png')";
  } else {
    document.getElementById("Chess").style.backgroundImage =
      "url('../image/Chess_Used.jpg')";
  }
  if (!check_fire) {
    document.getElementById("Fire").style.backgroundImage =
      "url('../image/Fire.png')";
  } else {
    document.getElementById("Fire").style.backgroundImage =
      "url('../image/Fire_Used.jpg')";
  }
  if (!check_medicine) {
    document.getElementById("Medicine").style.backgroundImage =
      "url('../image/Medicine.png')";
  } else {
    document.getElementById("Medicine").style.backgroundImage =
      "url('../image/Medicine_Used.jpg')";
  }
  if (!check_radio) {
    document.getElementById("Radio").style.backgroundImage =
      "url('../image/Radio.png')";
  } else {
    document.getElementById("Radio").style.backgroundImage =
      "url('../image/Radio_Used.jpg')";
  }
  if (!check_food) {
    document.getElementById("Food").style.backgroundImage =
      "url('../image/Food.png')";
  } else {
    document.getElementById("Food").style.backgroundImage =
      "url('../image/Food_Used.jpg')";
  }
  if (!check_water) {
    document.getElementById("Water").style.backgroundImage =
      "url('../image/Water.png')";
  } else {
    document.getElementById("Water").style.backgroundImage =
      "url('../image/Water_Used.jpg')";
  }
  updateCharacterByHP();
}
function Ranking() {
  if (hp == 20) {
    rank = "master";
  } else if (hp >= 15) {
    rank = "senior";
  } else if (hp >= 10) {
    rank = "intermediate";
  } else if (hp >= 5) {
    rank = "junior";
  } else {
    rank = "fresher";
  }
}
function watchResult() {
  window.location.href = "../tongket/Tongket1.php";
}
function Win() {
  setCharacterImage("rescued");
  gameOver = true;
  clearInterval(time_dif);
  Ranking();
  const formData2 = new FormData();
  formData2.append("hp", hp);
  formData2.append("day", day);
  formData2.append("rank", rank);
  fetch("../api/update_session.php", { method: "POST", body: formData2 });
  const formData = new FormData();
  formData.append("day", day);
  fetch("../api/end_game.php", { method: "POST", body: formData });
  document.getElementById("winPopup").style.display = "flex";
}
function Lose() {
  setCharacterImage("dead");
  gameOver = true;
  clearInterval(time_dif);
  const formData2 = new FormData();
  formData2.append("hp", hp);
  formData2.append("day", day);
  formData2.append("rank", rank);
  fetch("../api/update_session.php", { method: "POST", body: formData2 });
  const formData = new FormData();
  formData.append("day", day);
  fetch("../api/end_game.php", { method: "POST", body: formData });
  document.getElementById("losePopup").style.display = "flex";
}
function renderQuestion(data) {
  return new Promise((resolve) => {
    let t = data.question;
    t = t.replace(/"/g, "");
    document.getElementById("Question").textContent = t;

    let btns = [
      document.getElementById("Answer1"),
      document.getElementById("Answer2"),
      document.getElementById("Answer3"),
      document.getElementById("Answer4"),
    ];

    for (let i = 0; i < 4; i++) {
      btns[i].style.display = "inline-block";
      let s = data.answers[i].content;
      s = s.replace(/"/g, "");
      s = s.slice(1);
      if (i == 0) s = "A" + s;
      else if (i == 1) s = "B" + s;
      else if (i == 2) s = "C" + s;
      else if (i == 3) s = "D" + s;
      btns[i].innerHTML = s;
      btns[i].disabled = false;
      btns[i].style.backgroundColor = "rgba(32, 18, 10, 0.92)";
      btns[i].onclick = async function () {
        // Sau khi click, trả về kết quả đúng/sai và ẩn câu hỏi (tùy chọn)
        const isCorrect = data.answers[i].is_correct == 1;
        const formData = new FormData();
        formData.append("question_id", data.question_id);
        formData.append("answer_id", data.answers[i].answer_id);
        formData.append("is_correct", isCorrect ? 1 : 0);
        formData.append("day", day);
        formData.append("exam_id", CURRENT_EXAM_ID);
        fetch("../api/save_answer.php", { method: "POST", body: formData });
        btns.forEach((btn) => (btn.disabled = true));
        if (isCorrect) {
          btns[i].style.backgroundColor = "green";
        } else {
          btns[i].style.backgroundColor = "red";
        }
        isanswering = false;
        resolve(isCorrect);
      };
    }
  });
}
async function Questions_show(tag, type) {
  isanswering = true;
  const fd = new FormData();
  fd.append("type", type);
  fd.append("tag", tag);
  if (CURRENT_EXAM_ID) {
    fd.append("exam_id", CURRENT_EXAM_ID);
  }
  try {
    const response = await fetch("../api/get_question.php", {
      method: "POST",
      body: fd,
    });
    const data = await response.json();
    if (data.error) {
      console.log("Không tìm thấy câu hỏi phù hợp");
      isanswering = false;
      return false;
    }
    const result = await renderQuestion(data);
    isanswering = false;
    return result;
  } catch (error) {
    console.error("Lỗi kết nối server:", error);
    isanswering = false;
    return false;
  }
}

function EndofDay() {
  // Clear the question and answers immediately
  document.getElementById("Question").textContent = "";
  let btns = [
    document.getElementById("Answer1"),
    document.getElementById("Answer2"),
    document.getElementById("Answer3"),
    document.getElementById("Answer4"),
  ];
  for (let btn of btns) {
    btn.innerHTML = "";
    btn.disabled = true;
    btn.style.backgroundColor = "rgba(32, 18, 10, 0.92)";
    isanswering = false;
  }

  // Làm mờ nền sau
  const overlay = document.createElement("div");
  overlay.style.position = "fixed";
  overlay.style.top = "0";
  overlay.style.left = "0";
  overlay.style.width = "100%";
  overlay.style.height = "100%";
  overlay.style.backgroundColor = "rgba(0, 0, 0, 0.5)";
  overlay.style.zIndex = "1000";
  overlay.style.display = "flex";
  overlay.style.justifyContent = "center";
  overlay.style.alignItems = "center";

  const endofday_box = document.createElement("div");
  endofday_box.style.width = "300px";
  endofday_box.style.height = "200px";
  endofday_box.style.background = "linear-gradient(145deg, #3b2a1b, #18120d)";
  endofday_box.style.border = "5px solid #9b6a35";
  endofday_box.style.boxShadow = "0 0 25px rgba(0,0,0,0.8)";
  endofday_box.style.borderRadius = "10px";
  endofday_box.style.display = "flex";
  endofday_box.style.flexDirection = "column";
  endofday_box.style.justifyContent = "center";
  endofday_box.style.alignItems = "center";
  endofday_box.style.padding = "20px";

  const endofday_text = document.createElement("div");
  endofday_text.style.fontSize = "24px";
  endofday_text.style.fontWeight = "bold";
  endofday_text.style.color = "#fff1c7";
  endofday_text.style.textShadow = "2px 2px 2px black";
  endofday_text.style.marginBottom = "20px";
  endofday_text.textContent = "End of day " + day;

  const endofday_button = document.createElement("button");
  endofday_button.textContent = "Next day";
  endofday_button.style.padding = "10px 20px";
  endofday_button.style.fontSize = "18px";
  endofday_button.style.background = "linear-gradient(#ffd76a, #b97a25)";
  endofday_button.style.border = "3px solid #5c3a1c";
  endofday_button.style.borderRadius = "12px";
  endofday_button.style.color = "#20140b";
  endofday_button.style.fontWeight = "bold";
  endofday_button.style.cursor = "pointer";
  endofday_button.addEventListener("click", function () {
    document.body.removeChild(overlay);
    New_Day();
    startTimer();
  });

  endofday_box.appendChild(endofday_text);
  endofday_box.appendChild(endofday_button);

  overlay.appendChild(endofday_box);

  document.body.appendChild(overlay);
}
function Time_running() {
  if (gameOver) return;
  time--;
  document.getElementById("Timer").innerHTML = "Day " + day + ": " + time;
  if (time == 0) {
    clearInterval(time_dif);
    EndofDay();
  }
}
function startTimer() {
  time = time_limit;
  clearInterval(time_dif);
  document.getElementById("Timer").innerHTML = "Day " + day + ": " + time;
  time_dif = setInterval(Time_running, 1000);
}
function resumeTimer() {
  if (gameOver) return;
  clearInterval(time_dif);
  time_dif = setInterval(Time_running, 1000);
}
function Confirm_Quit() {
  paused = true;
  clearInterval(time_dif);
  document.getElementById("confirmPopup").style.display = "flex";
}
function closeConfirm() {
  document.getElementById("confirmPopup").style.display = "none";
  paused = false;
  resumeTimer();
}
function confirmLose() {
  Lose();
  document.getElementById("confirmPopup").style.display = "none";
}
function SkipDay() {
  time = 0;
  clearInterval(time_dif);
  EndofDay();
}
function randIllness() {
  let x = Math.floor(Math.random() * 100) + 1 <= rd_illness;
  return x ? 1 : 0;
}
function randCold() {
  let x = Math.floor(Math.random() * 100) + 1 <= rd_cold;
  return x ? 1 : 0;
}
function randHalucination() {
  let x = Math.floor(Math.random() * 100) + 1 <= rd_halucination;
  return x ? 1 : 0;
}
function randMedicine() {
  let x = Math.floor(Math.random() * 100) + 1 <= rd_medicine;
  return x ? 0 : 1;
}
function randFire() {
  let x = Math.floor(Math.random() * 100) + 1 <= rd_fire;
  return x ? 0 : 1;
}
function randRadio() {
  if (dayanchor % 10 == 0) {
    dayanchor = 0;
    return 0;
  }
  let x = Math.floor(Math.random() * 1000) + 1 <= rd_radio;
  return x ? 0 : 1;
}
function randChess() {
  let x = Math.floor(Math.random() * 100) + 1 <= rd_chess;
  return x ? 0 : 1;
}
function New_Day() {
  if (gameOver) return;
  day++;
  dayanchor++;
  thirst += dif_thirst;
  hunger += dif_hunger;
  cold += dif_cold;
  illness += dif_illness;
  halucination += dif_halucination;
  radio += dif_radio;
  dif_thirst = -1;
  dif_hunger = -1;
  rd_radio += 10;
  rd_illness += 2 + Math.floor(Math.random() * 5);
  rd_cold += 2 + Math.floor(Math.random() * 5);
  rd_halucination += 2 + Math.floor(Math.random() * 5);
  dif_illness = randIllness();
  dif_cold = randCold();
  dif_halucination = randHalucination();
  dif_radio = 0;
  check_food = 0;
  check_water = 0;
  check_medicine = randMedicine();
  check_fire = randFire();
  check_radio = randRadio();
  check_chess = randChess();
  if (thirst < 0) {
    thirst = 0;
  }
  if (hunger < 0) {
    hunger = 0;
  }
  if (cold > 10) {
    cold = 10;
  }
  if (illness > 10) {
    illness = 10;
  }
  if (halucination > 10) {
    halucination = 10;
  }
  if (cold < 0) {
    cold = 0;
  }
  if (illness < 0) {
    illness = 0;
  }
  if (halucination < 0) {
    halucination = 0;
  }

  if (thirst == 0) hp -= 1;
  if (hunger == 0) hp -= 1;
  if (cold == 10) {
    hunger -= 1;
    thirst -= 1;
    illness += 2;
  }
  if (illness == 10) {
    hp -= 1;
    thirst -= 1;
    hunger -= 1;
  }
  if (hp <= 0) {
    Lose();
    return;
  }
  if (radio == 0) {
    Win();
    return;
  }

  Display_bars();
  updateCharacterByHP();
}
async function getTimeInExam() {
  const response = await fetch(`../api/gettime.php?exam_id=${CURRENT_EXAM_ID}`);
  const data = await response.json();

  if (data.success) {
    time_limit = data.time;
  }
}

async function Start() {
  hp = 20;
  hunger = 15;
  thirst = 5;
  illness = 0;
  cold = 0;
  halucination = 0;
  day = 0;
  setCharacterImage("normal");
  dayanchor = 0;
  rd_medicine = 0;
  rd_fire = 0;
  rd_radio = 5;
  rd_chess = 0;
  rd_illness = 0;
  rd_cold = 0;
  rd_halucination = 0;
  if (!hardness) {
    radio = 3;
  } else {
    radio = 4;
  }
  await getTimeInExam();
  New_Day();
  startTimer();
}

Start();
function Increase_rd() {
  rd_fire += 5;
  rd_medicine += 5;
  rd_chess += 5;
}
async function Food_chosen() {
  if (check_food || isanswering) return;

  setCharacterImage("eat");

  const foodEl = document.getElementById("Food");
  foodEl.classList.add("active");
  foodEl.style.backgroundImage = "url('../image/Food.gif')";
  check_food = 1;

  let ch = await Questions_show(0, 0);

  foodEl.classList.remove("active");
  foodEl.style.backgroundImage = "url('../image/Food_Used.jpg')";

  if (ch && halucination < 20) {
    if (hunger == 0) dif_hunger += 2;
    else dif_hunger++;
    Increase_rd();
  } else {
    setCharacterImage("hungry");
  }

  setTimeout(updateCharacterByHP, 800);
}

async function Water_chosen() {
  if (check_water || isanswering) return;

  setCharacterImage("drink");

  const waterEl = document.getElementById("Water");
  waterEl.classList.add("active");
  waterEl.style.backgroundImage = "url('../image/Water.gif')";
  check_water = 1;

  let ch = await Questions_show(0, 0);

  waterEl.classList.remove("active");
  waterEl.style.backgroundImage = "url('../image/Water_Used.jpg')";

  if (ch && halucination < 15) {
    if (thirst == 0) dif_thirst += 2;
    else dif_thirst++;
    Increase_rd();
  } else {
    setCharacterImage("thirsty");
  }

  setTimeout(updateCharacterByHP, 800);
}

async function Fire_chosen() {
  if (check_fire || isanswering) return;

  setCharacterImage("warm");

  const fireEl = document.getElementById("Fire");
  fireEl.classList.add("active");
  fireEl.style.backgroundImage = "url('../image/Fire.gif')";
  check_fire = 1;

  let ch = await Questions_show(1, 0);

  fireEl.classList.remove("active");
  fireEl.style.backgroundImage = "url('../image/Fire_Used.jpg')";

  if (ch) {
    dif_cold -= 1;
    Increase_rd();
  } else {
    rd_cold += 4;
    setCharacterImage("cold");
  }

  setTimeout(updateCharacterByHP, 800);
}

async function Medicine_chosen() {
  if (check_medicine || isanswering) return;

  setCharacterImage("medicine");

  const medicineEl = document.getElementById("Medicine");
  medicineEl.classList.add("active");
  medicineEl.style.backgroundImage = "url('../image/Medicine.gif')";
  check_medicine = 1;

  let ch = await Questions_show(1, 0);

  medicineEl.classList.remove("active");
  medicineEl.style.backgroundImage = "url('../image/Medicine_Used.jpg')";

  if (ch) {
    dif_illness -= 1;
    Increase_rd();
  } else {
    rd_illness += 4;
    setCharacterImage("sick");
  }

  setTimeout(updateCharacterByHP, 800);
}

async function Chess_chosen() {
  if (check_chess || isanswering) return;

  setCharacterImage("chess");

  const chessEl = document.getElementById("Chess");
  chessEl.classList.add("active");
  chessEl.style.backgroundImage = "url('../image/Chess.gif')";
  check_chess = 1;

  let ch = await Questions_show(1, 0);

  chessEl.classList.remove("active");
  chessEl.style.backgroundImage = "url('../image/Chess_Used.jpg')";

  if (ch) {
    dif_halucination -= 1;
    Increase_rd();
  } else {
    rd_halucination += 4;
    setCharacterImage("mentalLost");
  }

  setTimeout(updateCharacterByHP, 800);
}

async function Radio_chosen() {
  if (check_radio || isanswering) return;

  setCharacterImage("radioSignal");

  const radioEl = document.getElementById("Radio");
  radioEl.classList.add("active");
  radioEl.style.backgroundImage = "url('../image/Radio.gif')";
  check_radio = 1;
  dayanchor = 0;

  let ch = await Questions_show(2, 0);

  radioEl.classList.remove("active");
  radioEl.style.backgroundImage = "url('../image/Radio_Used.jpg')";

  if (ch && halucination < 15) {
    setCharacterImage("radioSignal");

    dif_radio -= 1;
    dif_cold -= 1;
    dif_illness -= 1;
    dif_halucination -= 1;
    dif_hunger += 2;
    dif_thirst += 2;
    rd_radio = 5;
    rd_fire = 0;
    rd_medicine = 0;
    rd_chess = 0;
  } else {
    setCharacterImage("radioLost");
  }

  setTimeout(updateCharacterByHP, 800);
}

/* ================= CHEST OPEN / CLOSE - ADD ONLY ================= */

function openChest() {
  const chest = document.querySelector(".question_container");
  if (chest) {
    chest.classList.add("open");
  }
}

function closeChest() {
  const chest = document.querySelector(".question_container");
  if (chest) {
    chest.classList.remove("open");
  }
}

/* Bọc lại hàm Questions_show, không sửa code gốc */
const old_Questions_show = Questions_show;

Questions_show = async function (tag, type) {
  openChest();

  const result = await old_Questions_show(tag, type);

  setTimeout(() => {
    closeChest();
  }, 700);

  return result;
};

/* Qua ngày mới thì rương đóng */
const old_New_Day = New_Day;

New_Day = function () {
  closeChest();
  old_New_Day();
};

/* End day thì rương cũng đóng */
const old_EndofDay = EndofDay;

EndofDay = function () {
  closeChest();
  old_EndofDay();
};
