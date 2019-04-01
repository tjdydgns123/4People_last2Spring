package com.board;

import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class BoardDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate = null;
	Logger logger = Logger.getLogger(BoardDao.class);
//	public void BoardIns(Map<String, Object> pMap) {
//		try {
//			String resource = "com/mybatis/Configuration.xml";
//			Reader reader =null;
//			reader = Resources.getResourceAsReader(resource);
//			sqlMap = new SqlSessionFactoryBuilder().build(reader);
//			session = sqlMap.openSession(); 
//			session.insert("BoardIns", pMap);
//			session.commit();
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
	public List<Map<String,Object>> BoardSel(Map<String, Object> pMap) {
		
		List<Map<String,Object>> BoardList = new ArrayList<Map<String,Object>>();
		try {
			sqlSessionTemplate.selectList("BoardSel", pMap);
			 BoardList.add(pMap);
		} catch (Exception e) {
				e.printStackTrace();
		}
		return BoardList;
	}
//	public void BoardUpd(Map<String, Object> pMap) {
//		try {
//			String resource = "com/mybatis/Configuration.xml";
//			Reader reader =null;
//			reader = Resources.getResourceAsReader(resource);
//			sqlMap = new SqlSessionFactoryBuilder().build(reader);
//			session = sqlMap.openSession(); 
//			session.update("BoardUpd", pMap);
//			logger.info("성공?");
//			session.commit();
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}		
	}

