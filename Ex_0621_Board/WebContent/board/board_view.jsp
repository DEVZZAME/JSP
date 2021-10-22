<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" width="700" align="center">
		<form name="f" method="post">
			<tr>
				<td width="120">제목</td>
				<td>${ vo.subject }</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${ vo.name }</td>
			</tr>
			<tr>
				<td>작성일</td>
				<td>${ vo.regdate }</td>
			</tr>
			<tr>
				<td>내용</td>
				<!-- 화면의 내용을 엔터값까지 그대로 출력하기 위한 태그 <pre> -->
				<td><pre>${ vo.content }</pre></td>
			</tr>
			<tr>
				<td>ip</td>
				<td>${ vo.ip }</td>
			</tr>
			<tr>
				<!-- 목록으로 -->
				<td colspan="2">
					<img src="../img/btn_list.gif"
							onclick="location.href='list.do'">
				<!-- 댓글(답변) -->
					<img src="../img/btn_reply.gif"
							onclick="reply();">
				<!-- 삭제 -->
					<img src="../img/btn_delete.gif"
							onclick="del();">
				</td>
			</tr>
		</form>
	</table>
</body>
</html>