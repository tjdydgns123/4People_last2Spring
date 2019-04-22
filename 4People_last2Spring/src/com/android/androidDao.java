package com.android;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class androidDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate = null;
	Logger logger = Logger.getLogger(androidDao.class);
	
	
	public List<Map<String, Object>> loginCall(Map<String, Object> pMap) {
		
		List<Map<String,Object>> loginList = null;
		loginList = sqlSessionTemplate.selectList("andlogin", pMap);
			
		logger.info("loginList:"+loginList.size());
		logger.info(loginList.get(0).keySet());
		
		return loginList;
	
	}

	public List<Map<String, Object>> BoardSel(Map<String, Object> pMap) {
		
		List<Map<String,Object>> BoardList = new ArrayList<Map<String,Object>>();
		
		try {
			sqlSessionTemplate.selectList("BoardSel", pMap);
			 BoardList.add(pMap);
			 
		} catch (Exception e) {
				e.printStackTrace();
		}
		return BoardList;
	}
	
	
	

	public List<Map<String, Object>> BoardListsel(Map<String, Object> pMap) {
		
		List<Map<String,Object>> b_boardList = new ArrayList<Map<String,Object>>();
		try {
			sqlSessionTemplate.selectList("BoardListSel", pMap);
			b_boardList.add(pMap);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return b_boardList;
	}
	
	
	

	public List<Map<String, Object>> cardSEL(Map<String, Object> pMap) {
		List<Map<String,Object>> cardList = new ArrayList<Map<String,Object>>();
		sqlSessionTemplate.selectList("cardSEL_and",pMap);
		logger.info(pMap);
		cardList.add(pMap);
		
		return cardList;
	}
	
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
}



