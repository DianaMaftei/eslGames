	var initWord = "LWLYOE";
	var solution = "YELLOW";
	$(function() {
		$("#drag-wrapper").sortable({
			connectWith : "#drag-wrapper",
			containment : "#drag-wrapper"
		}).disableSelection();
	});

	$(document).ready(
			function() {
				for (var i = 0; i < initWord.length; i++) {
					var wordContainer = document.getElementById("drag-wrapper");
					var html = wordContainer.innerHTML += '<div class="letter">' + initWord.charAt(i) + '</div>';
				}

			});

	$(document).ready(function() {
		$("button").click(function() {
			var word = "";
			$(".letter").each(function() {
				var letter = $(this).text();
				word += letter;
			});
			if (word == solution) {
				console.log("SUCCESS");
			}
		});
	});