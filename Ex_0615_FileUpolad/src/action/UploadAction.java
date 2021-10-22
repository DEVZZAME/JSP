package action;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/upload.do")
public class UploadAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, 
							HttpServletResponse response) throws ServletException, IOException {
	
		//request.setCharacterEncoding("utf-8");
		
		String web_path = "/upload/";//<-- Webcontent/upload
		//현재 프로젝트를 관리하는 객체
		ServletContext sc = request.getServletContext();
		
		//web_path에 지정되어 있는 절대경로를 가져오기 위한 메서드
		String path = sc.getRealPath(web_path);
		System.out.println(path);
		
		//파일을 포함하여 파라미터를 받고 업로드 처리하기 위한 객체
		MultipartRequest mr = new MultipartRequest(
									request,
									path, //업로드 위치
									1024 * 1024 * 100, //최대 업로드 용량(100mb)
									"utf-8", //인코딩 타입
									new DefaultFileRenamePolicy());
		//DefaultFileRenamePolicy() : 동일파일명 정책(파일명이 중복되면 자동으로 이름을 변경해 줌)
		
		String filename = "no_file";
		
		//업로드된 파일(photo)정보 얻기
		//File형태로 넘어온 파라미터인 photo는 mr를 통해 getFile로 받는다
		File f = mr.getFile("photo");
		
		if( f != null) {
			filename = f.getName();
		}
		
		//파일 이외의 파라미터(title)역시 mr를 통해서 받는다
		//String title = request.getParameter("title"); <---오류난다
		String title = mr.getParameter("title");
		
		
		//파일명과 제목을 바인딩
		request.setAttribute("title", title);
		request.setAttribute("filename", filename);
		
		//포워딩
		RequestDispatcher disp = 
					request.getRequestDispatcher("result.jsp");
		disp.forward(request, response);
	}

}
