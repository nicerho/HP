<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<title>모바일 웹페이지</title>
</head>
<body>
	<header>
		<%@ include file="./top.jsp"%>
	</header>
	<!-- 메뉴 또는 로그인 기능 -->
	<main>
		<section>
			<!-- 오만잡동사니-->
			<%@ include file="./reserve.jsp"%>
		</section>
	</main>
	<footer>
		<!-- copyright-->
		<%@ include file="./copyright.jsp"%>
	</footer>
</body>
</html>