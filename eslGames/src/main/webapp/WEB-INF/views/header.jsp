<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<script src="https://use.fontawesome.com/12382560e6.js"></script>
<spring:url value="/resources/css/header.css" var="headerCSS" />
<link href="${headerCSS}" rel="stylesheet" />
<spring:url value="/resources/css/login-reg.css" var="loginCSS" />
<link href="${loginCSS}" rel="stylesheet" />
<link rel='stylesheet prefetch'
	href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900'>
<link rel='stylesheet prefetch'
	href='http://fonts.googleapis.com/css?family=Montserrat:400,700'>
<link rel='stylesheet prefetch'
	href='https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>



<script	src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script>
	$(document).ready(function() {
		$('#login-trigger').click(toggleLogin);
	});

	var toggleLogin = function() {
		$(this).next('.form').slideToggle();
		$(this).toggleClass('active');
		if ($(this).hasClass('active'))
			$(this).find('span').html('&#x25B2;')
		else
			$(this).find('span').html('&#x25BC;')
	}
	
	var toggleRegister = function() {
		$('form').animate({
			height : "toggle",
			opacity : "toggle"
		}, "slow");
	}
	
	$('.message a').click(toggleRegister);
	
	$(document).ready(function() {
		var toggleR = $('#togRegister').val();
		var toggleL = $('#togLogin').val();
		console.log(toggleR);
		console.log(toggleL);
		if (toggleR == "true") {
			toggleRegister();
		}
		if(toggleL == "true"){
			toggleLogin();
		}
	});
	$(document)
			.ready(
					function() {
						var errorMessage = '${errorMessage}';
						if (errorMessage != "") {
							var result = errorMessage.split(":");
							document.getElementsByClassName(result[0])[0].innerHTML = result[1];
							document.getElementsByClassName(result[0])[0].style.display = "block";
							document.getElementsByClassName(result[0]+ "_arrow")[0].style.display = "block";
						}
					});
</script>