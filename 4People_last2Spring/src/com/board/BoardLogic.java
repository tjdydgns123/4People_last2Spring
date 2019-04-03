package com.board;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class BoardLogic {
	@Autowired
	BoardDao Bo_dao = null;
	Logger logger =Logger.getLogger(BoardLogic.class);
	public void BoardIns(Map<String,Object> pMap){
		logger.info("logic호출");
		Bo_dao.BoardIns(pMap);
		
	}
	public List<Map<String,Object>> BoardSel(Map<String,Object> pMap){
		List<Map<String,Object>> BoardList =null;
		logger.info("logic호출");
		BoardList=Bo_dao.BoardSel(pMap);
		
		return BoardList;
	}
	public void BoardUpd(Map<String, Object> pMap) {
		logger.info("logic호출");
		Bo_dao.BoardUpd(pMap);
		
	}
	
}
