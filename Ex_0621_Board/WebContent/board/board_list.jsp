<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table width="700" align="center"   
	       style="border-collapse:collapse;"
	       border="1">
		
		<tr>
			<td colspan="5">
				<img src="../img/title_04.gif">
			</td>
		</tr>
		
		<tr>
			<td width="50" align="center">번호</td>
			<td>제목</td>
			<td width="150" align="center">작성자</td>
			<td width="100" align="center">작성일</td>
			<td width="70" align="center">조회수</td>
		</tr>
		
		<c:forEach var="vo" items="${ list }">
		<tr>
			<td align="center">${ vo.idx }</td>
			
			<td>
			<!-- 댓글인 경우 제목을 들여쓰기 -->
			<c:forEach begin="1" end="${ vo.depth }">
				&nbsp;
			</c:forEach>
			
			<!-- 댓글기호 -->
			<c:if test="${ vo.depth ne 0 }">
				ㄴ
			</c:if>
			
			<a href="view.do?idx=${ vo.idx }">${ vo.subject }</a>
			</td>
			
			<td align="center">${ vo.name }</td>
			<td align="center">${ vo.regdate }</td>
			<td align="center">${ vo.readhit }</td>
		</tr>
		</c:forEach>
		
		<tr>
			<td colspan="5" align="center">
				◀ 1 2 3 ▶
			</td>
		</tr>
		
		<tr>
			<td colspan="5" align="right">
				<img src="../img/btn_reg.gif"
				 onclick="location.href='board_write.jsp'"
				 style="cursor:pointer;">
			</td>
		</tr>
		
	</table>
</body>
</html>





































