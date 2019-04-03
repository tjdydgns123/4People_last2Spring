package com.chatting;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChatLogic {
	Logger logger= Logger.getLogger(ChatLogic.class);
	@Autowired
	ChatDao c_Dao = null;
	public List<Map<String, Object>> getPrivate(String mem_id) {
		logger.info("ChatLogic호출");
		List<Map<String, Object>> getPrivate = c_Dao.getPrivate(mem_id);
		
		
		return getPrivate;
	}
	public List<Map<String, Object>> privateChatlog(Map<String, Object> pMap) {
		logger.info("ChatLogic호출");
		List<Map<String,Object>> privateChatlog = c_Dao.privateChatlog(pMap);
		
		return privateChatlog;
	}
	public void chatLogIns(Map<String, Object> pMap) {
		logger.info("ChatLogic호출");
		c_Dao.chatLogIns(pMap);
		
	}
	public List<Map<String, Object>> getTeam(String mem_id) {
		logger.info("ChatLogic호출");
		List<Map<String, Object>> getTeam = c_Dao.getTeam(mem_id);
		return getTeam;
	}
	public List<Map<String, Object>> teamChatlog(Map<String, Object> pMap) {
		logger.info("ChatLogic호출");
		List<Map<String, Object>> teamChatlog = c_Dao.teamChatlog(pMap);
		return teamChatlog;
	}
	public List<Map<String, Object>> teamChatMember(Map<String, Object> pMap) {
		logger.info("ChatLogic호출");
		List<Map<String, Object>> teamChatMember = c_Dao.teamChatMember(pMap);
		return teamChatMember;
	}
	public void teamLogIns(Map<String, Object> pMap) {
		logger.info("ChatLogic호출");
		c_Dao.teamLogIns(pMap);
		
	}
	public List<Map<String, Object>> privateSearch(Map<String, Object> pMap) {
		logger.info("ChatLogic호출");
		List<Map<String, Object>> privateSearch = c_Dao.privateSearch(pMap);
		return privateSearch;
	}
	public void newPrivateChat(Map<String, Object> pMap) {
		logger.info("ChatLogic호출");
		c_Dao.newPrivateChat(pMap);
		
	}

}
