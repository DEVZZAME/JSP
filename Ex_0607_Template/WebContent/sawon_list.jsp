<%@page import="vo.SawonVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.SawonDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//SawonDAO dao = SawonDAO.getInstance();
	List<SawonVO> list = SawonDAO.getInstance().selectList();
%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		<table border="1">
			<caption>:::사원목록:::</caption>
			<tr>
				<th>사번</th>
				<th>이름</th>
				<th>직책</th>
			</tr>
			<%for(int i = 0; i < list.size(); i++){ 
				SawonVO vo = list.get(i);
			%>
			<tr>
				<td><%=vo.getSabun() %></td>
				<td><%=vo.getSaname() %></td>
				<td><%=vo.getSajob() %></td>
			</tr>
			<%} %>

		</table>
	</body>
</html>