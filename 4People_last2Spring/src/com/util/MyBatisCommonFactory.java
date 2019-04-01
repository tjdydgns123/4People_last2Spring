package com.util;

import java.io.FileNotFoundException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
/* 스프링방식을 흉내내기위해 만든 클래스!
 * 자바와 MyBatis를 연계하기 위해서는 두 가지 클래스가 필요함.
 * 하나. Connection을 맺는데 필요한 클래스 지원 - mybatis.jar 필요함.
 * 		SqlSessionFactory
 * 둘. 위에서 연결된 통로를 통해 DML구문을 자바 대신 요청해 줄 클래스 
 * 		SqlSession
 * 여기 공통 코드에서는 SqlSessionFactory 객체를 생성해주지만 SqlSession은 생성하면 안됨.
 * 왜냐하면 업무별로 요청되는 DML구문이 다르기 때문임
 * 
 * 클래스명 : com.util.MyBatisCommonFactory
 * 메소드 구현 : 초기화 처리(init()), 객체반환(getSqlSessionFactory())
 * 주의 : 두 메소드 중 초기화 먼저 객체 반환은 나중에.....순서 지킬 것
 */
public class MyBatisCommonFactory {
	private static SqlSessionFactory sqlSessionFactory = null;

	private static void init() {
		try {
			String resource = "com/mybatis/Configuration.xml";
			Reader reader = Resources.getResourceAsReader(resource);
			if(sqlSessionFactory==null) {
				sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);//DB커넥션 정보가 써있는 xml파일을 읽어옴(xml문서에있는 <environments>값을 뒤에 추가가능, 여러가지 DB커넥션 정보를 xml문서에 담을 수 있음)
			}
			
		} catch (FileNotFoundException ffe) {
			ffe.getMessage();
		} catch (Exception e) {
			e.getMessage();
		}
	}
	public static SqlSessionFactory getSqlSessionFactory() {
		init();
		return sqlSessionFactory;
	}

}
