	 var wordsJSON = $('#words').val();
	 var words = $.parseJSON(wordsJSON);
	 
	var previousTile;
	var currentTile;
	var faceUp = 0;

	$(document)
			.ready(
					function createBoard() {
						var index = 0;
						for (var i = 0; i < 4; i++) {
							var board;
							var html;
							for (var j = 0; j < 4; j++) {
								board = document.getElementById("board");
								board.innerHTML += '<div class="flip-container" ontouchstart="this.classList.toggle(\'hover\');"><div class="flipper" id="flipper"><div class="front"></div><div class="back">'
										+ '<span>' + words[index] + '</span>' + '</div></div></div>';
								index++;
							}
							;
							board.innerHTML += "</br>";
						}
						;
					});

	$(document)
			.ready(
					function() {
						$(".front")
								.click(
										function() {
											if (faceUp == 0) {
												previousTile = this;
												$(this)
														.parent()
														.parent()
														.toggleClass("selected");
												faceUp++;
											} else if (faceUp < 2) {
												currentTile = this;
												$(currentTile).parent()
														.parent().toggleClass(
																"selected");
												faceUp++;
												if (faceUp == 2) {
													if ($(previousTile).next(
															".back").text() != $(
															currentTile).next(
															".back").text()) {
														setTimeout(revert, 700);
														function revert() {
															$(previousTile)
																	.parent()
																	.parent()
																	.toggleClass(
																			"selected");
															$(currentTile)
																	.parent()
																	.parent()
																	.toggleClass(
																			"selected");
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