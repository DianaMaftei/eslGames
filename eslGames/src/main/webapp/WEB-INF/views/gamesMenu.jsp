<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<spring:url value="/resources/css/gamesMenu.css" var="gamesMenuCSS" />
<link href="${gamesMenuCSS}" rel="stylesheet" />
<spring:url value="/resources/jquery/jquery.dropdown.js"
	var="dropdownJS" />
<script src='${dropdownJS}'></script>
<spring:url value="/resources/jquery/modernizr.custom.63321.js"
	var="modernizerJS" />
<script src='${modernizerJS}'></script>
<spring:url value="/resources/css/dropdown.css" var="dropdownCSS" />
<link href="${dropdownCSS}" rel="stylesheet" />

<div class="fleft">
	<select id="level" class="cd-dropdown cd-select">
		<option value="empty" id="main1" selected>Level</option>
		<option value="STARTERS">Starters</option>
		<option value="MOVERS">Movers</option>
		<option value="FLYERS">Flyers</option>
	</select>
</div>
<div class="fright">
	<select id="theme" class="cd-dropdown cd-select">
		<option value="empty" id="main2" selected>Theme</option>
		<option value="ANIMALS">Animals</option>
		<option value="COLOR">Colors</option>
		<option value="BODY">Body</option>
	</select>
</div>
<div id="choose-game">
	<button id="game1" class="gameBTN">unscramble</button>
	<button id="game2" class="gameBTN">memory</button>
	<button id="game3" class="gameBTN">hangman</button>
</div>
<script>
	var gLevel = "empty";
	var gTheme = "empty";
	
	$(function() {
		$('#theme').dropdown({
			gutter : 0,
			delay : 100,
			random : true,
			onOptionSelect : function(opt) {
				gTheme = opt.attr("data-value");
			}
		});
	});

	$(function() {
		$('#level').dropdown({
			gutter : 0,
			delay : 100,
			random : true,
			onOptionSelect : function(opt) {
				gLevel = opt.attr("data-value");
			}
			
		});
	});

	$(".gameBTN").click(function() {
		var gameID = this.id;
		var ctx = "${pageContext.request.contextPath}";
		$("#close").css("display", "block");
		$("#games").empty().load(ctx + "/" + gameID + "?level=" + gLevel + "&theme=" + gTheme);
	});

</script>