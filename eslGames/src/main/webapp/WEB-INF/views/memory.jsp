<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- https://davidwalsh.name/css-flip -->
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!-- Memory -->
<spring:url value="/resources/css/memory.css" var="memoryCSS" />
<link href="${memoryCSS}" rel="stylesheet" />

<spring:url value="/resources/js/memory.js" var="memoryJS" />
<script src='${memoryJS}'></script>

<div id="boardContainer">
	<div id="board"></div>
</div>