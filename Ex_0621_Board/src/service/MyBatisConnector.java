package service;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisConnector {
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static MyBatisConnector single = null;

	public static MyBatisConnector getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new MyBatisConnector();
		//생성된 객체정보를 반환
		return single;
	}
	
	SqlSessionFactory factory = null;
	
	public MyBatisConnector() {
		
		//sqlMapConfig.xml 파일을 읽어온다
		try {
			Reader reader = Resources.getResourceAsReader(
									"config/mybatis/sqlMapConfig.xml");
			
			//읽어온 sqlMapConfig.xml에서 어떤 DB를 쓸 것인지, mapper로 누구를 쓸 것인지 등을
			//가져오는 클래스
			factory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}//생성자
	
	public SqlSessionFactory getFactory() {
		return factory;
	}
}
