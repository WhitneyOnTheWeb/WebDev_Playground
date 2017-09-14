// Whitney King - Assignment 5

var userName = prompt("Hello! What is your name?", "First Name"); 
var name = userName.toUpperCase();
var count = 0;

while (count < 3) {
	document.write("Welcome, " + name + "! <br/>");
	count++;
}