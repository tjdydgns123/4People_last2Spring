package com.include;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.util.MyBatisCommonFactory;

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

}
