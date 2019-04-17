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
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.board.BoardController;

@Repository
public class BoardListDao {
	Logger logger =  Logger.getLogger(BoardListDao.class);
	@Autowired
	SqlSessionTemplate sqlSessionTemplate = null;
	SqlSessionFactory  sqlMap = null;
	SqlSession session = null;
	public void BdlistIns(Map<String, Object> pMap) {
		try {
			sqlSessionTemplate.insert("BoardListIns", pMap);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public List<Map<String,Object>> BdlistSel(Map<String, Object> pMap) {
		List<Map<String,Object>> b_boardList = new ArrayList<Map<String,Object>>();
		try {
			sqlSessionTemplate.selectList("BoardListSel", pMap);
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
			sqlSessionTemplate.insert("CardIns", pMap);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void team_memberINS(Map<String, Object> pMap) {
		try {
			sqlSessionTemplate.insert("team_memberINS", pMap);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public List<Map<String, Object>> historySel(Map<String, Object> pMap) {
		List<Map<String, Object>> historyList = new ArrayList<Map<String,Object>>();
		try {
			sqlSessionTemplate.selectList("historySel",pMap);
			historyList.add(pMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return historyList;
	}
}
