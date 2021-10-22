<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String hobby = request.getParameter("hobby");
	String specialty = request.getParameter("specialty");
	String skill = request.getParameter("skill");
%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		취미 : <%=hobby %>
		특기 : <%=specialty %>
		기술 : <%=skill %>
	</body>
</html>