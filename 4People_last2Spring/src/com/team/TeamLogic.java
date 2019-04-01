package com.team;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

public class TeamLogic {
	TeamDao t_dao = new TeamDao();
	Logger logger =Logger.getLogger(TeamLogic.class);
	//board가져오기
	public List<Map<String, Object>> getBoards(Map<String, Object> pMap) {
		logger.info("TeamLogic호출");
		List<Map<String, Object>> boardList = t_dao.getBoard(pMap);
		
		return boardList;
	}
	//프로젝트에 참여중인 회원정보가져오기
	public List<Map<String, Object>> getMember(Map<String, Object> pMap) {
		logger.info("TeamLogic호출");
		List<Map<String, Object>> memberList = t_dao.getMember(pMap);
		return memberList;
	}
	//초대를 위해 검색햇을떄.
	public Map<String, Object> getInvite(Map<String, Object> pMap) {
		logger.info("TeamLogic호출");
		Map<String, Object> rMap = t_dao.getInvite(pMap);
		return rMap;
	}
	//초대버튼눌럿을떄
	public void inviteMember(Map<String, Object> pMap) {
		logger.info("TeamLogic호출");
		t_dao.inviteMember(pMap);
	}

}
