package com.chatting;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

public class ChatLogic {
	Logger logger= Logger.getLogger(ChatLogic.class);
	ChatDao c_Dao = new ChatDao();
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

}
