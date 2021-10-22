package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.IdCheckDAO;
import vo.IdCheckVO;

@WebServlet("/member/insert.do")
public class MemberInsertAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, 
						   HttpServletResponse response) throws ServletException, IOException {
		
		//post방식으로 넘어온 파라미터에 섞여있는 한글이 깨지지 않도록 처리
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String addr = request.getParameter("addr");
		
		IdCheckVO vo = new IdCheckVO();
		vo.setName(name);
		vo.setId(id);
		vo.setPwd(pwd);
		vo.setEmail(email);
		vo.setAddr(addr);
		
		int res = IdCheckDAO.getInstance().insert(vo);
		
		//DB에 데이터를 추가했으니, 목록을 보여주는 페이지로 전환
		response.sendRedirect("member_list.do");
	}

}
