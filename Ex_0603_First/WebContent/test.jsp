<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jsp(java server page) : 내부적인 연산능력을 가지고 있는 HTML개념-->    

<% 
	//스크립트릿(Scriptlet) : jsp에서 자바코드를 사용하고자 할 때 지정하는 영역
	String name = "홍길동";
	String ip = request.getRemoteAddr();//접속자의 ip를 가져온다
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		<p>
			&lt;%@ 내용 &gt; : jsp헤더 - 페이지 요청시 인코딩 타입, import 등을 위해서 반드시 필요
		</p>
		
		<p>
			&lt;% 자바코드 % &gt; : 스크립트릿 - jsp에서 자바코드를 사용하기 위한 영역
		</p>
		
		<p>
			&lt;%= 변수명 % &gt; : 스크립트릿의 변수를 출력하는 출력코드 
		</p>
		
		<p>
			&lt;%= 변수명; % &gt; : 출력코드에서는 세미콜론(;) 사용시 오류발생
		</p>
		
		<%= name %><br>
		<%= ip %>
	</body>
</html>











