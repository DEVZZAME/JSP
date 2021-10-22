<%@page import="java.util.ArrayList"%>
<%@page import="vo.DeptVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//JNDI를 통해 톰캣이 참조할 Resource를 검색
	InitialContext ic = new InitialContext();

	//Resource 위치 검색
	Context ctx = (Context)ic.lookup("java:comp/env");
	
	//검색한 Resource에서 원하는 객체를 가져온다
	DataSource dataSource = (DataSource)ctx.lookup("jdbc/oracle_test");
	
	Connection conn = dataSource.getConnection();
	
	System.out.println("---DB연결 성공---");
	
	//쿼리문
	String sql = "select * from dept";
	
	//쿼리문을 실행하는 명령처리객체
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	//pstmt를 통해 얻어낸 최종결과로 접근하여 한줄씩 결과를 가져오기 위한 객체
	ResultSet rs = pstmt.executeQuery();
	
	//부서목록을 저장할 ArrayList
	List<DeptVO> list = new ArrayList<DeptVO>();
	
	while(rs.next()){//다음 행으로 커서를 이동시킨다
		
		DeptVO vo = new DeptVO();
	
		//rs가 참조하고 있는 행에서 값을 가져와 vo에 저장
		vo.setDeptno(rs.getInt("deptno"));
		vo.setDname(rs.getString("dname"));
		vo.setLoc(rs.getString("loc"));
		
		list.add(vo);
	}//while
		//DB연결에 관여한 객체들은 모두 닫아주도록 하자!
		rs.close();
		pstmt.close();
		
	//DB연결을 위해 Connection을 사용했다면
	//DB사용이 끝난 뒤에 연결을 끊어줘야 다음 사용자가 이어서 들어올 수 있다.
	conn.close();//DBCP에 자리를 마련하자!
	
%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script>
			function send(data){
				
				var f = document.getElementById("myForm");
				var no = f.deptno;
				no.value = data ; 
				
				f.submit();
			}
		</script>
	</head>
	
	<body>
		<form id="myForm" action="sawon_list.jsp">
			<table border="1" align="center">
				<caption>:::부서목록:::</caption>
				<tr>
					<th>부서번호</th>
					<th>부서명</th>
					<th>부서위치</th>
				</tr>
				
				<%for(int i = 0; i<list.size(); i++){
					DeptVO vo = list.get(i);
					%>
				<tr align="center">
					<td><%=vo.getDeptno() %></td>
					<td>
						<a href="javascript:send(<%=vo.getDeptno()%>);"><%=vo.getDname() %></a>
					</td>
					<td><%=vo.getLoc() %></td>
				</tr>
				<%} %>
			</table>	
			
			<input name="deptno" type="hidden">
		</form>
		
	</body>
</html>








