package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import vo.BoardVO;

/**
 * Servlet implementation class BoardListAction
 */
@WebServlet("/board/list.do")
public class BoardListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//전체게시글 목록 가져오기
		List<BoardVO> list = BoardDAO.getInstance().selectList();
		
		request.setAttribute("list", list);//바인딩
		
		RequestDispatcher disp = 
				request.getRequestDispatcher("board_list.jsp");
		disp.forward(request, response);//포워딩
		
	}

}













