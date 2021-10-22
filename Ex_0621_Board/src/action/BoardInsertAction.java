package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import vo.BoardVO;

/**
 * Servlet implementation class BoardInsertAction
 */
@WebServlet("/board/insert.do")
public class BoardInsertAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//insert.do?subject=제목&name=홍길동&content=내용&pwd=1111
		request.setCharacterEncoding("utf-8");
		
		//파라미터 수신하기
		String subject = request.getParameter("subject");
		String name = request.getParameter("name");
		String content = request.getParameter("content");
		String pwd = request.getParameter("pwd");
		String ip = request.getRemoteAddr();//ip
		
		//받아온 파라미터를 vo로 포장하자
		BoardVO vo = new BoardVO();
		vo.setSubject(subject);
		vo.setName(name);
		vo.setContent(content);
		vo.setPwd(pwd);
		vo.setIp(ip);
		
		BoardDAO.getInstance().insert( vo );
		
		response.sendRedirect("list.do");
	}

}












