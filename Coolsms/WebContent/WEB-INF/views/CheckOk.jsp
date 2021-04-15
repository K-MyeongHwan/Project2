<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String random = (String)request.getAttribute("random");
	Integer.parseInt(random);
%>
<!DOCTYPE html>
<html>
<head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	인증번호 : <input id="num"type="text" placeholder="인증번호"><button id="btn">인증</button>
	<div id="timer"></div><br>
	
</body>
<script>
	var time = 180;
	var min = "";
	var sec = "";
	
	var x = setInterval(function(){
		min = parseInt(time/60);
		sec = time%60;
		
		document.getElementById("timer").innerHTML = min + "분" + sec + "초";
		time--;
		
		if(time < 0) {
			cloearInterval(x);
			document.getElementById("timer").innerHTML = "<a href='Check.do'>재요청</a>";
			
		}
	}, 1000);
	
	$("#btn").click(function(){
		let num = $("#num").val();
		if(num == <%= random %>) {
			alert("인증완료");
			location.href="success.jsp";
		} else {
			alert("인증실패");
			$("#num").val("");
		}
	});
</script>
</html>