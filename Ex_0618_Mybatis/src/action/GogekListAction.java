package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.GogekDAO;
import vo.GogekVO;

/**
 * Servlet implementation class GogekListAction
 */
@WebServlet("/gogeklist.do")
public class GogekListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String search = "all";
		String str_addr = request.getParameter("search");
		
		//gogeklist.do?search=서울
		//gogeklist.do?search= <---- empty
		//gogeklist.do <---- null
		if( str_addr != null && !str_addr.isEmpty() ) {
			search = str_addr;
		}
		
		//고객목록 가져오기
		
		List<GogekVO> list = null; 
		
		if(search.equals("all")) {
			//전체목록
			list = GogekDAO.getInstance().select();
		}else {
			//지역별 고객목록
			list = GogekDAO.getInstance().select(search);
		}
		request.setAttribute("list", list);//바인딩
		
		RequestDispatcher disp = 
				request.getRequestDispatcher("gogek_list.jsp");
		disp.forward(request, response);//포워딩
	
	}

}
