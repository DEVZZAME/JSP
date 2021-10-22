<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	HashMap<String, String> map = new HashMap<String, String>();
	map.put("name", "홍길동");
	map.put("age", "21");
	map.put("addr", "서울 강남");
	map.put("school", "서울대");
	
	request.setAttribute("my_map", map);
%>    
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		<%=map.get("name") %><br>
		이름 : ${ requestScope.my_map.get("name") }<br>
		나이 : ${ my_map.get("age") }<br>
		주소 : ${ my_map['addr']}<br>
		학교 : ${ my_map.school }<br>
	</body>
</html>