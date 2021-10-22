<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//gugu_ajax.jsp?dan=5
	int dan = Integer.parseInt( request.getParameter("dan") );

	//입력받은 파라미터 값을 가지고 구구단을 작성
	String gugu = "";
	
	for(int i = 1; i <= 9; i++ ){
		gugu += dan + " * " + i + " = " + (dan * i) + "<br>";
		
	}
	
%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%=gugu %>
	</body>
</html>