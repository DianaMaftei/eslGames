<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Hangman Game</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<spring:url value="/resources/css/hangman.css" var="hangmanCSS" />
<link href="${hangmanCSS}" rel="stylesheet" />

</head>
<body>
	<div class='topmatter'>
		<div class='hang-container'>
			<div class='scaffolding-top'></div>
			<div class='scaffolding-left'></div>

			<div class='draw-area'>
				<div class='rope'></div>
			</div>

			<div class='scaffolding-base'></div>
		</div>
		<div class='side-container'>
			<div class='container-title'>Guess A Letter!</div>
			<div class='input-area'>
				<input id='letter-input' type='text' maxlength='1' />
			</div>
		</div>

		<div class='side-container'>
			<div class='container-title'>Guessed Letters</div>
			<div id="wrong-letters" class='input-area'></div>
		</div>
	</div>
	<div class='bottommatter'>
		<div class='word-box'>
			<div class='word-display'></div>
		</div>
	</div>
</body>
<spring:url value="/resources/js/hangman.js" var="hangmanJS" />
<script src='${hangmanJS}'></script>
</html>