<%@page import="vo.SJVO"%>
<%@page import="dao.SJDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	int kor = Integer.parseInt(request.getParameter("kor"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	int math = Integer.parseInt(request.getParameter("math"));
	
	SJVO vo = new SJVO();
	vo.setName(name);
	vo.setKor(kor);
	vo.setEng(eng);
	vo.setMath(math);
	
	
	int res = SJDAO.getInstance().insert( vo );
	
	//학생정보 추가 완료 후, 목록으로 전환
	response.sendRedirect("SJ_list");
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