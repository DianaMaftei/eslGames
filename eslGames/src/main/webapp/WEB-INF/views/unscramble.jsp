<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<spring:url value="/resources/css/unscramble.css" var="unscrambleCSS" />
<link href="${unscrambleCSS}" rel="stylesheet" />


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>

<script type="text/javascript">
var initWord = "LWLYOE";
var solution = "YELLOW";
$(function () {
    $("#drag_wrapper").sortable({
        connectWith: "#drag_wrapper",
        containment: "#drag_wrapper"
    }).disableSelection();
});

$(document).ready(function(){
	for (var i = 0; i < initWord.length; i++) {
		   var container = document.getElementById("drag_wrapper");
		   var html = 
		   container.innerHTML += '<div class="letter">' + initWord.charAt(i) +'</div>';
		}
	
});

$(document).ready(function(){
	$("button").click(function(){
		var word = "";
		$(".letter").each(function(){
			var letter = $(this).text();
			word += letter;
		});
		if(word == solution){
			console.log("SUCCESS");
		}
	});
});

</script>

<title>Unscramble</title>


</head>
<body>
	<div class="scrambler">
		<div id="drag_wrapper"></div>
		</br>
		</br>
		</br>
		<button type="button" class="btn btn-success" id="submitBTN">
			<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
			 Submit
		</button>
		<button type="button" class="btn btn-info" id="resetBTN">
			<span class="glyphicon glyphicon-repeat" aria-hidden="true"></span>
			 Reset
		</button>
	</div>
	

</body>
</html>