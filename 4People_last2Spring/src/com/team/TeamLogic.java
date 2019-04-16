package com.team;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TeamLogic {
	@Autowired
	TeamDao t_dao = null;
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
	public List<Map<String, Object>> getMember2(Map<String, Object> pMap) {
		logger.info("TeamLogic호출");
		List<Map<String, Object>> memberList = t_dao.getMember2(pMap);
		return memberList;
	}
	public List<Map<String, Object>> getMember3(Map<String, Object> pMap) {
		logger.info("TeamLogic호출");
		List<Map<String, Object>> memberList = t_dao.getMember3(pMap);
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
	public String newTeam(Map<String, Object> pMap) {
		logger.info("TeamLogic호출");
		String team_code=t_dao.newTeam(pMap);
		return team_code;
	}
	public void teamOut(Map<String, Object> pMap) {
		logger.info("teamOut호출");
		t_dao.teamOut(pMap);
	}

}
