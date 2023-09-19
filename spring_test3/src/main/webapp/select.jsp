<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<select id="se">
  <option data1="data0" data2="j1">java</option>
  <option data1="data1" data2="h1">html</option>
  <option data1="data2" data2="c1">css</option>
  <option data1="data3" data2="s1">spring</option>
</select>
</body>
<script>
document.querySelector("#se").addEventListener("change",function(a){
	console.log(a.target.selectedOptions[0].getAttribute("data2"));
});
</script>
</html>