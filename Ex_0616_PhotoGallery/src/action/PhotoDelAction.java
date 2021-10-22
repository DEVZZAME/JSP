package action;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.org.apache.bcel.internal.classfile.Field;

import dao.PhotoDAO;
import vo.PhotoVO;

@WebServlet("/photo/photo_del.do")
public class PhotoDelAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request,
							HttpServletResponse response) throws ServletException, IOException {
		
		int idx = Integer.parseInt( request.getParameter("idx") );
		
		//idx에 해당되는 게시물 한건을 얻어온 후, 그 안에서 파일명을 가져오자
		PhotoVO vo = PhotoDAO.getInstance().selectOne(idx);
		
		//upload 폴더의 절대경로 구하기
		ServletContext sc = request.getServletContext();
		String path = sc.getRealPath("/upload/");
		
		int res = PhotoDAO.getInstance().del(idx);
		
		if( res == 1) {
			File f = new File(path, vo.getFilename());
			if(f.exists()) {
				f.delete();//path 경로의 파일을 실제로 제거
				
			}
		}
		
		response.sendRedirect("list.do");
	}

}
