package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DeptDAO;
import vo.DeptVO;

//url mapping : 해당 서블릿 클래스를 실행하기 위한 호출경로
@WebServlet("/list.do")
public class DeptListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request,
							HttpServletResponse response) throws ServletException, IOException {
		
		//Servlet : 
		//서버에서 실행되는 서비스 객체
		//웹 응용프로그램을 만드는 자바기술로서 결과값을 HTML형태로 돌려준다
		//동시다발적인 사용자의 요청에 대한 응답이 용이
		
		//request : 요청처리 객체 - 파라미터, ip 등을 받아주는 객체
		//response : 응답처리 객체 - 요청에 대한 결과를 반환하는 객체
		System.out.println("ip : " + request.getRemoteAddr());
		
		//부서목록 가져오기
		List<DeptVO> list = DeptDAO.getInstance().selectList();
		
		//부서목록을 가지고 있는 list를 바인딩
		request.setAttribute("list", list);
		
		//포워딩 : 바인딩 된 데이터를 어떤 jsp에서 사용하고 싶은지를 결정해주는 코드
		RequestDispatcher disp = request.getRequestDispatcher("list.jsp");
		disp.forward(request, response);
	}

}
