package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PhotoDAO;
import vo.PhotoVO;

@WebServlet("/photo/list.do")
public class PhotoListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, 
							HttpServletResponse response) throws ServletException, IOException {
		//사진 목록 가져오기
		List<PhotoVO> list = PhotoDAO.getInstance().selectList();
		
		//list를 바인딩 및 포워딩
		request.setAttribute("list", list);
		
		RequestDispatcher disp = 
				request.getRequestDispatcher("photo_list.jsp");
		
		disp.forward(request, response);
	}

}
