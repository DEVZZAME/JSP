<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script>
			function send(f){
				
				var photo = f.photo.value;
				var title = f.title.value;
				var pwd = f.pwd.value;
				
				if( photo == ''){
					alert("등록할 사진을 선택하세요");
					return;
				}
				if( title == ''){
					alert("제목을 입력하세요");
					return;
				}
				if( pwd == ''){
					alert("비밀번호를 입력하세요");
					return;
				}
				
				f.submit();
				
			}
		</script>
	</head>
	
	<body>
		<form action="insert.do"
			  method="post"
			  enctype="multipart/form-data">
			  
			  <table border="1" align="center">
			  	<caption>:::사진등록:::</caption>
			  	<tr>
			  		<th>제목</th>
			  		<td>
			  			<input name="title">
			  		</td>
			  	</tr>
			  	<tr>
			  		<th>비밀번호</th>
			  		<td>
			  			<input type="password" name="pwd">
			  		</td>
			  	</tr>
			  	<tr>
			  		<th>사진</th>
			  		<td>
			  			<input name="photo" type="file">
			  		</td>
			  	</tr>
			  	<tr>
			  		<td colspan="2" align="center">
			  			<input type="button" value="등록하기"
			  					onclick="send(this.form);">
			  			
			  			<input type="button" value="등록취소"
			  					onclick="location.href='list.do'">
			  		</td>
			  	</tr>
			  	
			  </table>
			
		</form>
	</body>
</html>