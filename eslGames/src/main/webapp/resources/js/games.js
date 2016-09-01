$(document).ready(function() {

	var ctx = "${pageContext.request.contextPath}";
	$("#window").load(ctx + "/gamesMenu");

	$("#close").click(function() {
		var ctx = "${pageContext.request.contextPath}";
		$("#close").css("display", "none");
		$("#window").empty().load(ctx + "/gamesMenu");
	});

	$(document).ready(function() {
		$('#login-trigger').click(toggleLogin);
	});
});
var toggleLogin = function() {
	$(this).next('.form').slideToggle();
	$(this).toggleClass('active');
	if ($(this).hasClass('active'))
		$(this).find('span').html('&#x25B2;')
	else
		$(this).find('span').html('&#x25BC;')
}

var toggleRegister = function() {
	$('form').animate({
		height : "toggle",
		opacity : "toggle"
	}, "slow");
}

$('.message a').click(toggleRegister);

$(document).ready(function() {
	var toggleR = $('#togRegister').val();
	var toggleL = $('#togLogin').val();
	if (toggleR == "true") {
		toggleRegister();
		$('.form').css("display", "block");
	}
	if (toggleL == "true") {
		$('.form').css("display", "block");
	}
});
$(document)
		.ready(
				function() {
					var errorMessage = '${errorMessage}';
					if (errorMessage != "") {
						var result = errorMessage.split(":");
						document.getElementsByClassName(result[0])[0].innerHTML = result[1];
						document.getElementsByClassName(result[0])[0].style.display = "block";
						document.getElementsByClassName(result[0] + "_arrow")[0].style.display = "block";
					}
				});