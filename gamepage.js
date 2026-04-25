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
let time;
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
      "url('image/Chess.png')";
  } else {
    document.getElementById("Chess").style.backgroundImage =
      "url('image/Chess_Used.jpg')";
  }
  if (!check_fire) {
    document.getElementById("Fire").style.backgroundImage =
      "url('image/Fire.png')";
  } else {
    document.getElementById("Fire").style.backgroundImage =
      "url('image/Fire_Used.jpg')";
  }
  if (!check_medicine) {
    document.getElementById("Medicine").style.backgroundImage =
      "url('image/Medicine.png')";
  } else {
    document.getElementById("Medicine").style.backgroundImage =
      "url('image/Medicine_Used.jpg')";
  }
  if (!check_radio) {
    document.getElementById("Radio").style.backgroundImage =
      "url('image/Radio.png')";
  } else {
    document.getElementById("Radio").style.backgroundImage =
      "url('image/Radio_Used.jpg')";
  }
  if (!check_food) {
    document.getElementById("Food").style.backgroundImage =
      "url('image/Food.png')";
  } else {
    document.getElementById("Food").style.backgroundImage =
      "url('image/Food_Used.jpg')";
  }
  if (!check_water) {
    document.getElementById("Water").style.backgroundImage =
      "url('image/Water.png')";
  } else {
    document.getElementById("Water").style.backgroundImage =
      "url('image/Water_Used.jpg')";
  }
}
function ResultPage(result) {}
function Win() {
  gameOver = true;
  clearInterval(time_dif);
  document.getElementById("winPopup").style.display = "flex";
}
function Lose() {
  gameOver = true;
  clearInterval(time_dif);
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
      btns[i].style.backgroundColor = "rgb(252, 250, 250)";
      btns[i].onclick = async function () {
        // Sau khi click, trả về kết quả đúng/sai và ẩn câu hỏi (tùy chọn)
        const isCorrect = data.answers[i].is_correct == 1;
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

function Questions_show(tag, type) {
  isanswering = true;
  return fetch(`get_question.php?type=${type}&tag=${tag}`)
    .then((res) => res.json())
    .then((data) => {
      if (data.error) return false;
      return renderQuestion(data);
    })
    .finally(() => {
      isanswering = false;
    });
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
    btn.style.backgroundColor = "rgb(252, 250, 250)";
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
  endofday_box.style.backgroundColor = "white";
  endofday_box.style.border = "2px solid black";
  endofday_box.style.borderRadius = "10px";
  endofday_box.style.display = "flex";
  endofday_box.style.flexDirection = "column";
  endofday_box.style.justifyContent = "center";
  endofday_box.style.alignItems = "center";
  endofday_box.style.padding = "20px";

  const endofday_text = document.createElement("div");
  endofday_text.style.fontSize = "24px";
  endofday_text.style.fontWeight = "bold";
  endofday_text.style.marginBottom = "20px";
  endofday_text.textContent = "End of day " + day;

  const endofday_button = document.createElement("button");
  endofday_button.textContent = "Next day";
  endofday_button.style.padding = "10px 20px";
  endofday_button.style.fontSize = "18px";
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
  time = TIME_LIMIT;
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
  document.getElementById("confirmPopup").style.display = "none";
  Lose();
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
  if (hp == 0) {
    Lose();
    return;
  }
  if (radio == 0) {
    Win();
    return;
  }
  Display_bars();
}

async function Start() {
  hp = 20;
  hunger = 15;
  thirst = 5;
  illness = 0;
  cold = 0;
  halucination = 0;
  day = 0;
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
  if (check_food || isanswering) {
    return;
  }
  const foodEl = document.getElementById("Food");
  foodEl.classList.add("active");
  foodEl.style.backgroundImage = "url('image/Food.gif')";
  check_food = 1;
  let ch = await Questions_show(0, 0);
  foodEl.classList.remove("active");
  foodEl.style.backgroundImage = "url('image/Food_Used.jpg')";
  if (ch && halucination < 20) {
    if (hunger == 0) dif_hunger += 2;
    else dif_hunger++;
    Increase_rd();
  }
}

async function Water_chosen() {
  if (check_water || isanswering) {
    return;
  }
  const waterEl = document.getElementById("Water");
  waterEl.classList.add("active");
  waterEl.style.backgroundImage = "url('image/Water.gif')";
  check_water = 1;
  let ch = await Questions_show(0, 0);
  waterEl.classList.remove("active");
  waterEl.style.backgroundImage = "url('image/Water_Used.jpg')";
  if (ch && halucination < 15) {
    if (thirst == 0) dif_thirst += 2;
    else dif_thirst++;
    Increase_rd();
  }
}

async function Fire_chosen() {
  if (check_fire || isanswering) {
    return;
  }
  const fireEl = document.getElementById("Fire");
  fireEl.classList.add("active");
  fireEl.style.backgroundImage = "url('image/Fire.gif')";
  check_fire = 1;
  let ch = await Questions_show(1, 0);
  fireEl.classList.remove("active");
  fireEl.style.backgroundImage = "url('image/Fire_Used.jpg')";
  if (ch) {
    dif_cold -= 2;
    Increase_rd();
  } else rd_cold += 4;
}

async function Medicine_chosen() {
  if (check_medicine || isanswering) {
    return;
  }
  const medicineEl = document.getElementById("Medicine");
  medicineEl.classList.add("active");
  medicineEl.style.backgroundImage = "url('image/Medicine.gif')";
  check_medicine = 1;
  let ch = await Questions_show(1, 0);
  medicineEl.classList.remove("active");
  medicineEl.style.backgroundImage = "url('image/Medicine_Used.jpg')";
  if (ch) {
    dif_illness -= 5;
    Increase_rd();
  } else rd_illness += 4;
}

async function Chess_chosen() {
  if (check_chess || isanswering) {
    return;
  }
  const chessEl = document.getElementById("Chess");
  chessEl.classList.add("active");
  chessEl.style.backgroundImage = "url('image/Chess.gif')";
  check_chess = 1;
  let ch = await Questions_show(1, 0);
  chessEl.classList.remove("active");
  chessEl.style.backgroundImage = "url('image/Chess_Used.jpg')";
  if (ch) {
    dif_halucination -= 2;
    Increase_rd();
  } else rd_halucination += 4;
}

async function Radio_chosen() {
  if (check_radio || isanswering) {
    return;
  }
  const radioEl = document.getElementById("Radio");
  radioEl.classList.add("active");
  radioEl.style.backgroundImage = "url('image/Radio.gif')";
  check_radio = 1;
  dayanchor = 0;
  let ch = await Questions_show(2, 0);
  radioEl.classList.remove("active");
  radioEl.style.backgroundImage = "url('image/Radio_Used.jpg')";
  if (ch && halucination < 15) {
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
  }
}
