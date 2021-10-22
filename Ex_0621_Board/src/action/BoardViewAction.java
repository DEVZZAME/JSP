package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import vo.BoardVO;

/**
 * Servlet implementation class BoardViewAction
 */
@WebServlet("/board/view.do")
public class BoardViewAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//view.do?idx=20
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		//게시글 한건 조회
		BoardVO vo = BoardDAO.getInstance().selectOne(idx);
		
		//조회수 증가
		int res = BoardDAO.getInstance().update_readhit(idx);
		
		
		
		request.setAttribute("vo", vo);//바인딩
		
		RequestDispatcher disp =
				request.getRequestDispatcher("board_view.jsp");
		disp.forward(request, response);
	}

}
