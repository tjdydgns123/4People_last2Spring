package com.boardlist;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.BoardDao;
import com.board.BoardLogic;
import com.sun.xml.internal.ws.developer.Serialization;
@Service
public class BoardListLogic {
	Logger logger =Logger.getLogger(BoardLogic.class);
	@Autowired
	BoardListDao Bdlist_dao = null;
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
	public List<Map<String, Object>> team_memberINS(Map<String, Object> pMap) {
		List<Map<String,Object>> b_boardList = null;
		Bdlist_dao.team_memberINS(pMap);
		b_boardList = Bdlist_dao.BdlistSel(pMap);
		return b_boardList;
	}
	public List<Map<String, Object>> historySel(Map<String, Object> pMap) {
		List<Map<String,Object>> HistoryList = null;
		HistoryList = Bdlist_dao.historySel(pMap);
		return HistoryList;
	}

}
