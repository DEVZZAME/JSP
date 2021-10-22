<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//EL(Expression Language) : JSP에서 사용하는 출력코드를 간결하게 사용할 수 있도록 하는 표현언어
	//							(JSP 외의 HTML 등에서는 EL표현식을 사용할 수 없다)
	//EL표현식을 사용하기 위해 존재하는 JSP의 내부 클래스
	//1) pageScope : 페이지스코프에 저장된 값들은 현재 페이지에서만 사용이 가능
	//2) requestScope : 가장 많이 사용하는 영역
	//					requestScope에 저장된 값들은 최대 두개의 페이지에서 사용이 가능
	//3) sessionScope : 하나의 웹 브라우저에서 요청되는 모든 페이지에서 사용이 가능
	//4) applicationScope : 웹 애플리케이션에서 요청되는 모든 페이지에서 사용이 가능

	String msg = "안녕";
	
	pageContext.setAttribute("msg", "페이지스코프의 값");
	request.setAttribute("msg", "리퀘스트스코프의 값");
	session.setAttribute("msg", "세션에 저장된 값");
	application.setAttribute("msg", "애플리케이션에 저장된 값");
	%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		JSP출력코드 : <%=msg %><br>
		EL표현식(PageScope) : ${ pageScope.msg }<br>
		EL표현식(RequestScope) : ${ requestScope.msg }<br>
		EL표현식(SessionScope) : ${ sessionScope.msg }<br>
		EL표현식(ApplicationScope) : ${ applicationScope.msg }<br>
		EL표현식(생략식) : ${ msg }<br>
		<!-- 생략식을 사용했을 때 영역을 참조하는 순서
			1.pageScope
			2.requestScope
			3.sessionScope
			4.applicationScope -->
		EL표현식(파라미터) : ${ param.age }	
		<!-- http://localhost:9090/Ex_0610_EL/ex1_el.jsp?age=30
		와 같이 age라는 파라미터에 30이라는 값을 입력하면 파라미터는 30이 출력됨 -->
	</body>
</html>










