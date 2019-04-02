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
				Map<String,Object> rMap = new HashMap<String, Object>();
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

}
