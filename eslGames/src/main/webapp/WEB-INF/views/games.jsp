<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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

</head>
<body>
	<div class="page">
		<!--header-->
		<jsp:include page="${request.contextPath}/header"></jsp:include>
		<!--body-->
		<div id="games-room">
			<div id="close">
				<a href="#">X</a>
			</div>
			<div id="window"></div>
		</div>
		<!--footer-->
		<jsp:include page="${request.contextPath}/footer"></jsp:include>
	</div>
</body>
<script>
	var ctx = "${pageContext.request.contextPath}";
	$("#window").load(ctx + "/gamesMenu");


</script>
</html>