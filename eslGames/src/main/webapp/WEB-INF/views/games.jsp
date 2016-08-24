<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags/form"
	prefix="spring-form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Games Page</title>
<!-- Main Game Page-->

<spring:url value="/resources/css/games.css" var="gamesCSS" />
<link href="${gamesCSS}" rel="stylesheet" />
<spring:url value="/resources/jquery/jquery-3.1.0.min.js" var="jqueryJS" />
<script src='${jqueryJS}'></script>

<script>
	var ctx = "${pageContext.request.contextPath}"
</script>
<script>
	$(function() {
		$(".gameBTN").click(function() {
			var gameID = this.id;
			$("#games-room").load(ctx + "/" + gameID);
		});
	});
</script>
</head>
<body>
	<div class="page">
		<!--header-->
		<jsp:include page="${request.contextPath}/header"></jsp:include>
		<!--body-->
		<div id="choose-game">
			<button id="game1" class="gameBTN">unscramble</button>
			<button id="game2" class="gameBTN">memory</button>
			<button id="game3" class="gameBTN">hangman</button>
		</div>

		<div id="games-room"></div>
		<!--footer-->
	</div>

</body>
</html>