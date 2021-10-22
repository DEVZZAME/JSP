<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 
	JSON( Javascript Object Notation )
	서로 다른 프로그램에서 데이터를 교환하기 위한 표기법
	서로 다른 플랫폼간에 공통된 데이터를 제공해 줄 수 있다
 -->    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script>
			//JSON표기법(DEFAULT)
			var a = {'name':'홍길동', 'age':30, 'tel':'010-1111-1111'};
			document.write("이름 : " + a.name);
			
			document.write("<hr>")
			//일반 자바스크립트 배열
			var friend = ['강한솔', '박지원', '박민쵸'];
			document.write("이름 : "+friend[0]);
			
			document.write("<hr>")
			
			//JSON배열
			var fName = {'friend':['강한솔', '박지원', '박민쵸']};
			document.write( fName.friend[0]);
			
			document.write("<hr>")
			
			//JSON다차원배열
			var f_arr = [{'name':'정연','age':26 },
						 {'name':'모모','age':26 },
						 {'name':'나연','age':27 }];
			document.write(f_arr[0].name + " / " + f_arr[0].age + "<br>");
			document.write(f_arr[1].name + " / " + f_arr[1].age + "<br>");
			document.write(f_arr[2].name + " / " + f_arr[2].age + "<br>");

			
		</script>
	</head>
	
	<body>
		
	</body>
</html>