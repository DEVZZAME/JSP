package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.IdCheckDAO;
import vo.IdCheckVO;

/**
 * Servlet implementation class MemberCheckAction
 */
@WebServlet("/member/check_id.do")
public class MemberCheckAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//check_id.do?id=one
		String id = request.getParameter("id");
		
		IdCheckVO vo = IdCheckDAO.getInstance().selectOne(id);
		
		String res = "no";
		
		if( vo == null ) {
			//아이디가 중복되지 않는다(가입이 가능하다)
			res = "yes";
		}
		
		//res를 JSON표기법으로 묶어 콜백 메서드로 보낸다
		//콜백메서드에서 JSON을 받으려면 반드시 배열형태로 묶어서 보내주자!!
		//[{'result':'%s'}] <--- []를 가지는 배열형태로 묶어야 함!!
		String resultStr = String.format("[{'result':'%s'}]", res);
		
		//resultStr을 콜백 메서드로 전달!
		response.getWriter().print(resultStr);
		
	}

}








