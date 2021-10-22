package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.IdCheckDAO;
import vo.IdCheckVO;

//앞으로 forward할 jsp가 담겨진 폴더의 이름까지 url매핑으로 명시해줘야 한다
@WebServlet("/member/member_list.do")
public class MemberListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, 
						   HttpServletResponse response) throws ServletException, IOException {
		/*
		 *DB접근 객체와 UI객체를 완전히 분리시켜 작업하는 지금과 같은 형태를 model2 라고 부른다
		 *보통 model2를 가지고 MVC패턴이라고 부른다 
		 * M(MODEL) : DAO
		 * V(VIEW) : JSP
		 * C(CONTROLLER) : SERVLET
		 * */
		
		
		
		//회원목록
		List<IdCheckVO> list = IdCheckDAO.getInstance().selectList();
		
		//list를 requestScope 영역에 바인딩
		request.setAttribute("list", list);
		
		//위의 바인딩 된 정보를 어떤 jsp에서 사용할 지 명시(포워딩)
		RequestDispatcher disp =
					request.getRequestDispatcher("member_list.jsp");
		disp.forward(request, response);
	}

}
