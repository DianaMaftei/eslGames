	var initWord;
	var solution;
	
	var wordList = [];
	var solutionList = [];
	
	var point = 1;
	var counter = 0;

	 var words = $('#words').val();
	 var wordsJSON = $.parseJSON(words);
	 
	 for(var key in wordsJSON){
		 solutionList.push(key);
		 wordList.push(wordsJSON[key]);
	 }
	
	$(function() {
		$("#drag-wrapper").sortable({
			connectWith : "#drag-wrapper",
			containment : "#drag-wrapper"
		}).disableSelection();
	});


	window.insertWord = function (){
		initWord = wordList[counter];
		solution = solutionList[counter];
		counter++;
		for (var i = 0; i < initWord.length; i++) {
			var wordContainer = document.getElementById("drag-wrapper");
			var html = wordContainer.innerHTML += '<div class="letter">' + initWord.charAt(i) + '</div>';
		}
	}

	insertWord();

	$(document).ready(function() {
		$("#submitBTN").click(function() {
			var word = "";
			$(".letter").each(function() {
				var letter = $(this).text();
				word += letter;
			});
			if(point === 5){
				document.getElementById("drag-wrapper").innerHTML = "";
				counter= 0;
				wordList = ["Game Over", "Game Over"];
				insertWord();
				$("#submitBTN").prop("disabled",true);
			}
			if (word == solution) {
				$("#point" + point).css("background-color", "green");
				point++;
				document.getElementById("drag-wrapper").innerHTML = "";
				insertWord();
			}else{
				$("#point" + point).css("background-color", "red");
				point++;
				document.getElementById("drag-wrapper").innerHTML = "";
				insertWord();
			}

		});
	});