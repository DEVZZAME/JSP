package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.BoardVO;

public class BoardDAO {
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static BoardDAO single = null;

	public static BoardDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new BoardDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
	SqlSessionFactory factory;
	public BoardDAO() {
		factory = MyBatisConnector.getInstance().getFactory();
	}
	
	//전체게시물 조회
	public List<BoardVO> selectList(){
		
		SqlSession sqlSession = factory.openSession();
		List<BoardVO> list = sqlSession.selectList("b.board_list");
		sqlSession.close();
		
		return list;
	}
	
	//새 게시글 추가
	public int insert( BoardVO vo ) {
		
		SqlSession sqlSession = factory.openSession( true );//auto commit
		int res = sqlSession.insert("b.board_insert", vo );
		
		//factory.openSession( true ); <--- true가 세팅되어 있다면 아래의 commit()은 
		//기술하지 않아도 상관이 없다
		//sqlSession.commit();
		
		sqlSession.close();
		
		return res;	
	}
	
	//게시글 상세 조회
	public BoardVO selectOne(int idx) {
		
		SqlSession sqlSession = factory.openSession();
		BoardVO vo = sqlSession.selectOne("b.board_one", idx);
		sqlSession.close();
		return vo;
	}
	
	//조회수 증가
	public int update_readhit(int idx) {
		SqlSession sqlSession = factory.openSession(true);
		int res = sqlSession.update("b.update_readhit", idx);
		sqlSession.close();
		
		return res;
	}
	
}

















































