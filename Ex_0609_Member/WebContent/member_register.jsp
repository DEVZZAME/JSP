<%@page import="dao.MemberDAO"%>
<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String email = request.getParameter("email");
	String addr = request.getParameter("addr");
	
	MemberVO vo = new MemberVO();
	vo.setName(name);
	vo.setId(id);
	vo.setPwd(pwd);
	vo.setEmail(email);
	vo.setAddr(addr);
	
	int res = MemberDAO.getInstance().insert(vo);
	
	//회원정보 추가 완료 후, 목록으로 전환
	response.sendRedirect("member_list.jsp");
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