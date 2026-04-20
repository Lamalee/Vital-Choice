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
function Display_bars() {
    document.getElementById("Health").style.width = hp / 20 * 100 + "%";
    document.getElementById("Hunger").style.width = hunger / 15 * 100 + "%";
    document.getElementById("Thirst").style.width = thirst / 5 * 100 + "%";
    document.getElementById("Illness").style.width = illness / 10 * 100 + "%";
    document.getElementById("Cold").style.width = cold / 10 * 100 + "%";
    document.getElementById("Sanity").style.width = halucination / 10 * 100 + "%";
    if (!check_chess) {
        document.getElementById("Chess").style.backgroundColor = "red";
    }
    else{
        document.getElementById("Chess").style.backgroundColor = "gray";
    }
    if (!check_fire) {
        document.getElementById("Fire").style.backgroundColor = "red";
    }
    else{
        document.getElementById("Fire").style.backgroundColor = "gray";
    }
    if (!check_medicine) {
        document.getElementById("Medicine").style.backgroundColor = "red";
    }
    else {
        document.getElementById("Medicine").style.backgroundColor = "gray";
    }
    if (!check_radio) {
        document.getElementById("Radio").style.backgroundColor = "red";
    }
    else{
        document.getElementById("Radio").style.backgroundColor = "gray";
    }
    if (!check_food) {
        document.getElementById("Food").style.backgroundColor = "red";
    }
    if (!check_water) {
        document.getElementById("Water").style.backgroundColor = "red";
    }
    document.getElementById("Question").innerHTML = "Medicine: " + rd_medicine + "%, Fire: " + rd_fire + "%, Chess: " + rd_chess + "%, Illness: " + rd_illness + "%, Cold: " + rd_cold + "%, Halucination: " + rd_halucination + "%, Radio: " + (rd_radio / 1000.0 * 100.0).toFixed(2) + "%";


}
function ResultPage(result) {

}
function Win() {
    ResultPage("Win");
    //Cơ chế xếp hạng sẽ được thêm sau
}
function Lose() {
    ResultPage("Lose");
}
function Questions_show(dif, type) {
    return false;
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
    endofday_button.addEventListener('click', function () {
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
function randIllness() {
    let x = (Math.floor(Math.random() * 100) + 1 <= rd_illness);
    return x ? 1 : 0;
}
function randCold() {
    let x = (Math.floor(Math.random() * 100) + 1<= rd_cold);
    return x ? 1 : 0;
}
function randHalucination() {
    let x = (Math.floor(Math.random() * 100) + 1 <= rd_halucination);
    return x ? 1 : 0;
}
function randMedicine() {
    let x = (Math.floor(Math.random() * 100) + 1 <= rd_medicine);
    return x ? 0 : 1;
}
function randFire() {
    let x = (Math.floor(Math.random() * 100) + 1 <= rd_fire);
    return x ? 0 : 1;
}
function randRadio() {
    if(dayanchor % 10 == 0)
    {
        dayanchor = 0;
        return 0;
    }
    let x = (Math.floor(Math.random() * 1000) + 1 <= rd_radio);
    return x ? 0 : 1;
}
function randChess() {
    let x = (Math.floor(Math.random() * 100) + 1 <= rd_chess);
    return x ? 0 : 1;
}
function New_Day() {
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
    rd_halucination += 2 +Math.floor(Math.random() * 5);
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

    if (thirst == 0)
        hp -= 1;
    if (hunger == 0)
        hp -= 1;
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
    }
    if (radio == 0) {
        Win();
    }
    Display_bars();
    
}

function Start() {
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
    if (!hardness) { radio = 3; }
    else { radio = 4; }
    New_Day();
    startTimer();
}

Start();
function Increase_rd() {
    rd_fire += 5;
    rd_medicine += 5;
    rd_chess += 5;
}
function Food_chosen() {
    if (check_food) {
        return;
    }
    check_food = 1;
    let ch = Questions_show("easy", "MCQ");
    if (ch && halucination < 20) {
        if (hunger == 0)
            dif_hunger += 2;
        else dif_hunger++;
        Increase_rd();
    }
    document.getElementById("Food").style.backgroundColor = "gray";
}

function Water_chosen() {
    if (check_water) {
        return;
    }
    check_water = 1;
    let ch = Questions_show("easy", "MCQ");
    if (ch && halucination < 15) {
        if (thirst == 0)
            dif_thirst += 2;
        else dif_thirst++;
        Increase_rd();
    }
    document.getElementById("Water").style.backgroundColor = "gray";
}

function Fire_chosen() {
    if (check_fire) {
        return;
    }
    check_fire = 1;
    let ch = Questions_show("medium", "MCQ");
    if (ch) {
        dif_cold -= 2;
        Increase_rd();
    }
    else rd_cold += 4;
    document.getElementById("Fire").style.backgroundColor = "gray";
}

function Medicine_chosen() {
    if (check_medicine) {
        return;
    }
    check_medicine = 1;
    let ch = Questions_show("medium", "MCQ");
    if (ch) {
        dif_illness -= 5;
        Increase_rd();
    }
    else rd_illness += 4;
    document.getElementById("Medicine").style.backgroundColor = "gray";

}

function Chess_chosen() {
    if (check_chess) {
        return;
    }
    check_chess = 1;
    let ch = Questions_show("medium", "MCQ");
    if (ch) {
        dif_halucination -= 2;
        Increase_rd();
    }
    else rd_halucination += 4;
    document.getElementById("Chess").style.backgroundColor = "gray";

}

function Radio_chosen() {
    if (check_radio) {
        return;
    }
    check_radio = 1;
    dayanchor = 0;
    let ch = Questions_show("hard", "MCQ");
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
    document.getElementById("Radio").style.backgroundColor = "gray";

}

