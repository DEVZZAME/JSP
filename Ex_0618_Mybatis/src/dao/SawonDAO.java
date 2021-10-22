package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.SawonVO;

public class SawonDAO {
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static SawonDAO single = null;
	SqlSessionFactory factory = null;

	public static SawonDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new SawonDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
	public SawonDAO() {
		factory = MyBatisConnector.getInstance().getFactory();
	}
	
	//사원목록 가져오기
	public List<SawonVO> select(){
		
		//SqlSession : mapper로 접근하기 위한 클래스
		SqlSession sqlSession = factory.openSession();
		
		List<SawonVO> list = sqlSession.selectList("s.sawon_list");
		
		//connection, pstmt, rs등을 모두 닫는다
		sqlSession.close();//DB사용 후 sqlSession은 반드시 닫아주자!!
		
		return list;
	}
	
	//부서별 사원목록 조회
	public List<SawonVO> select( int deptno ){
		SqlSession sqlSession = factory.openSession();

		//mapper로 파라미터 전달하기!!
		//mapper로 전달되는 파라미터는 무조건 한 개다!!
		List<SawonVO> list =
				sqlSession.selectList("s.sawon_list_deptno", deptno);
		
		sqlSession.close();
		return list;
	}
	
}











