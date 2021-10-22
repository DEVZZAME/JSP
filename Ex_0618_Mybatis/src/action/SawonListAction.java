package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SawonDAO;
import vo.SawonVO;

@WebServlet("/sawonlist.do")
public class SawonListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//sawonlist.do?deptno=10
		//sawonlist.do <---- 파라미터가 존재하지 않는 상태(null)
		//sawonlist.do?deptno= <---- 파라미터 값이 존재하지 않는 상태 (empty)
		int deptno = 0;
		String str_deptno = request.getParameter("deptno");
		
		if( str_deptno !=null && !str_deptno.isEmpty()) {
			//정상적으로 deptno 파라미터가 넘어온 경우에만 정수로 변경해준다!!
			deptno = Integer.parseInt(str_deptno);
		}
		
		//사원목록 가져오기
		List<SawonVO> list = null; 
				
		if( deptno == 0 ) {
			list = SawonDAO.getInstance().select();//전체목록
		}else {
			//부서번호별 사원조회
			list = SawonDAO.getInstance().select(deptno);
		}
		
		request.setAttribute("list", list);
		
		RequestDispatcher disp =
				request.getRequestDispatcher("sawon_list.jsp");
		disp.forward(request, response);
	
	}

}
