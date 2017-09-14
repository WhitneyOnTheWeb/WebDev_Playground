// Whitney King - Project 1

//Variables
var compNumber = Math.floor((Math.random() * 10) * 4) + 1;
var userGuess;
var numberGuesses = 6;
document.getElementById("submit").disabled=false;

//Check Remaining Guesses
function guessesRemaining() {
	if((numberGuesses == 0) && (userGuess != compNumber))
	{
	    document.getElementById("reply").innerHTML = "<b>You're out of turns!</b><br />The correct number was " + compNumber + ".<br />Better luck next time!";
	    document.getElementById("background").style.backgroundImage = "url('explode.gif')";
	    document.getElementById("submit").disabled = true;
	}
}

//Compare Numbers
function comparison() {
    if (((userGuess < 1) || (userGuess > 40)) || (String(userGuess) == "NaN")) { //Invalid Entry Handling
		document.getElementById("reply").innerHTML="<b>Invalid Entry.</b><br / >You have " + numberGuesses + " guesses left.<br />Please enter an integer between 1 and 40:";
	} else if(userGuess < compNumber) { //Too Small
	    document.getElementById("reply").innerHTML = "<b>Your guess is too low.</b><br />Try again (1 - 40).<br />You have " + numberGuesses + " guesses left:";
	} else if(userGuess > compNumber) { //Too Large
	    document.getElementById("reply").innerHTML = "<b>Your guess is too high.</b><br />Try again (1 - 40).<br />You have " + numberGuesses + " guesses left:";
	} else if(userGuess === compNumber) { //Correct Guess
	    document.getElementById("reply").innerHTML = "<br /><b>Congratulations! You guessed correctly!</b><br />It only took you " + (6 - numberGuesses) + " tries!";
	    document.getElementById("background").style.backgroundImage = "url('confetti.gif')";
	    document.getElementById("submit").disabled = true;
	}
}

//Game Logic
function guess() {
	numberGuesses = numberGuesses-=1;
	userGuess = parseInt(document.getElementById("input").value);
	
	comparison();
	guessesRemaining();
}