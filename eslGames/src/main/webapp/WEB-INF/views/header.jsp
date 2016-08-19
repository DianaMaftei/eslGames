<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<spring:url value="/resources/css/header.css" var="headerCSS" />
<link href="${headerCSS}" rel="stylesheet" />
<div class="header">
	<div id="logo">eslGames</div>
	<div id="account">
		<button id="registerBTN" class="login">Sign Up</button>
		<button id="loginBTN" class="login">Login</button>
	</div>
</div>
