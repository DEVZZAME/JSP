<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String[] array = {"사과", "배", "참외", "오렌지", "바나나"};
%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
	<ul>
		<%for(int i = 0; i < array.length; i++){ %>
			<li><%=array[i] %></li>
		<%} %>
	</ul>	
	</body>
</html>