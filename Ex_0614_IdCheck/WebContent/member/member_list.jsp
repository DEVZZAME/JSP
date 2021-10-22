<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="../js/httpRequest.js"></script>
		<script>
			function del(idx){
				if( !confirm("정말 삭제하시겠습니까?")){
					return;
				}
				
				var url = "member_del.do";
				var param = "idx="+idx;
				
				sendRequest( url, param, resultFn, "GET");
				
				function resultFn(){
					
					if(xhr.readyState == 4 && xhr.status == 200){
						//data = "[{'p':'no'}]";
						var data = xhr.responseText;
						
						//data가 가진 값을 실제 JSON 타입으로 변환(eval)
						var json = eval(data);
						
						//"[{'p':'no'}]";
						if(json[0].p == 'yes'){
							alert("삭제성공");
						}else{
							alert("삭제실패");
						}
						
						location.href="member_list.do";
					}
					
				}
			}
		</script>
	</head>
	
	<body>
		<table border=1>
			<caption>:::회원목록:::</caption>
			<tr colspan="7">
				<td>
					<input type="button" value="회원가입"
							onclick="location.href='member_insert_form.jsp'">
				</td>
			</tr>
			
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이메일</th>
				<th colspan="2">주소</th>
			</tr>
			
			<c:forEach var="vo" items="${ list }">
				<tr>
					<td>${ vo.idx }</td>
					<td>${ vo.name }</td>
					<td>${ vo.id }</td>
					<td>${ vo.pwd }</td>
					<td>${ vo.email }</td>
					<td>${ vo.addr }</td>
					
					<td>
						<input type="button" value="삭제"
								onclick="del('${vo.idx}');">
					</td>
				</tr>
			</c:forEach>
		</table>
	</body>
</html>