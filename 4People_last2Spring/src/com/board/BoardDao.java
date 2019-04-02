package com.board;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class BoardDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate = null;
	Logger logger = Logger.getLogger(BoardDao.class);
	public void BoardIns(Map<String, Object> pMap) {
		try {
			sqlSessionTemplate.insert("BoardIns", pMap);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
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
	public void BoardUpd(Map<String, Object> pMap) {
		try {
			sqlSessionTemplate.update("BoardUpd", pMap);
			logger.info("성공?");
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
}
