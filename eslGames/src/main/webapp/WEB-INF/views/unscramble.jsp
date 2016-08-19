<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!-- Unscramble -->
<spring:url value="/resources/bootstrap/css/bootstrap.min.css"
	var="bootstrapCSS" />
<link href="${bootstrapCSS}" rel="stylesheet" />

<spring:url value="/resources/jquery/jquery-3.1.0.min.js" var="jqueryJS" />
<script src='${jqueryJS}'></script>

<spring:url value="/resources/jquery/jquery-ui.min.css"
	var="jquery_uiCSS" />
<link href="${jquery_uiCSS}" rel="stylesheet" />

<spring:url value="/resources/jquery/jquery-ui.min.js" var="jquery_uiJS" />
<script src='${jquery_uiJS}'></script>

<spring:url value="/resources/css/unscramble.css" var="unscrambleCSS" />
<link href="${unscrambleCSS}" rel="stylesheet" />

<spring:url value="/resources/js/unscramble.js" var="unscrambleJS" />
<script src='${unscrambleJS}'></script>

<div class="scrambler">
	<div id="drag-wrapper">
	</div>
	<br> <br> <br><br> <br>
	<button type="button" class="btn btn-success" id="submitBTN">
		<span class="glyphicon glyphicon-ok" aria-hidden="true"></span> Submit
	</button>
	<button type="button" class="btn btn-info" id="resetBTN">
		<span class="glyphicon glyphicon-repeat" aria-hidden="true"></span>
		Reset
	</button>
</div>
