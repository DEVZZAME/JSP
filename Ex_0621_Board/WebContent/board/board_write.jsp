<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script type="text/javascript">
		function send_check() {
			var f = document.f; //f라는 name을 가지고 있는 form태그
			
			//유효성 체크
			var name = f.name.value;
			if( name == '' ){
				alert("작성자를 입력하세요");
				return;
			}
			
			f.method="post";
			f.action = "insert.do";
			f.submit();
		}
	</script>

</head>
<body>
	<table border="1" width="700" align="center">
		<caption>:::새 글 작성하기:::</caption>
		
		<form name="f">
			<tr>
				<td>제목</td>
				<td><input name="subject" style="width:250px;"></td>
			</tr>
			
			<tr>
				<td>작성자</td>
				<td><input name="name" style="width:250px;"></td>
			</tr>
			
			<tr>
				<td>내용</td>
				<td>
					<textarea rows="9" cols="85" name="content"></textarea>
				</td>
			</tr>
			
			<tr>
				<td>비밀번호</td>
				<td><input name="pwd" type="password" style="width:250px;"></td>
			</tr>
			
			<tr>
				<td colspan="2">
					<img src="../img/btn_reg.gif" 
					 onclick="send_check();">
					 
					<img src="../img/btn_back.gif"
					 onclick="location.href='list.do'"> 
				</td>
			</tr>
		</form>
	</table>
</body>
</html>






