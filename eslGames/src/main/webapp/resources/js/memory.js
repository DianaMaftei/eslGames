var words = [ "CAR", "CAT", "TABLE", "JUMP", "JUMP", "RUN", "DOG",
			"TEDDY-BEAR", "RUN", "DOLL", "TEDDY-BEAR", "TABLE", "CAR", "DOLL",
			"DOG", "CAT" ];

	var soundHTML = '<embed src=\"sound/240776__f4ngy__card-flip.wav\" hidden=\"true\" autostart=\"true\" loop=\"false\" />';
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
										+ words[index] + '</div></div></div>';
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
												this.innerHTML = soundHTML;
												$(this)
														.parent()
														.parent()
														.toggleClass("selected");
												faceUp++;
											} else if (faceUp < 2) {
												currentTile = this;
												currentTile.innerHTML = soundHTML;
												$(currentTile).parent()
														.parent().toggleClass(
																"selected");
												faceUp++;
												if (faceUp == 2) {
													if ($(previousTile).next(
															".back").text() != $(
															currentTile).next(
															".back").text()) {
														setTimeout(revert, 1500);
														function revert() {
															previousTile.innerHTML = soundHTML;
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