package com.boardlist;

import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;

import com.board.BoardController;

public class BoardListDao {
	Logger logger =  Logger.getLogger(BoardListDao.class);
	SqlSessionFactory  sqlMap = null;
	SqlSession session = null;
	public void BdlistIns(Map<String, Object> pMap) {
		try {
			String resource = "com/mybatis/Configuration.xml";
			Reader reader =null;
			reader = Resources.getResourceAsReader(resource);
			sqlMap = new SqlSessionFactoryBuilder().build(reader);
			session = sqlMap.openSession(); 
			session.insert("BoardListIns", pMap);
			session.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public List<Map<String,Object>> BdlistSel(Map<String, Object> pMap) {
		List<Map<String,Object>> b_boardList = new ArrayList<Map<String,Object>>();
		try {
			String resource = "com/mybatis/Configuration.xml";
			Reader reader =null;
			reader = Resources.getResourceAsReader(resource);
			sqlMap = new SqlSessionFactoryBuilder().build(reader);
			session = sqlMap.openSession(); 
			session.selectList("BoardListSel", pMap);
			b_boardList.add(pMap);
			logger.info(b_boardList.size());
			logger.info(b_boardList.get(0).get("r_team_code"));
			logger.info("b_boardList"+b_boardList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return b_boardList;
	}
	public void cardIns(Map<String, Object> pMap) {
		try {
			String resource = "com/mybatis/Configuration.xml";
			Reader reader =null;
			reader = Resources.getResourceAsReader(resource);
			sqlMap = new SqlSessionFactoryBuilder().build(reader);
			session = sqlMap.openSession(); 
			session.insert("CardIns", pMap);
			session.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
