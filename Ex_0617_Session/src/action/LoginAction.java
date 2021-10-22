package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import vo.MemberVO;

/**
 * Servlet implementation class LoginAction
 */
@WebServlet("/login.do")
public class LoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//Ajax로 넘어온 파라미터를 받는다
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		MemberVO vo = MemberDAO.getInstance().selectOne(id);
		
		String param = "";
		String result = "";
		
		//id가 없을 때
		if( vo == null ) {
			param = "no_id";
			result = String.format("[{'param':'%s'}]", param);
			//no_id를 콜백메서드로 응답
			response.getWriter().print(result);
			return;
		}
		
		//비밀번호가 일치하지 않을때
		if( !pwd.equals( vo.getPwd() ) ) {
			param = "no_pwd";
			result = String.format("[{'param':'%s'}]", param);
			response.getWriter().print(result);
			return;
		}
		
		//아이디와 비밀번호가 정확히 일치할 때
		//유저정보를 담고 있는 vo를 세션에 저장
		//세션영역 서버의 메모리(RAM)을 사용하기 때문에 세션에 저장된 값이 많으면
		//브라우저가 느려진다. 그러므로 세션은 꼭 필요할 때만 사용하도록 하자!
		HttpSession session = request.getSession();//세션스코프
		session.setAttribute("user", vo);
		session.setMaxInactiveInterval( 3600 );//세션 유지시간 1시간(초단위)
		
		param = "clear";
		result = String.format("[{'param':'%s'}]", param);
		response.getWriter().print(result);
	}

}















