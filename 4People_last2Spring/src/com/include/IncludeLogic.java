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

}


