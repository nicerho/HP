<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과값 출력 View 파트</title>
</head>
<body>
	<!-- request.getAtrribute : Controller 에서 가상 객체명을 받아서 출력하는 메서드 -->
	결과값 :
	<%=request.getAttribute("total")%>
	<br> 고객명 :
	<%=request.getAttribute("name")%>
	<br>
	<br>
	<br>
	<div id="box"></div>
</body>
<script>
//Controller 데이터값을 js 변수로 받은 후 HTML에 직접 출력
var total = "<%=request.getAttribute("total")%>";
	document.getElementById("box").innerHTML = "최종데이터 : " + total;
</script>
</html>