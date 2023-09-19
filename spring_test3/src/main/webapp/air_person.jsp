<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<%
String db_driver = "com.mysql.cj.jdbc.Driver";
String db_url = "jdbc:mysql://umj7-009.cafe24.com/leejongh";
String db_user = "leejongh";
String db_pass = "aa134679!!";
ResultSet rs = null;
try{
	Class.forName(db_driver);
	Connection con = DriverManager.getConnection(db_url,db_user,db_pass);
	String sql = "select * from air_reserve order by aidx desc";
	PreparedStatement ps = con.prepareStatement(sql);
	rs = ps.executeQuery();
}
catch(Exception e){
	out.print("DB접속 오류 발생!!");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>비행기 예매 페이지</title>
</head>
<body>
<form id="f" method="post" action="./air_personok.do">
<input type="hidden" name="acode" value="">
<input type="hidden" name="aircorp" value="">
<p>비행기 예매<p>
<input type="text" name="mid" placeholder="아이디를 입력하세요"><br>
<input type="text" name="mname" placeholder="고객명을 입력하세요"><br>
<input type="text" name="mpost" placeholder="여권번호를 입력하세요"><br>
<input type="text" name="mtel" placeholder="고객 연락처('-' 미입력)" maxlength="11"><br>
<select onchange="data(this.value)">
<option value="">항공사를 선택하세요</option>
<%
while(rs.next()){
%>
<option value="<%=rs.getString("acode")%>|<%=rs.getString("acorp")%>|<%=rs.getString("amoney")%>"><%=rs.getString("acorp")%></option>
<%
}
%>
</select>
<br>
<input type="text" name="mperson" placeholder="인원수를 입력하세요" value="1" onkeyup="person(this.value)"><br>
<p>총 항공료</p>
<input type="text" name="totalmoney" readonly="readonly" value="0"><br>
<input type="button" value="예매완료" id="btn">
</form>
</body>
<script>
var ori_money;
function data(z){
	var a = z.split("|");
	f.acode.value = a[0];	//비행기코드
	f.aircorp.value = a[1];	//항공사
	f.totalmoney.value = a[2];	//총 금액
	ori_money = a[2];	//1인 기준 금액
	f.mperson.value = 1;	//해당 항공사 변경시 인원 초기화
}
function person(p){
	var sum = Number(p) * Number(ori_money);
	f.totalmoney.value = sum;
}
document.querySelector("#btn").addEventListener("click",function(){
	if(confirm("예약을 확정 하시겠습니까?")){	
	f.submit();
	}
});

</script>
</html>








