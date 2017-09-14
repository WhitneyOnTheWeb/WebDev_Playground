// Whitney King - Extra Credit 5

var answer = [
		"I see fog... ask again later.", 
		"That's looking like that's a definite possibility!", 
		"Don't be ridiculous! Of course not!", 
		"Absolutely, 100% yes!", 
		"It's hard to tell right now, but it's looking good."
		];	

function answerQuestion(){
	var random = Math.floor(Math.random() * 5);
	document.getElementById("answer").innerHTML=answer[random];
	}