<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<title>모바일 로그인</title>
<script>
function login(){
	
}
</script>
</head>
<body>
	<header>
		<%@ include file="./top.jsp"%>
	</header>
	<!-- 메뉴 또는 로그인 기능 -->
	<main>
		<form name="f" method="post" action="./loginok.do">
			<section>
				<!-- 오만잡동사니-->
				<p>MEMBER-LOGIN
				<p>
					ID : <input type="text" name="mid" required="required"><br>
					PW : <input type="password" name="mpw" required="required"><br>
					<button type="submit">로구인</button>
			</section>
		</form>
	</main>
	<footer>
		<!-- copyright-->
		<%@ include file="./copyright.jsp"%>
	</footer>
</body>
<script>
var id = "<%=user_id%>";
var nm = "<%=user_nm%>";
//console.log(id);
	if (id != "" && nm != "") {
		location.href = './index.jsp'
	}
</script>
</html>