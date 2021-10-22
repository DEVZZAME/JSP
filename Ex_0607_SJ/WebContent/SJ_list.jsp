<%@page import="dao.SJDAO"%>
<%@page import="vo.SJVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<SJVO> list = SJDAO.getInstance().selectList();
	int total;
	float avg;
%>       
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script>
			function del(no){
				
				if( !confirm("정말 삭제 하시겠습니까?")){
					return;
				}
				
				location.href="sung_del.jsp?no="+no;
			}
		</script>
	</head>
	
	<body>
		<table border="1">
			<caption>:::학생정보:::</caption>
			<tr>
				<td colspan="8" align="center">
					<input type="button" value="학생정보 추가하기"
							onclick="location.href='insert_form.jsp'">
				</td>			
			</tr>
			
			<tr>
				<th>이름</th>
				<th>국어</th>
				<th>영어</th>
				<th>수학</th>
				<th>총점</th>
				<th>평균</th>
				<th>순위</th>
				<th>비고</th>
			</tr>
			
			<%for(int i = 0; i < list.size(); i++){
				SJVO vo = list.get(i);
			%>
			<tr>
				<td><%=vo.getName() %></td>
				<td><%=vo.getKor() %></td>
				<td><%=vo.getEng() %></td>
				<td><%=vo.getMath() %></td>
				<td><%=vo.getTotal() %></td>
				<td><%=vo.getAvg() %></td>
				<td><%=vo.getRank() %></td>
				
				<td>
					<input type="button" value="삭제"
							onclick="del('<%= vo.getNo()%>');">
				</td>
			</tr>
			<%} %>
			
		</table>
	</body>
</html>