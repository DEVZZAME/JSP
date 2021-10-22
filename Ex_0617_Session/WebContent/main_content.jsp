<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<!-- 자주 사용하는 jsp를 원하는 페이지에서 가져다 쓸 수 있또록
		외부의 jsp를 붙여주는 태그 - include -->
		<jsp:include page="check_login.jsp"/>
		메인페이지 입니다.<br>
		${ user.name }님 환영합니다
		
		<input type="button" value="로그아웃" onclick="location.href='logout.do'">
	</body>
</html>