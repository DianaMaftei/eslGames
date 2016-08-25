<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<script src="https://use.fontawesome.com/12382560e6.js"></script>
<spring:url value="/resources/css/header.css" var="headerCSS" />
<link href="${headerCSS}" rel="stylesheet" />
<spring:url value="/resources/css/login-reg.css" var="loginCSS" />
<link href="${loginCSS}" rel="stylesheet" />
<link rel='stylesheet prefetch'
	href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900'>
<link rel='stylesheet prefetch'
	href='http://fonts.googleapis.com/css?family=Montserrat:400,700'>
<link rel='stylesheet prefetch'
	href='https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>

<div class="header">
	<div id="logo">
		<a href="#"><img src="<c:url value="/resources/img/planet.png" />" /></a>
	</div>
	<div id="account">
		<a id="login-trigger" href="#"> Log in/Register <span>&#x25BC;</span>
		</a>
		<c:url value="/login" var="login"/>
		<c:url value="/register" var="register"/>
		<div class="form">
			<form:form method="post" action="${login}" class="login-form" modelAttribute="user">
				<form:input path="username" type="text" class="text" placeholder="username" autofocus="autofocus" required="required" />
				
				<div class="arrow-up INVALID_USERNAME_arrow"></div>
				<div class="error-flag INVALID_USERNAME"></div>
				
				<form:password path="password" class="text" placeholder="password" autofocus="autofocus" required="required" />
				
				<div class="arrow-up INCORRECT_PASSWORD_arrow"></div>
				<div class="error-flag INCORRECT_PASSWORD"></div>
				<div id="actions">
					<button>sign in</button>
					<input type="checkbox" class="options" name="rememberMe" />	Remember me
				</div>
				<p class="message">	Not registered? 
					<a href="#">Create an account</a>
				</p>
			</form:form>
			
			<form:form method="post" action="${register}" class="register-form" modelAttribute="user">
				<form:input path="fullName" type="text" class="text" placeholder="full name" autofocus="autofocus" required="required" />
				
				<div class="arrow-up INVALID_FULLNAME_arrow"></div>
				<div class="error-flag INVALID_FULLNAME"></div>
				
				<form:input path="username" type="text" class="text" placeholder="username" autofocus="autofocus" required="required" />
				
				<div class="arrow-up INVALID_USERNAME_arrow TAKEN_USERNAME_arrow"></div>
				<div class="error-flag INVALID_USERNAME TAKEN_USERNAME"></div>
				
				<form:input path="email" type="text" class="text" placeholder="email address" autofocus="autofocus" required="required" />
				
				<div class="arrow-up INVALID_EMAIL_arrow"></div>
				<div class="error-flag INVALID_EMAIL"></div>
				
				<form:password path="password" class="text" placeholder="password" autofocus="autofocus" required="required" />
				
				<div class="arrow-up INVALID_PASSWORD_arrow"></div>
				<div class="error-flag INVALID_PASSWORD"></div>
				
				<form:password path="password" class="text" placeholder="confirm password" autofocus="autofocus" required="required" />
				
				<div class="arrow-up CONFIRM_PASSWORD_arrow"></div>
				<div class="error-flag CONFIRM_PASSWORD"></div>

				<div id="actions">
					<form:radiobutton path="typeOfUser" class="options" value="teacher" required="required"/> I am a teacher 
					<form:radiobutton path="typeOfUser" class="options" value="student" required="required"/> I am a student
					<button>register</button>
				</div>
				<br>
				<p class="message">	Already registered? 
					<a href="#">Sign In</a>
				</p>
			</form:form>
		</div>
	</div>
</div>

<script	src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script>
	$(document).ready(function() {
		$('#login-trigger').click(function() {
			$(this).next('.form').slideToggle();
			$(this).toggleClass('active');

			if ($(this).hasClass('active'))
				$(this).find('span').html('&#x25B2;')
			else
				$(this).find('span').html('&#x25BC;')
		})
	});
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