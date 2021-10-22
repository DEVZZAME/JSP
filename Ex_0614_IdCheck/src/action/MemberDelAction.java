package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.IdCheckDAO;

@WebServlet("/member/member_del.do")
public class MemberDelAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, 
							HttpServletResponse response) throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		int res = IdCheckDAO.getInstance().delete(idx);
		
		String param = "no";
		if( res == 1 ) {
			param = "yes";
		}
		
		//param 변수가 가진 값을 JSON 배열 형태로 묶어서 콜백메서드로 전달
		String resultStr = String.format("[{'p':'%s'}]", param);
		
		//"[{'p':'%s'}]"의 결과를 콜백메서드로 보낸다
		response.getWriter().print(resultStr);
	}

}
