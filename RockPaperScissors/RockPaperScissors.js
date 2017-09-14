// Whitney King - Project 1
// Rock, Paper, Scissors

//Global Variables
var options = ["Rock",
               "Paper",
               "Scissors"];
var turnsRemaining = 10;
var userChoice;
var compChoice;
var countWins = 0;
var countLosses = 0;
var countTies = 0;


//Function:  Game Play Area
function playGame() {
    document.getElementById("title").style.display = "none";
    document.getElementById("score").style.display = "block";
    document.getElementById("playArea").style.borderTop = "5px";
    document.getElementById("info").innerHTML = "<br /><img src='choose.png' width='175'><br /><br />";
    document.getElementById("choices").style.display = "block";
}

//Function:  Update On Screen Numbers
function statUpdate() {
    document.getElementById("roundsRemaining").innerHTML = turnsRemaining;
    document.getElementById("totalWins").innerHTML = countWins;
    document.getElementById("totalTies").innerHTML = countTies;
    document.getElementById("totalLosses").innerHTML = countLosses;
    turnsRemaining = turnsRemaining - 1;
}

//Display Image Choices
function showRPS() {
    for (var i = 0; i < options.length; i++) {
        document.getElementById(options[i]).style.display = "block";
    }
    setTimeout(function() {document.getElementById("rounds").style.display = "block"}, 500);
    statUpdate();
}

//Function:  Computer Choice
function computerChoice() {
    var randomNumber = Math.ceil(Math.random() * 3) - 1;
    compChoice = options[randomNumber];
    document.getElementById("Computer").innerHTML = "<img src='" + compChoice + ".png' height='50'>";
}

//Function: Handle Rock Choice
function rockClick() {
    userChoice = options[0];
    document.getElementById("You").innerHTML = "<img src='" + userChoice + ".png' height='50'>";
    logic();
    statUpdate();
}

//Function:  Handle Paper Choice
function paperClick() {
    userChoice = options[1];
    document.getElementById("You").innerHTML = "<img src='" + userChoice + ".png' height='50'>";
    logic();
    statUpdate();
}

//Function:  Handle Scissors Choice
function scissorsClick() {
    userChoice = options[2];
    document.getElementById("You").innerHTML = "<img src='" + userChoice + ".png' height='50'>";
    logic();
    statUpdate();
}

//Function:  Handle Win Math
function win() {
    countWins++;
}

//Function:  Handle Loss Math
function loss() {
    countLosses++;
}

//Function:  Handle Tie Math
function tie() {
    countTies++
}

//Function:  Determine Winner
function logic() {
    computerChoice();
    
    if (userChoice == compChoice) {
        tie();
    } else if ((userChoice == options[0]) && (compChoice == options[1])) {
        loss();
    } else if ((userChoice == options[0]) && (compChoice == options[2])) {
        win();
    } else if ((userChoice == options[1]) && (compChoice == options[0])) {
        win();
    } else if ((userChoice == options[1]) && (compChoice == options[2])) {
        loss();
    } else if ((userChoice == options[2]) && (compChoice == options[0])) {
        loss();
    } else if ((userChoice == options[2]) && (compChoice == options[1])) {
        win();
    } 
    
    gameOver();
}

//Function:  Handle 10 Turn Limit
function gameOver(){
    if (turnsRemaining == 0) {
        document.getElementById("info").innerHTML = "<br /><img src='GameOver.png' width='150'>";
        document.getElementById("choices").style.display = "none";
        document.getElementById("replay").style.display = "block";
        document.getElementById("You").innerHTML = "";
        document.getElementById("Computer").innerHTML = "";
    }
}

//Function:  Start Game
function start() {
    document.getElementById("replay").style.display = "none";
    countWins = 0;
    countLosses = 0;
    countTies = 0;
    turnsRemaining = 10;
    playGame();
    showRPS();
}  