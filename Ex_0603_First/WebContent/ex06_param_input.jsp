<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script>
			function send(f){
				//파라미터로 넘어온 f는 id가 aaa인 form태그를 의미
				
				f.action = "ex06_param_result.jsp"
				f.method = "GET";//POST : url에 파라미터가 노출 되지 않음
				f.submit(); //form태그가 가진 파라미터를 action에 지정된 jsp로 전달
				
				
			}
		</script>
	</head>
	
	<body>
		<form>
			이름 : <input name="myName"><br>
			나이 : <input name="age"><br>
			전화 : <input name="tel"><br>
			
			<input type="button" value="전송" onclick="send(this.form);">
		</form>
	</body>
</html>