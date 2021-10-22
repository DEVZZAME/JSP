<%@page import="java.util.ArrayList"%>
<%@page import="vo.PersonVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	PersonVO v1 = new PersonVO();
	v1.setIdx(1);
	v1.setAge(20);
	v1.setName("홍길동");
	
	PersonVO v2 = new PersonVO();
	v2.setIdx(2);
	v2.setAge(22);
	v2.setName("이길동");
	
	request.setAttribute("v1", v1);
	request.setAttribute("v2", v2);
	
	ArrayList<PersonVO> arr = new ArrayList<PersonVO>();
	arr.add(v1);
	arr.add(v2);
	request.setAttribute("m_arr", arr);
	
%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		<%= v1.getIdx() +" / "+ v1.getAge() + " / "+ v1.getName()%><br>
		${v1.idx } / ${ v1.age } / ${ v1.name } <br>
		${v2.idx } / ${v2.age } / ${v2.name }<br>
		
		<%=arr.get(0).getName() %><br>
		${ m_arr[0].name }
		
		<hr>
		

	</body>
</html>











