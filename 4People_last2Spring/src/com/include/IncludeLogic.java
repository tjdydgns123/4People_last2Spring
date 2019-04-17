package com.include;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IncludeLogic {
	@Autowired
	IncludeDao i_Dao = null;
	Logger logger = Logger.getLogger(IncludeLogic.class);
	public List<Map<String, Object>> sideTeamList(Map<String, Object> pMap) {
		logger.info("IncludeLogic호출");
		List<Map<String, Object>> sideTeamList = i_Dao.sideTeamList(pMap);
		return sideTeamList;
	}
	public int messageCount(String mem_id) {
		logger.info("IncludeLogic호출");
		int result = i_Dao.messageCount(mem_id);
		return result;
	}
	public List<Map<String, Object>> profile(String mem_id) {
		logger.info("IncludeLogic호출");
		List<Map<String, Object>> profileList = i_Dao.profile(mem_id);
		return profileList;
	}
	public int passwordOk(Map<String, Object> pMap) {
		logger.info("IncludeLogic호출");
		int result = i_Dao.passwordOk(pMap);
		return result;
	}
	public void newPasswordUpd(Map<String, Object> pMap) {
		logger.info("IncludeLogic호출");
		i_Dao.newPasswordUpd(pMap);
		
	}
	public void profileUpd(Map<String, Object> pMap) {
		logger.info("IncludeLogic호출");
		i_Dao.profileUpd(pMap);
		
	}
	public void memberDelete(String mem_id) {
		logger.info("IncludeLogic호출");
		i_Dao.memberDelete(mem_id);
		
	}
	public List<Map<String, Object>> sidebarMeet(String mem_id) {
		
		List<Map<String, Object>> sidebarMeet = i_Dao.sidebarMeet(mem_id);
		return sidebarMeet;
	}

}


