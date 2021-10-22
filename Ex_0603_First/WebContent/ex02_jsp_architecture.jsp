<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%!
	//스크립트릿의 선언부 : 변수나 메서드를 정의하는 전역변수 개념
	int n = 0;

	Random rnd = new Random();
	
	public int plus(int a, int b){
		return a + b;		
	}
%>    

<%
	//지역변수 개념
	int random = rnd.nextInt(10) + 1;
	System.out.println(random);
	
	int n2 = 0;
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		<%="n++ : " + n++ %><br>
		<%="n2++ : " + n2++ %><br>
		<%=plus(random, random) %><br>
		
		<!-- 스크립트릿은 jsp페이지의 어느 영역에서든 사용이 가능 -->
		<% int num = 10; %>
		<%= num %>
	</body>
</html>












