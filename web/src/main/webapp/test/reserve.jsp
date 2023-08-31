<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<form name="f" method="post" action="./reserveok.do">
	<script>
		function ck() {
			if (f.pname.value == "") {
				alert("로그인 후 예약 가능")
			} else if (f.pid.value == "") {
				alert("로그인 후 예약 가능")
			} else {
				f.submit();
			}
		}
	</script>
	<div>
		<p>예약시스템
		<p>
			고객명 : <input type="text" name="pname" value="<%=user_nm%>" readonly="readonly"><br>
			고객 ID : <input type="text" name="pid" value="<%=user_id%>" readonly="readonly"><br>
			ROOM 선택 :<br> <label> <input type="radio" name="room"
				value="패밀리룸">패밀리룸
			</label> <label> <input type="radio" name="room" value="키즈룸">키즈룸
			</label> <label> <input type="radio" name="room" value="러블리룸">러블리룸
			</label> <br> 인원 : <select name="person">
				<option value="1">1명</option>
				<option value="2">2명</option>
				<option value="3">3명</option>
			</select> <br> 예약일자 : <input type="datetime-local" name="reserve">
			<br> <br> <input type=button value="예약하기" onclick="ck()">
	</div>
</form>
<script>
var mid = "<%=user_id%>"
var mnm = "<%=user_nm%>"
if(mid!="null"&&mnm!="null"){
	f.pname.value = mnm;
	f.pid.value = mid;
} else{
	
}
</script>