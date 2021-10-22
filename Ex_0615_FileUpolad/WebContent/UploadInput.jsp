<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script>
			function send(f){
				
				var title = f.title.value;
				var photo = f.photo.value;
				
				if(title == ''){
					alert("제목을 입력하세요");
					return;
				}
				
				if(photo == ''){
					alert("파일을 선택하세요");
					return;
				}
				
				f.action = "upload.do";
				f.submit();
			}
		</script>
	</head>
	
	<body>
	<!-- 파일타입의 input을 전송하기 위해 반드시 필요한 속성
		 1.전송방식 : POST
		 2.enctype : 파일을 포함하는 폼태그를 전송하는 인코딩 타입-->
		<form method="POST" enctype="multipart/form-data">
			제목<input name="title"><br>
			첨부<input type="file" name="photo"><br>
			<input type="button" value="업로드" onclick="send(this.form);"><br>
		</form>
	</body>
</html>















