<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
	
<spring:url value="/resources/css/gamesMenu.css" var="gamesMenuCSS" />
<link href="${gamesMenuCSS}" rel="stylesheet" />

<div id="choose-game">
	<button id="game1" class="gameBTN">unscramble</button>
	<button id="game2" class="gameBTN">memory</button>
	<button id="game3" class="gameBTN">hangman</button>
</div>

<script>
$(".gameBTN").click(function() {
	var gameID = this.id;
	var ctx = "${pageContext.request.contextPath}";
	$("#window").empty().load(ctx + "/" + gameID);
});
</script>