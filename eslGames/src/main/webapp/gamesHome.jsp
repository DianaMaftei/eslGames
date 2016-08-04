<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Games Page</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<%
		Cookie[] cookies = request.getCookies();
		for (Cookie c : cookies) {
			if ("loggedIn".equals(c.getName())) {
				 out.println(c.getValue());
			}
		}
	%>
	
</body>
</html>