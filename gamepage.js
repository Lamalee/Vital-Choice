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

function Display_bars() {
    document.getElementById("Health").style.width = hp / 20 * 100 + "%";
    document.getElementById("Hunger").style.width = hunger / 15 * 100 + "%";
    document.getElementById("Thirst").style.width = thirst / 5 * 100 + "%";
    document.getElementById("Illness").style.width = illness / 15 * 100 + "%";
    document.getElementById("Cold").style.width = cold / 20 * 100 + "%";
    document.getElementById("Sanity").style.width = halucination / 20 * 100 + "%";
}
function Win() {
    alert("You win!");
}
function Lose() {
    alert("You lose!");
}
function EndofDay() {
    // Làm mờ nền sau
    const overlay = document.createElement('div');
    overlay.style.position = 'fixed';
    overlay.style.top = '0';
    overlay.style.left = '0';
    overlay.style.width = '100%';
    overlay.style.height = '100%';
    overlay.style.backgroundColor = 'rgba(0, 0, 0, 0.5)';
    overlay.style.zIndex = '1000';
    overlay.style.display = 'flex';
    overlay.style.justifyContent = 'center';
    overlay.style.alignItems = 'center';

    // Tạo hộp thoại
    const endofday_box = document.createElement('div');
    endofday_box.style.width = '300px';
    endofday_box.style.height = '200px';
    endofday_box.style.backgroundColor = 'white';
    endofday_box.style.border = '2px solid black';
    endofday_box.style.borderRadius = '10px';
    endofday_box.style.display = 'flex';
    endofday_box.style.flexDirection = 'column';
    endofday_box.style.justifyContent = 'center';
    endofday_box.style.alignItems = 'center';
    endofday_box.style.padding = '20px';

    const endofday_text = document.createElement('div');
    endofday_text.style.fontSize = '24px';
    endofday_text.style.fontWeight = 'bold';
    endofday_text.style.marginBottom = '20px';
    endofday_text.textContent = 'End of day ' + day;

    const endofday_button = document.createElement('button');
    endofday_button.textContent = 'Next day';
    endofday_button.style.padding = '10px 20px';
    endofday_button.style.fontSize = '18px';
    endofday_button.style.cursor = 'pointer';
    endofday_button.addEventListener('click', function() {
        document.body.removeChild(overlay);
        New_Day();
        startTimer();
    });

    endofday_box.appendChild(endofday_text);
    endofday_box.appendChild(endofday_button);

    overlay.appendChild(endofday_box);   

    document.body.appendChild(overlay);
}

function startTimer() {
    time = 10;
    document.getElementById("Timer").innerHTML = "Day " + day + ": " + time;
    time_dif = setInterval(function () {
        time--;
        document.getElementById("Timer").innerHTML = "Day " + day + ": " + time;
        if (time == 0) {
            clearInterval(time_dif);
            EndofDay();
        }
    }, 1000);
}

function New_Day() {
    day++;
    thirst += dif_thirst;
    hunger += dif_hunger;
    cold += dif_cold;
    illness += dif_illness;
    halucination += dif_halucination;
    radio += dif_radio;
    dif_thirst = 0;
    dif_hunger = 0;
    dif_illness = 0;
    dif_cold = 0;
    dif_halucination = 0;
    dif_radio = 0;
    if (thirst < 0) {
        thirst = 0;
    }
    if (hunger < 0) {
        hunger = 0;
    }
    if (cold > 20) {
        cold = 20;
    }
    if (illness > 15) {
        illness = 15;
    }
    if (halucination > 20) {
        halucination = 20;
    }
    if (thirst == 0)
        hp -= 1;
    if (hunger == 0)
        hp -= 1;
    if (cold == 20) {
        hunger -= 1;
        thirst -= 1;
        illness += 2;
    }
    if (illness == 15) {
        hp -= 1;
        thirst -= 1;
        hunger -= 1;
    }
    if(hp == 0)
    {
        Lose();
    }
    if(radio == 0){
        Win();
    }
    Display_bars();
    startTimer();
}

function Start() {
    hp = 20;
    hunger = 15;
    thirst = 5;
    illness = 0;
    cold = 0;
    halucination = 0;
    day = 0;
    if (!hardness) { radio = 3; }
    else { radio = 4; }
    New_Day();
}

Start();
