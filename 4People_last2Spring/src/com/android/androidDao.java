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
	public List<Map<String, Object>> getPrivate(String mem_id) {
		logger.info("ChatDao호출");
		List<Map<String, Object>> getPrivateResult = new ArrayList<Map<String,Object>>();
		List<Map<String, Object>> getPrivate = new ArrayList<Map<String,Object>>();
		List<Map<String, Object>> getCode = new ArrayList<Map<String,Object>>();
		
		
		getCode = sqlSessionTemplate.selectList("getPrivateCode",mem_id);
		logger.info(getCode.toString());
		
		for(int i=0; i<getCode.size();i++) {
			Map<String,Object> pMap = getCode.get(i);
				getPrivateResult=sqlSessionTemplate.selectList("getPrivate",pMap);
				Map<String,Object> gMap =getPrivateResult.get(0);
				getPrivate.add(gMap);
		}
		logger.info(getPrivate.toString());
		return getPrivate;
	}
	public List<Map<String, Object>> getTeam(String mem_id) {
		List<Map<String, Object>> getTeam=new ArrayList<Map<String,Object>>();
		List<Map<String, Object>> getCode=sqlSessionTemplate.selectList("getTeamCode2",mem_id);
		logger.info(getCode.toString());
		for(int i=0; i<getCode.size();i++) {
			Map<String,Object> tMap = getCode.get(i);
				List<Map<String, Object>> getTeamResult =sqlSessionTemplate.selectList("getTeam",tMap);
				Map<String,Object> gMap =getTeamResult.get(0);
				getTeam.add(gMap);
		}
		logger.info(getTeam.toString());
		return getTeam;
	}
	public List<Map<String, Object>> teamChatlog(Map<String, Object> pMap) {
		List<Map<String, Object>> teamChatlog = sqlSessionTemplate.selectList("teamChatlog",pMap);
		return teamChatlog;
	}
	public List<Map<String, Object>> teamChatMember(Map<String, Object> pMap) {
		List<Map<String, Object>> teamChatMember=sqlSessionTemplate.selectList("teamChatMember",pMap);
		return teamChatMember;
	}
	public List<Map<String, Object>> privateChatlog(Map<String, Object> pMap) {
		List<Map<String, Object>> privateChatlog = new ArrayList<Map<String,Object>>();
		privateChatlog = sqlSessionTemplate.selectList("privateChatlog",pMap);
		return privateChatlog;
	}
	
	
}
