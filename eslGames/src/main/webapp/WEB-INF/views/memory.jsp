<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- https://davidwalsh.name/css-flip -->
<title>Memory Game</title>

<!--<script src="js/prefixfree.min.js" type="application/javascript"></script>-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<spring:url value="/resources/sound/240776__f4ngy__card-flip.wav" var="flipSound" />
<script>
	var words = [ "CAR", "CAT", "TABLE", "JUMP", "JUMP", "RUN", "DOG",
			"TEDDY-BEAR", "RUN", "DOLL", "TEDDY-BEAR", "TABLE", "CAR", "DOLL",
			"DOG", "CAT" ];
	
	var soundHTML = '<embed src=\"${flipSound}\" hidden=\"true\" autostart=\"true\" loop=\"false\" />';
	var previousTile;
	var currentTile;
	var faceUp = 0;
	
	$(document).ready(function createBoard(){
		var index = 0;
		for (var i = 0; i < 4; i++) {
			var board;
			var html;
			for (var j = 0; j < 4; j++) {
				board = document.getElementById("board");
				board.innerHTML += '<div class="flip-container" ontouchstart="this.classList.toggle(\'hover\');"><div class="flipper" id="flipper"><div class="front"></div><div class="back">'
						+ words[index] + '</div></div></div>';
				index++;
			};
			board.innerHTML += "</br>";
		};
	});

	$(document).ready(function() {
		$(".front").click(function() {
				if (faceUp == 0) {
					previousTile = this;
					this.innerHTML = soundHTML;
					$(this).parent().parent().toggleClass("selected");
					faceUp++;
				} else if (faceUp < 2){
					currentTile = this;
					currentTile.innerHTML = soundHTML;
					$(currentTile).parent().parent().toggleClass("selected");
					faceUp++;
					if(faceUp == 2){
						if ($(previousTile).next(".back").text() != $(currentTile).next(".back").text()) {
							setTimeout(revert, 1500);
							function revert() {
								previousTile.innerHTML = soundHTML;
								$(previousTile).parent().parent().toggleClass("selected");
								$(currentTile).parent().parent().toggleClass("selected");
								previousTile = null;
								faceUp = 0;
								}
						} else {
								previousTile = null;
								faceUp = 0;
						}
					}
				}
		});
	});
</script>

<spring:url value="/resources/css/memory.css" var="memoryCSS" />
<link href="${memoryCSS}" rel="stylesheet" />
</head>
<body>
	<div id="board"></div>

</body>
</html>