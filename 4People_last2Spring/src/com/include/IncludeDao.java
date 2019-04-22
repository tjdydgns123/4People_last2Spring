package com.include;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class IncludeDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate=null;
	Logger logger = Logger.getLogger(IncludeDao.class);
	public List<Map<String, Object>> sideTeamList(Map<String, Object> pMap) {
		logger.info("IncludeDao호출");
		List<Map<String,Object>> sideTeamList = new ArrayList<Map<String,Object>>();
		sideTeamList=sqlSessionTemplate.selectList("sideTeamList",pMap);
		
		
		return sideTeamList;
	}
	public int messageCount(String mem_id) {
		int result = 0;
		logger.info("IncludeDao호출");
		List<Map<String,Object>> mailList = new ArrayList<Map<String,Object>>();
		mailList = sqlSessionTemplate.selectList("messageCount",mem_id);
		result = mailList.size();
		logger.info("result=="+result);
		return result;
	}
	public List<Map<String, Object>> profile(String mem_id) {
		logger.info("IncludeDao호출");
		List<Map<String,Object>> profileList = new ArrayList<Map<String,Object>>();
		profileList=sqlSessionTemplate.selectList("profile",mem_id);
		
		return profileList;
	}
	public int passwordOk(Map<String, Object> pMap) {
		int result = 0;
		String mem_id=sqlSessionTemplate.selectOne("passwordOk",pMap);
		if(mem_id!=null&&mem_id.length()>0) {
			result = 1;
		}
		else {
			result = 0;
		}
		return result;
	}
	public void newPasswordUpd(Map<String, Object> pMap) {
		logger.info("IncludeDao호출");
			sqlSessionTemplate.update("newPasswordUpd",pMap);

	}
	public void profileUpd(Map<String, Object> pMap) {
		logger.info("IncludeDao호출");
		sqlSessionTemplate.update("profileUpd",pMap);
		
	}
	public void memberDelete(String mem_id) {
		logger.info("IncludeDao호출");
		sqlSessionTemplate.delete("memberDelete",mem_id);
		
	}
	public List<Map<String, Object>> sidebarMeet(String mem_id) {
		List<Map<String, Object>> sidebarMeet=sqlSessionTemplate.selectList("sidebarMeet",mem_id);
		return sidebarMeet;
	}

}
