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

}
