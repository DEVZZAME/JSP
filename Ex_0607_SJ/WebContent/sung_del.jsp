<%@page import="dao.SJDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//sung_del.jsp?no=1
	int no = Integer.parseInt(request.getParameter("no"));

	int res = SJDAO.getInstance().delete(no);
	
	response.sendRedirect("SJ_list.jsp");
%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
	
	</body>
</html>