<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!-- Unscramble -->


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
	<div id="drag-wrapper"></div>
	<div id="buttonsWrap">
		<button type="button" class="btn btn-success" id="submitBTN">
			<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
			Submit
		</button>
	</div>
	<div id="pointsWrap">
	<div id="point1" class="points"></div>
	<div id="point2" class="points"></div>
	<div id="point3" class="points"></div>
	<div id="point4" class="points"></div>
	<div id="point5" class="points"></div>
	</div>
	<input type="hidden" id="words" value='${words}'/>
</div>
