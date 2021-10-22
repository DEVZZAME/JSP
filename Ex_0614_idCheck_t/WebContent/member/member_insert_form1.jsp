<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<!-- ../ 한단계 위의 폴더로 빠져나가기 -->
	<script src="../js/httpRequest.js"></script>

	<script type="text/javascript">
	
		//아이디 중복체크를 했는지 확인하는 변수
		var b_idCheck = false;
	
		function send(f) {
			
			var id = f.id.value;
			
			if( id == ''){
				alert("아이디가 비어있습니다");
				return;
			}
			
			if( !b_idCheck ){//b_idCheck == false
				alert("아이디 중복체크를 먼저 하세요");
				return;
			}
			
			f.action = "insert.do";
			f.method = "post";
			f.submit();
			
		}
		
		//아이디 중복체크를 위한 메서드
		function check_id() {
			var id = document.getElementById("id").value;
			
			if( id == ''){
				alert("아이디를 입력하세요");
				return;
			}
			
			//id를 Ajax를 통해 서버로 전송
			var url = "check_id.do";
			var param = "id="+id;
			
			sendRequest(url, param, resultFn, "GET");
		}
		
		//Ajax를 통해 호출된 서블릿이 작업을 완료한 뒤
		//자동으로 호출되는 콜백메서드
		function resultFn(){
			//xhr.readyState == 4 : 로딩완료
			//xhr.status == 200 : 이상없음
			if( xhr.readyState == 4 && xhr.status == 200 ){
				
				//서블릿으로 부터 도착한 데이터를 받는다
				var data = xhr.responseText;//"[{'result':'no'}]"
				
				//우리가 받은 data는 제이슨표기법처럼 생겼지만
				//""에 포장되어 있는 일반 문자열일 뿐이다.
				//이것을 ""를 제거하여 실제 JSON타입으로 변경(파싱)해줘야 한다
				var json = eval( data );
				
				if( json[0].result == 'no' ){
					alert("이미 사용중인 아이디 입니다");
					return;
					
				}else{
					
					alert("사용 가능한 아이디 입니다");
					b_idCheck = true;
					
					//사용가능한 아이디라면 input입력상자를 읽기전용으로 변경
					document.getElementById("id").readOnly = true;
					
				}
				
				
				
			}
		}
		
	</script>
</head>
<body>
	<form>
	
		<table border="1">
			<caption>회원가입</caption>
			
			<tr>
				<th>아이디</th>
				<td>
					<input name="id" id="id">
					<input type="button" value="중복체크" onclick="check_id()">
				</td>
			</tr>
			
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pwd"></td>
			</tr>
			
			<tr>
				<th>이름</th>
				<td><input name="name"></td>
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
					<input type="button" value="가입"
					       onclick="send(this.form);">
					       
					<input type="button" value="취소"
					       onclick="location.href='member_list.do'">       
				</td>
			</tr>
			
		</table>
	
	</form>
</body>
</html>









