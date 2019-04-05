package com.chatting;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.include.IncludeDao;
import com.util.MyBatisCommonFactory;

@Repository
public class ChatDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate=null;
	Logger logger = Logger.getLogger(ChatDao.class);
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
	public List<Map<String, Object>> privateChatlog(Map<String, Object> pMap) {
		logger.info("ChatDao호출");
		List<Map<String, Object>> privateChatlog = new ArrayList<Map<String,Object>>();
		privateChatlog = sqlSessionTemplate.selectList("privateChatlog",pMap);
		return privateChatlog;
	}
	public void chatLogIns(Map<String, Object> pMap) {
		sqlSessionTemplate.insert("chatLogIns",pMap);
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
	public void teamLogIns(Map<String, Object> pMap) {
		sqlSessionTemplate.insert("teamLogIns",pMap);
	}
	public List<Map<String, Object>> privateSearch(Map<String, Object> pMap) {
		List<Map<String, Object>> privateSearch=sqlSessionTemplate.selectList("privateSearch",pMap);
		return privateSearch;
	}
	public void newPrivateChat(Map<String, Object> pMap) {
		sqlSessionTemplate.insert("newPrivateChat",pMap);
	}

}
