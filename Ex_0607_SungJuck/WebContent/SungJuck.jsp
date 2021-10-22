<%@page import="vo.SJVO"%>
<%@page import="dao.SJDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<SJVO> list = SJDAO.getInstance().selectList();
%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		<table border="1">
			<caption>:::학생정보:::</caption>
			<tr>
				<th>이름</th>
				<th>국어</th>
				<th>영어</th>
				<th>수학</th>
				<th>총점</th>
			</tr>
			
			<%for(int i = 0; i < list.size(); i++){
				SJVO vo = list.get(i);
			%>
			<tr>
				<td><%= %></td>
			</tr>
			<%} %>
			}
		</table>
	</body>
</html>