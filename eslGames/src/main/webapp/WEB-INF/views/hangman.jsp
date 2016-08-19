<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!-- Hangman -->
<spring:url value="/resources/css/hangman.css" var="hangmanCSS" />
<link href="${hangmanCSS}" rel="stylesheet" />

<spring:url value="/resources/jquery/jquery-3.1.0.min.js" var="jqueryJS" />
<script src='${jqueryJS}'></script>

<spring:url value="/resources/js/hangman.js" var="hangmanJS" />
<script src='${hangmanJS}'></script>

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


