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
				var kor = f.kor.value.trim();
				var eng = f.eng.value.trim();
				var math = f.math.value.trim();
				
				//유효성 체크
				if( name == ''){
					alert("이름을 입력하세요");
					return;
				}
				
				var num_pattern = /^[0-9]+$/;
				
				if( !num_pattern.test(kor) || kor < 0 || kor > 100 ){
					alert("성적은 0 ~ 100 사이의 정수값만 입력이 가능합니다");
					return;
				}
				
				if( !num_pattern.test(eng) || eng < 0 || eng > 100 ){
					alert("성적은 0 ~ 100 사이의 정수값만 입력이 가능합니다");
					return;
				}
				
				if( !num_pattern.test(math) || math < 0 || math > 100 ){
					alert("성적은 0 ~ 100 사이의 정수값만 입력이 가능합니다");
					return;
				}
				
				f.action = "sung_register.jsp";
				f.submit();
			}
		</script>
	</head>
	
	<body>
		<form>
			<table border="1">
				<caption>:::학생추가:::</caption>
				<tr>
					<th>이름</th>
					<td><input name="name"></td>
				</tr>
				
				<tr>
					<th>국어</th>
					<td><input name="kor"></td>
				</tr>
				
				<tr>
					<th>영어</th>
					<td><input name="eng"></td>
				</tr>
				
				<tr>
					<th>수학</th>
					<td><input name="math"></td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="등록" onclick="send(this.form);">
						<input type="button" value="취소" onclick="location.href='SJ_list.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>