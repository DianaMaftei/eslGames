<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<!-- Copyright (c) 2016 by Brad Bodine (http://codepen.io/bbodine1/pen/hflzK) 

& Diana Maftei - diana.maftei@gmail.com - https://github.com/DianaMaftei -->
<html>
<head>
<meta charset="UTF-8">
<script src="https://use.fontawesome.com/12382560e6.js"></script>
<title>ESL Games Account</title>

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
			<img src="img/YLEmonkey.png" />
		</div>
		<form action="Login" method="post" class="login-form">
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
			<input type="text" name="fullName" placeholder="full name" autofocus required/>
			<div class="arrow-up INVALID_FULLNAME_arrow"></div>
			<div class="error-flag INVALID_FULLNAME"></div>
			<input type="text" name="username" placeholder="username" autofocusrequired />
			<div class="arrow-up INVALID_USERNAME_arrow TAKEN_USERNAME_arrow"></div>
			<div class="error-flag INVALID_USERNAME TAKEN_USERNAME"></div>
			<input type="text" name="email" placeholder="email address" autofocus required/>
			<div class="arrow-up INVALID_EMAIL_arrow"></div>
			<div class="error-flag INVALID_EMAIL"></div>
			<input type="password" name="password1" placeholder="password"
				autofocus required/>
			<div class="arrow-up INVALID_PASSWORD_arrow"></div>
			<div class="error-flag INVALID_PASSWORD"></div>
			<input type="password" name="password2"
				placeholder="confirm password" autofocus required/>
			<div class="arrow-up CONFIRM_PASSWORD_arrow"></div>
			<div class="error-flag CONFIRM_PASSWORD"></div>

			<input type="radio" class="options" name="type" value="teacher" required>
			I am a teacher &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 
			<input type="radio"
				class="options" name="type" value="student" required> I am a student
			<button>create</button>
			<p class="message">
				Already registered? <a href="#">Sign In</a>
			</p>
		</form>

	</div>

	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

</body>

<style>
.form {
	position: relative;
	z-index: 1;
	background: #FFFFFF;
	max-width: 300px;
	margin: 0 auto 100px;
	padding: 30px;
	border-top-left-radius: 3px;
	border-top-right-radius: 3px;
	border-bottom-left-radius: 3px;
	border-bottom-right-radius: 3px;
	text-align: center;
}

.form .options {
	max-width: 10px;
	margin-top: 10px;
	margin-bottom: 20px;
}

.form .thumbnail {
	background: #3580C2;
	width: 160px;
	height: 160px;
	margin: 0 auto 10px;
	padding: 25px 10px;
	border-top-left-radius: 100%;
	border-top-right-radius: 100%;
	border-bottom-left-radius: 100%;
	border-bottom-right-radius: 100%;
	box-sizing: border-box;
}

.form .thumbnail img {
	display: block;
	width: 100%;
}

.form input {
	position: relative;
	outline: 0;
	background: #f2f2f2;
	width: 100%;
	border: 0;
	padding: 15px;
	clear: both;
	margin-top: 10px;
	border-top-left-radius: 3px;
	border-top-right-radius: 3px;
	border-bottom-left-radius: 3px;
	border-bottom-right-radius: 3px;
	box-sizing: border-box;
	font-size: 14px;
}

.form button {
	outline: 0;
	background: #3580C2;
	width: 100%;
	border: 0;
	padding: 15px;
	border-top-left-radius: 3px;
	border-top-right-radius: 3px;
	border-bottom-left-radius: 3px;
	border-bottom-right-radius: 3px;
	color: #FFFFFF;
	font-size: 14px;
	-webkit-transition: all 0.3 ease;
	transition: all 0.3 ease;
	cursor: pointer;
}

.form .message {
	margin: 15px 0 0;
	color: #b3b3b3;
	font-size: 12px;
}

.form .message a {
	color: #EF3B3A;
	text-decoration: none;
}

.form .register-form {
	display: none;
}

.container {
	position: relative;
	z-index: 1;
	max-width: 300px;
	margin: 0 auto;
}

.container:before, .container:after {
	content: "";
	display: block;
	clear: both;
}

.container .info {
	margin: 50px auto;
	text-align: center;
}

.container .info h1 {
	margin: 0 0 15px;
	padding: 0;
	font-size: 36px;
	font-weight: 300;
	color: #1a1a1a;
}

.container .info span {
	color: #4d4d4d;
	font-size: 12px;
}

.container .info span a {
	color: #000000;
	text-decoration: none;
}

.container .info span .fa {
	color: #3580C2;
}

.error-flag {
	max-width: 300px;
	height: auto;
	position: relative;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	font-size: 12px;
	text-align: left;
	margin-bottom: 5px;
	display: none;
	color: #fff;
	padding: 4px 10px;
	background: #c24a4a;
	opacity: 1;
}

.arrow-up {
	width: 0;
	height: 0;
	border-left: 5px solid transparent;
	border-right: 5px solid transparent;
	border-bottom: 5px solid #c24a4a;
	margin-left: 20px;
	opacity: 1;
	display: none;
}

body {
	background-image: url("img/bg_bg.png");
	background-repeat: repeat;
	font-family: "Roboto", sans-serif;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
}
</style>

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

	$(document).ready(function() {
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
