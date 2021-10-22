<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<!-- Ajax사용을 위한 자바스크립트 참조 -->
	<script src="js/httpRequest.js"></script>

	<script>
		function send(f){
			
			var id = f.id.value.trim();
			var pwd = f.pwd.value.trim();
			
			if( id == '' ){
				alert("아이디를 입력하세요");
				return;
			}
			
			if( pwd == '' ){
				alert("비밀번호를 입력하세요");
				return;
			}
			
			//Ajax를 통해 id와 pwd를 파라미터로 전달
			var url = "login.do";
			
			//encodeURIComponent() : 비밀번호에 @, !같은 특수문자가 있어도 정상적으로
			//데이터를 전송하기 위한 메서드
			var param = "id=" + id + "&pwd=" + encodeURIComponent(pwd);
			
			sendRequest( url, param, resFn, "POST" );
		}
		
		function resFn(){
			
			if( xhr.readyState == 4 && xhr.status == 200 ){
				
				// data = "[{'param':'clear'}]";
				var data = xhr.responseText;
				var json = eval(data);
				
				if( json[0].param == 'no_id' ){
					alert("아이디가 존재하지 않습니다");
					
				}else if( json[0].param == 'no_pwd' ){
					alert("비밀번호가 일치하지 않습니다");
					
				}else{//clear
					location.href = "main_content.jsp";
				}
				
			}
			
		}
		
	</script>
</head>

<body>
	<form>
		<table border="1" align="center">
			<caption>:::로그인:::</caption>
			
			<tr>
				<th>아이디</th>
				<td><input name="id"></td>
			</tr>
			
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pwd"></td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="로그인" onclick="send(this.form);">
				</td>
			</tr>
			
		</table>
	</form>
</body>

</html>






