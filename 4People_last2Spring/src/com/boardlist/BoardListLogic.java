package com.boardlist;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.board.BoardDao;
import com.board.BoardLogic;

public class BoardListLogic {
	Logger logger =Logger.getLogger(BoardLogic.class);
	BoardListDao Bdlist_dao = new BoardListDao();
	public void BdlistIns(Map<String, Object> pMap) {
		Bdlist_dao.BdlistIns(pMap);
	}
	public List<Map<String,Object>> BdlistSel(Map<String, Object> pMap) {
		logger.info("logic호출");
		List<Map<String,Object>> b_boardList = null;
		b_boardList = Bdlist_dao.BdlistSel(pMap);
		
		return b_boardList;
	}
	public void cardIns(Map<String, Object> pMap) {
		Bdlist_dao.cardIns(pMap);
	}

}
