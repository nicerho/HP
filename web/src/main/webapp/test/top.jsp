<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<% String user_id = ""; String user_nm = ""; 
try { user_id =session.getAttribute("perid").toString(); 
user_nm =session.getAttribute("pernm").toString(); } 
catch (Exception e) { } %>
<script>
	function gopage() {
		location.href = './login.jsp';
	}
</script>
<div>
	<%
	if (user_id == "" || user_id == null) {
	%>
	<span onclick="gopage()">로그인</span>
	<%
	} else {
	%>
	<span><%=user_nm%>님 환영합니다</span> <a href="./mlogout.jsp">[로구아웃]</a>
	<%
	}
	%>
</div>