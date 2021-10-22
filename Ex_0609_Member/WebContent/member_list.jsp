<%@page import="dao.MemberDAO"%>
<%@page import="java.util.List"%>
<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<MemberVO> list = MemberDAO.getInstance().selectList();
%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script>
			function del(idx){
				if( !confirm("정말 삭제하시겠습니까?") ){
					return;
				}
				location.href = "member_del.jsp?idx="+idx;
			}
		</script>
	</head>
	
	<body>
		<table border="1" align="center">
			<caption>:::회원목록:::</caption>
			<tr>
				<td colspan="7">
					<input type="button" value="추가"
							onclick="location.href='member_insert_form.jsp'">
				</td>
			</tr>
			
			<tr>
				<th>회원번호</th>
				<th>이름</th>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이메일</th>
				<th>주소</th>
				<th>비고</th>
			</tr>
			
			<%for(int i = 0; i < list.size(); i++){ 
				MemberVO vo = list.get(i);
			%>
			<tr>
				<td><%=vo.getIdx() %></td>
				<td><%=vo.getName() %></td>
				<td><%=vo.getId() %></td>
				<td><%=vo.getPwd() %></td>
				<td><%=vo.getEmail() %></td>
				<td><%=vo.getAddr() %></td>
				
				<td>
					<input type="button" value="삭제"
							onclick="del('<%=vo.getIdx()%>');">
				</td>
			</tr>
			<%} %>
		</table>
	</body>
</html>