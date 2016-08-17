<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<!-- Copyright (c) 2016 by Brad Bodine (http://codepen.io/bbodine1/pen/hflzK) 

& Diana Maftei - diana.maftei@gmail.com - https://github.com/DianaMaftei -->
<html>
<head>
<meta charset="UTF-8">
<script src="https://use.fontawesome.com/12382560e6.js"></script>
<title>ESL Games Account</title>
 
<!-- let's add tag srping:url -->
<spring:url value="/resources/css/login-reg.css" var="loginCSS" />
<link href="${loginCSS}" rel="stylesheet" />

<link rel='stylesheet prefetch'
	href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900'>
<link rel='stylesheet prefetch'
	href='http://fonts.googleapis.com/css?family=Montserrat:400,700'>
<link rel='stylesheet prefetch'
	href='https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>

</head>

<body>
	<div class="form">
		<div class="thumbnail">
		<img src="<c:url value="/resources/img/YLEmonkey.png" />" />

		</div>
		<form action="log" method="post" class="login-form">
			<br /> <input type="text" name="username" placeholder="username"
				autofocus required />
			<div class="arrow-up INVALID_USERNAME_arrow"></div>
			<div class="error-flag INVALID_USERNAME"></div>
			<input type="password" name="password" placeholder="password"
				autofocus required />
			<div class="arrow-up INCORRECT_PASSWORD_arrow"></div>
			<div class="error-flag INCORRECT_PASSWORD"></div>
			<input type="checkbox" class="options" name="rememberMe" /> Remember
			me
			<button>login</button>
			<p class="message">
				Not registered? <a href="#">Create an account</a>
			</p>
		</form>
		<form action="Register" method="post" class="register-form">
			<input type="text" name="fullName" placeholder="full name" autofocus
				required />
			<div class="arrow-up INVALID_FULLNAME_arrow"></div>
			<div class="error-flag INVALID_FULLNAME"></div>
			<input type="text" name="username" placeholder="username" autofocus
				required />
			<div class="arrow-up INVALID_USERNAME_arrow TAKEN_USERNAME_arrow"></div>
			<div class="error-flag INVALID_USERNAME TAKEN_USERNAME"></div>
			<input type="text" name="email" placeholder="email address" autofocus
				required />
			<div class="arrow-up INVALID_EMAIL_arrow"></div>
			<div class="error-flag INVALID_EMAIL"></div>
			<input type="password" name="password1" placeholder="password"
				autofocus required />
			<div class="arrow-up INVALID_PASSWORD_arrow"></div>
			<div class="error-flag INVALID_PASSWORD"></div>
			<input type="password" name="password2"
				placeholder="confirm password" autofocus required />
			<div class="arrow-up CONFIRM_PASSWORD_arrow"></div>
			<div class="error-flag CONFIRM_PASSWORD"></div>

			<input type="radio" class="options" name="type" value="teacher"
				required> I am a teacher
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
				class="options" name="type" value="student" required> I am a
			student
			<button>create</button>
			<p class="message">
				Already registered? <a href="#">Sign In</a>
			</p>
		</form>

	</div>

	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

</body>
<script>
	var toggleRegister = function() {
		$('form').animate({
			height : "toggle",
			opacity : "toggle"
		}, "slow");
	}

	$('.message a').click(toggleRegister);

	$(document).ready(function() {
		var toggle = '${toggleRegister}';
		console.log(toggle);
		if (toggle == "true") {
			toggleRegister();
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
							document.getElementsByClassName(result[0]
									+ "_arrow")[0].style.display = "block";
						}

					});
</script>
</html>
