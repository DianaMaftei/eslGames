<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>ESL World</title>
<!-- Behavioral Meta Data -->
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<spring:url value="/resources/css/reset.css" var="resetCSS" />
<link href="${resetCSS}" rel="stylesheet" />

<spring:url value="/resources/css/bg_style.css" var="homeCSS" />
<link href="${homeCSS}" rel="stylesheet" />

<spring:url value="/resources/jquery/jquery-3.1.0.min.js" var="jqueryJS" />
<script src='${jqueryJS}'></script>

<spring:url value="/resources/js/parallax.min.js" var="parallaxJS" />
<script src='${parallaxJS}'></script>

</head>
<body>
	<div id="container" class="wrapper">
		<ul id="scene">
			<li class="layer" data-depth="0.00"><div id="background"></div></li>

			<li class="layer" data-depth="0.00"><img id="sun" src="<c:url value="/resources/img/parallax/sun.png" />" /></li>			
			<li class="layer" data-depth="0.05"><img id="bclouds" src="<c:url value="/resources/img/parallax/back_clouds.png" />" /></li>
			<li class="layer" data-depth="0.00"><img id="logo" src="<c:url value="/resources/img/parallax/logo.png" />" /></li>			
			<li class="layer" data-depth="0.07"><img id="bhill" src="<c:url value="/resources/img/parallax/back_hill.png" />" /></li> 
			<li class="layer" data-depth="0.20"><img id="mclouds" src="<c:url value="/resources/img/parallax/mid_clouds.png" />" /></li> 
			<li class="layer" data-depth="0.18"><img id="mhill"	src="<c:url value="/resources/img/parallax/middle_hill.png" />" /></li> 
			<li class="layer" data-depth="0.18"><img id="house"	src="<c:url value="/resources/img/parallax/house.png" />" /></li> 
			<li class="layer" data-depth="0.20"><img id="fhill"	src="<c:url value="/resources/img/parallax/front_hill.png" />" /></li> 
			<li class="layer" data-depth="0.23"><img id="bgrass" src="<c:url value="/resources/img/parallax/back_grass.png" />" /></li> 
			<li class="layer" data-depth="0.35"><img id="fgrass" src="<c:url value="/resources/img/parallax/front_grass.png" />" /></li> 
			<li class="layer" data-depth="0.50"><img id="daff" src="<c:url value="/resources/img/parallax/daffodils.png" />" /></li> 
			<li class="layer" data-depth="0.18"><a id="enter" href="<c:url value="/games" />"><div></div></a></li>
		</ul>
	</div>


	<script>
		// Nothing new here...it's all in the CSS!
		var scene = document.getElementById('scene');
		var parallax = new Parallax(scene);

		$(function() {
			$('#enter').hover(function() {
				$('#house').toggleClass("grow");
			}, function() {
				// on mouseout, reset the background colour
				$('#house').toggleClass("grow");
			});
		});
	</script>

</body>
</html>