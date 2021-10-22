<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//ex06_param_result.jsp>myName=홍길동&age=22&tel=010-111-2222
	
	//param_input.jsp에서 전달한 세 개의 파라미터 수신
	
	String name = request.getParameter("myName");
	String tel = request.getParameter("tel");
	int age = Integer.parseInt(request.getParameter("age"));
%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		이름 : <%=name %><br>
		나이 : <%=age %><br>
		전화번호 : <%=tel %><br>
	</body>
</html>