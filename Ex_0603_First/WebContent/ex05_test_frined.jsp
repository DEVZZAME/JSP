<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.FriendVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	FriendVO v1 = new FriendVO();
	v1.setName("홍길동");
	v1.setAge(30);
	v1.setTel("010-1111-1111");
	
	FriendVO v2 = new FriendVO();
	v2.setName("마루치");
	v2.setAge(20);
	v2.setTel("010-2222-2222");
	
	List<FriendVO> fList = new ArrayList<>();
	fList.add(v1);
	fList.add(v2);
%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		<table border="1">
			<tr>
				<th>이름</th>
				<th>나이</th>
				<th>전화번호</th>
			</tr>
			
			<%for(int i = 0; i < fList.size(); i++){ %>
				<tr>
					<td><%=fList.get(i).getName() %></td>
					<td><%=fList.get(i).getAge() %></td>
					<td><%=fList.get(i).getTel() %></td>
				</tr>
			<%} %>
			
		</table>
	</body>
</html>







