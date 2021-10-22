<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- 외부 스타일시트 참조 -->
	<link rel="stylesheet" href="../css/photo.css">
	<script type="text/javascript">
		function del(f){
			//삭제를 원하는 원본 비밀번호
			var pwd = f.pwd.value.trim();
			
			//사용자가 삭제를 위해 지금 입력받은 비밀번호
			var pwd2 = f.pwd2.value.trim();
			
			//삭제를 위한 일련번호
			var idx= f.idx.value.trim();
			
			if( pwd != pwd2){
				alert("비밀번호가 일치하지 않습니다")
				return;
			}
			
			if(!confirm("정말 삭제하시겠습니까?")){
				return;
			}
			
			f.action = "photo_del.do";
			f.method = "post";
			f.submit();
		}
	</script>
</head>
<body>
	<div id="main_box">

		<h1>:::PhotoGallery</h1>
		<div align="center" style="margin: 10px;">
			<input type="button" value="사진올리기"
					onclick="location.href='insert_form.jsp'">
		</div>

		<div id="photo_box">
		
			<c:if test="${empty list }">
				<div align="center">등록된 사진이 없습니다.</div>
			</c:if>
			
			<c:forEach var="vo" items="${ list }">
				<div class="photo_type">

					<img src="../upload/${vo.filename}">

					<div class="title">${vo.title}</div>
						<form>
							<div align="center">
							<input type="hidden" name="pwd" value="${ vo.pwd }">
							<input type="hidden" name="idx" value="${ vo.idx }">
							
							<input type="password" name="pwd2" size="10">
							<input type="button" value="삭제"
									onclick="del(this.form);">
						</form>
					</div>

				</div>
			</c:forEach>

		</div>


	</div>
</body>
</html>