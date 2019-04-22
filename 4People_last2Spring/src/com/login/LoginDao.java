package com.login;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.mapping.ParameterMapping;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate = null;
	Logger logger = Logger.getLogger(LoginDao.class);
	public List<Map<String, Object>> loginCall(Map<String, Object> pMap) {
		logger.info("로그인호출");
		List<Map<String,Object>> loginList = null;
		try {
			loginList = sqlSessionTemplate.selectList("loginCall", pMap);
			
			logger.info("loginList:"+loginList.size());
			for(Map<String,Object> rMap:loginList) {
				for(String key:rMap.keySet()) {
					logger.info(key+" rMap:"+rMap.get(key));
					
				}
			}
			
		} catch (Exception e) {
				e.printStackTrace();
		}
		return loginList;
	}
	public int signUp(Map<String, Object> pMap) {
		int result =0;
		try {
			 result=sqlSessionTemplate.insert("signUp", pMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public String findId(Map<String, Object> pMap) {
		
	   String idresult = sqlSessionTemplate.selectOne("findId",pMap);
		return idresult;
	}
	public String findpw(Map<String, Object> pMap) {
		 String idresult = sqlSessionTemplate.selectOne("findpw",pMap);
		return idresult;
	}
	public List<Map<String, Object>> loginCall2(Map<String, Object> pMap) {
		logger.info("로그인호출");
		List<Map<String,Object>> loginList2 = null;
		try {
			loginList2 = sqlSessionTemplate.selectList("loginCall3", pMap);
			
		} catch (Exception e) {
				e.printStackTrace();
		}
		return loginList2;
	}
	public List<Map<String, Object>> isMemberOk(String accountEmail) {
		List<Map<String,Object>> meberInfo = sqlSessionTemplate.selectList("meberInfo",accountEmail);
		return meberInfo;
	}


}
