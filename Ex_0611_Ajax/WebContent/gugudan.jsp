<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 
	Ajax( Asynchruonus Javascript & XML )
	--자바스크립트를 이용한 백그라운드 통신기술로서 하나의 웹페이지 안에서 변경이 필요한
	    특정 영역에 대해서만 갱신이 가능해짐( 비동기통신 )
 -->    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<!-- Ajax 사용을 위해 필수적으로 준비해둬야 하는 자바스크립트 파일 -->
		<script src="js/httpRequest.js"></script>
		
		<script>
			function send(){
				var dan = document.getElementById("dan").value;
				
				var number_pattern = /^[0-9]+$/;
				if( !number_pattern.test( dan ) ){
					alert("값은 정수로 입력하세요");
					return;
				}//if
				
				if( dan < 2 || dan > 9){
					alert("2 ~ 9 사이의 값을 입력하세요");
					return;
				}
				
				//Ajax를 통해 dan의 값을 다른 jsp로 전달
				var url = "gugu_ajax.jsp";
				var param = "dan=" + dan;
				
				/* 전송할 url, 파라미터값, 콜백메서드, 전송방식 */
				sendRequest( url, param, resultFn, "GET" );
			}//send()
			
			function resultFn(){
				//콜백메서드(Ajax를 통해 전달된 데이터처리가 완료된 후, 자동으로 호출되는 메서드)
				
				//xhr.readyState
				//0 : 초기화 오류
				//1, 2, 3 : 페이지 로드중
				//4 : 현재 페이지 로드 완료
				
				//xhr.status
				//200 : 문제없음
				//404(url 경로 없음), 500(서버에러)...
				console.log(xhr.readyState + " / " + xhr.status);
				if(xhr.readyState == 4 && xhr.status == 200){
					//도착한 데이터를 받아보자
					var data = xhr.responseText;
					//alert(data);
					
					document.getElementById("disp").innerHTML = data;
				}
			}
		</script>
	</head>
	
	<body>
		단 : <input id="dan">
		<input type="button" value="결과확인" onclick="send()">
		
		<hr>
		
		<div id="disp"></div>
	</body>
</html>