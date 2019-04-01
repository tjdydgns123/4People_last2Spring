package com.chatting;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

import com.include.IncludeDao;
import com.util.MyBatisCommonFactory;

public class ChatDao {
	SqlSessionFactory SqlSessionFactory=null;
	SqlSession session = null;
	Logger logger = Logger.getLogger(ChatDao.class);
	public List<Map<String, Object>> getPrivate(String mem_id) {
		logger.info("ChatDao호출");
		SqlSessionFactory = MyBatisCommonFactory.getSqlSessionFactory();
		List<Map<String, Object>> getPrivateResult = new ArrayList<Map<String,Object>>();
		List<Map<String, Object>> getPrivate = new ArrayList<Map<String,Object>>();
		List<Map<String, Object>> getCode = new ArrayList<Map<String,Object>>();
		
		session = SqlSessionFactory.openSession();
		
		getCode = session.selectList("getPrivateCode",mem_id);
		logger.info(getCode.toString());
		
		for(int i=0; i<getCode.size();i++) {
			Map<String,Object> pMap = getCode.get(i);
				Map<String,Object> rMap = new HashMap<String, Object>();
				getPrivateResult=session.selectList("getPrivate",pMap);
				Map<String,Object> gMap =getPrivateResult.get(0);
				getPrivate.add(gMap);
		}
		logger.info(getPrivate.toString());
		
		return getPrivate;
	}
	public List<Map<String, Object>> privateChatlog(Map<String, Object> pMap) {
		logger.info("ChatDao호출");
		List<Map<String, Object>> privateChatlog = new ArrayList<Map<String,Object>>();
		SqlSessionFactory = MyBatisCommonFactory.getSqlSessionFactory();
		session =SqlSessionFactory.openSession();
		privateChatlog = session.selectList("privateChatlog",pMap);
		
		return privateChatlog;
	}

}
