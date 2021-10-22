<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		EL산술연산자( +, -, *, /, %)<br>
		\${ 1 + 1 }와 같이 맨 앞에 역슬래시(\)를 붙여주면 EL표기법이 아니라 문자열처럼 출력됨<br>
		\${ 1 + 1 } = ${ 1 + 1 } <br>
		\${ 1 - 1 } = ${ 1 - 1 } <br>
	<!--	\${ 10 / 3 } = ${ 10 / 3 } or ${ 10 div 3 }<br>-->
		\${ 10 % 3 } = ${ 10 % 3 } or ${ 10 mod 3 }<br>
		
		<hr>
		
		EL비교연산자<br>
		\${ 3 > 2 } = ${ 3 > 2 } or ${3 gt 2 }<br>
		\${ 3 < 2 } = ${ 3 < 2 } or ${3 lt 2 }<br>
		\${ 3 >= 2 } = ${ 3 >= 2 } or ${3 ge 2 }<br>
		\${ 3 <= 2 } = ${ 3 <= 2 } or ${3 le 2 }<br>
		\${ 3 == 2 } = ${ 3 == 2 } or ${3 eq 2 }<br>
		<!-- \${ 3 != 2 } = ${ 3 != 2 } or ${3 ne 2 }<br> -->

		
		<hr>
		
		파라미터 : ${ empty param.msg }
		
		<!-- && : and
			 || : or -->
	</body>
</html>