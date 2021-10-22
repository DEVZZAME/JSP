<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script>
			function send(f){
				var name = f.name.value.trim();
				var id = f.id.value.trim();
				var pwd = f.pwd.value.trim();
				var email = f.email.value.trim();
				var addr = f.addr.value.trim();
				
				//유효성 체크
				if( name == ''){
					alert("이름을 입력하세요");
					return;
				}
				if( id == ''){
					alert("아이디를 입력하세요");
					return;
				}
				if( pwd == ''){
					alert("암호를 입력하세요");
					return;
				}
				if( email == ''){
					alert("이메일을 입력하세요");
					return;
				}
				if( addr == ''){
					alert("주소를 입력하세요");
					return;
				}
				if( id < 8 || id > 16){
					alert("아이디는 8 글자 ~ 16 글자 사이만 입력해주세요");
					return;
				}
				
				f.action = "member_register.jsp"
				f.submit();
			}
		</script>
	</head>
	
	<body>
		<form action="member_register.jsp">
			<table border="1">
				<caption>:::초간단 회원가입:::</caption>
				
				<tr>
					<th>이름</th>
					<td><input name="name"></td>
				</tr>
				
				<tr>
					<th>아이디</th>
					<td><input name="id"></td>
				</tr>
				
				<tr>
					<th>비밀번호</th>
					<td><input name="pwd" type="password"></td>
				</tr>
				
				<tr>
					<th>이메일</th>
					<td><input name="email"></td>
				</tr>
				
				<tr>
					<th>주소</th>
					<td><input name="addr"></td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="등록"
								onclick="send(this.form);">
						<input type="button" value="취소"
								onclick="location.href='member_list.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>