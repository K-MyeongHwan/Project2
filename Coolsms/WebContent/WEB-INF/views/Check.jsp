<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int random = (int)(Math.random()* (999999 - 100000 + 1)) + 100000;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="CheckOk.do" method="get">
		전화번호를 입력하세요 : <input type="text" placeholder="휴대전화" name="phoneNm">
		<input id="random"type="hidden" value="<%= random%>" name="random">
		<input type="submit" value="전송">
	</form>
</body>
<script>
	console.log(document.getElementById("random").value);
</script>
</html>