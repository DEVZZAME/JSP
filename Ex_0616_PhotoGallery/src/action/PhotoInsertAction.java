package action;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.PhotoDAO;
import vo.PhotoVO;

@WebServlet("/photo/insert.do")
public class PhotoInsertAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, 
							HttpServletResponse response) throws ServletException, IOException {
		
		String web_path = "/upload/";
		
		//현재 프로젝트를 관리하는 객체
		ServletContext sc = request.getServletContext();
		
		//상대경로(web_path)를 절대경로(path)로 변환
		String path = sc.getRealPath( web_path );
		
		System.out.println(path);
		
		//파일을 포함하고 있는 파라미터를 처리하기 위한 객체
		MultipartRequest mr = new MultipartRequest(
												   request, //mr가 파라미터를 수신할 수 있도록 일시적으로 request를 위임
												   path, //업로드를 위한 절대경로
												   1024 * 1024 * 10, //최대 업로드 용량 10mb
												   "utf-8", //파라미터 수신시 인코딩 타입
												   new DefaultFileRenamePolicy());//동일파일명 정책
												   
		
		File f = mr.getFile("photo");
		String filename = f.getName();//업로드가 완료된 파일의 이름
		
		//파일타입 이외의 일반 파라미터 또한 mr로 수신해줘야 한다
		String ip = request.getRemoteAddr();
		String title = mr.getParameter("title");
		String pwd = mr.getParameter("pwd");
				
		//받은 파라미터를 vo에 묶어서 저장
		PhotoVO vo = new PhotoVO();
		vo.setTitle(title);
		vo.setFilename(filename);
		vo.setPwd(pwd);
		vo.setIp(ip);
		
		//insert를 위한 메서드
		PhotoDAO.getInstance().insert(vo);
		
		//insert가 완료되면
		response.sendRedirect("list.do");
	}

}









