<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script>
			function send(f){
				f.action="ex07_habit_result.jsp"
				f.method="GET";
				f.submit();
			}
		</script>
	</head>
	
	<body>
		<form>
			취미 : <input name="hobby"><br>
			특기 : <input name="specialty"><br>
			스킬 : <input name="skill"><br>
			<input type="button" value="전송" onclick="send(this.form);">
		</form>
	</body>
</html>