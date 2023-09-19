<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int ea = (int)request.getAttribute("listea");
ArrayList<ArrayList<String>> plist = (ArrayList<ArrayList<String>>)request.getAttribute("plist");
//숫자를 자동으로 천단위당 콤마 적용하는 class
DecimalFormat df = new DecimalFormat("###,###");
%>
<!--  View -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품출력 리스트</title>
</head>
<body>
<p>등록된 상품갯수 : <%=ea%> 개
<table border="1" width="1000" align="center">
<thead>
	<tr align="center">
	<th width="5%">번호</th>
	<th width="15%">상품코드</th>
	<th width="40%">상품명</th>
	<th width="20%">상품가격</th>
	<th width="20%">수정/삭제</th>
	</tr>
</thead>
<tbody>
<%
	int w = 0;
	do{
%>
	<tr align="center">
	<td><%=ea-w%></td>
	<td><%=plist.get(w).get(1)%></td>
	<td align="left"><%=plist.get(w).get(2)%></td>
	<td><%=df.format(Integer.parseInt(plist.get(w).get(3)))%> 원</td>
	<td>
	<input type="button" value="수정" onclick="modify_pd('<%=plist.get(w).get(0)%>')">
	<input type="button" value="삭제" onclick="delete_pd('<%=plist.get(w).get(0)%>')">
	</td>
	</tr>
<%
	w++;
	}while(w < plist.size());
%>
</tbody>
</table>
</body>
<script>
	function modify_pd(idx){
		location.href="./product_modify.do?idx="+idx;		
	}

	
	
	function delete_pd(idx){
		if(confirm("해당 데이터를 삭제 하시겠습니까? 절대 복구 안됩니다.")){
		location.href='./product_delete.do?idx='+idx;
		}
	}
</script>

</html>