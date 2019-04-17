package com.android;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class androidDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate = null;
	Logger logger = Logger.getLogger(androidDao.class);
	
	
	public List<Map<String, Object>> loginCall(Map<String, Object> pMap) {
		
		List<Map<String,Object>> loginList = null;
		loginList = sqlSessionTemplate.selectList("andlogin", pMap);
			
		logger.info("loginList:"+loginList.size());
		logger.info(loginList.get(0).keySet());
		
		return loginList;
	
	}

	public List<Map<String, Object>> BoardSel(Map<String, Object> pMap) {
		
		List<Map<String,Object>> BoardList = new ArrayList<Map<String,Object>>();
		
		try {
			sqlSessionTemplate.selectList("BoardSel", pMap);
			 BoardList.add(pMap);
		} catch (Exception e) {
				e.printStackTrace();
		}
		return BoardList;
	}

	public List<Map<String, Object>> BoardListsel(Map<String, Object> pMap) {
		
		List<Map<String,Object>> b_boardList = new ArrayList<Map<String,Object>>();
		try {
			logger.info(pMap.get("board_no"));
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
}
