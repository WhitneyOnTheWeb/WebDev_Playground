// Whitney King - Extra Credit 3
// Ask user to input their age.
// Based on age, evaluate if user is old enough to retire (65), drive (16), or vote (18).
// User may fall into more than one category.
// Return with a statement telling the user what they are eligible for.

//Age Thresholds
var retirementAge = 65;
var driverAge = 16;
var voterAge = 18;

//User Input Prompts
var userName = prompt("What's your name?", "First Name");
var userAge = prompt("Hello, " + userName + "! \nHow old are you?", "Age");

//Boolean Declaration
var retirement = userAge >= retirementAge ? true : false;
var driver = userAge >= driverAge ? true : false;
var voter = userAge >= voterAge ? true : false;

//Logic and Results
var results = "Pending";

if ((retirement === true) && (driver === true)) {
 	results = (userName + ", you are old enough to retire, drive and vote! You've made it!");
} else if ((retirement === false) && (voter === true)) {
	results = (userName + ", you are old enough to drive and vote, but you are not old enough to retire! \nKeep plugging away at adulthood!");
} else if ((driver === true) && (voter === false)) {
 	results = (userName + ", you're old enough to drive, but you're not old enough to vote or retire! \nEnjoy your youth while you have it!");
} else {
	results = (userName + ", you aren't old enough to drive, vote or retire yet! \nIt's alright, kid! You've got a lot of life ahead of you!");
}
