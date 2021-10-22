<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- JSTL(JSP Standard Tag Library)
	  태그 영역에서 if, for, formatting 등을 사용 가능하도록 해주는 라이브러리 -->    
<!-- fmf(format) : 날짜나 숫자에 대한 포멧형식을 변경 -->	  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- c(core) : if, forEach와 같은 제어문을 사용할 수 있도록 하는 라이브러리 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%
	Date today = new Date();
	request.setAttribute("today", today);
	
	//배열
	String[] array = {"사과", "배", "포도", "참외", "수박"};
	request.setAttribute("fruit", array);
%>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		${today }<br>
		<fmt:formatDate value="${ today }"/><br>
		<fmt:formatDate value="${ today }" pattern="YYYY년 MM월 dd일 - hh:mm:ss"/>
		
		<hr>
		
		JSTL을 사용한 forEach문<br>
		<!-- var : for문이 반복될 때마다 갱신되는 값
			 begin : 시작값
			 end : 끝값
			 step : 증가값 -->
		<c:forEach var="i" begin="1" end="5" step="1">
		
			<c:if test="${i mod 2 eq 1 }">
				안녕(${ i }) <br>
			</c:if>
			
		</c:forEach>
			
		<hr>
		
		<!-- forEach를 통해 과일목록 출력하기 -->
		
		<c:forEach var="fru" items="${ fruit }">
			${ fru }<br>
		</c:forEach>
		
	</body>
</html>











