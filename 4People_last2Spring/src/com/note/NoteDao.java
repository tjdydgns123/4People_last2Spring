package com.note;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;


public class NoteDao {
	
	
	SqlSessionFactory  sqlMap = null;
	SqlSession session = null;
	Logger logger = Logger.getLogger(NoteDao.class);
	
	public String newNote(Map<String, Object> pMap) {
		String resource = "com/mybatis/Configuration.xml";
		Reader reader =null;
		String mb_code ="";
		logger.info("NoteDao 호출");
		try {
			reader = Resources.getResourceAsReader(resource);
			sqlMap = new SqlSessionFactoryBuilder().build(reader);
			session = sqlMap.openSession();
			session.insert("proc_newNote",pMap);
			for(Object key:pMap.keySet()) {
				if(key.equals("mb_code")) {
					mb_code = (String)pMap.get(key);
					logger.info("mb_code="+mb_code);
				}
			}
			session.commit();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		
		
		
		return mb_code;
	}

	public List<Map<String,Object>> DeleteNote(Map<String, Object> pMap,String mem_id) {
		String resource = "com/mybatis/Configuration.xml";
		Reader reader =null;
		List<Map<String,Object>> noteList=null;
		logger.info("NoteDao 호출");
		try {
			reader = Resources.getResourceAsReader(resource);
			sqlMap = new SqlSessionFactoryBuilder().build(reader);
			session = sqlMap.openSession();
			session.delete("DeleteNote",pMap);
			session.commit();
			noteList =session.selectList("getNote",mem_id);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return noteList;
	}

	public List<Map<String, Object>> getNote(String mem_id) {
		String resource = "com/mybatis/Configuration.xml";
		Reader reader =null;
		List<Map<String,Object>> noteList=null;
		logger.info("NoteDao 호출");
		try {
			reader = Resources.getResourceAsReader(resource);
			sqlMap = new SqlSessionFactoryBuilder().build(reader);
			session = sqlMap.openSession();
			noteList =session.selectList("getNote",mem_id);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return noteList;
	}

	public List<Map<String, Object>> getSend(Map<String, Object> pMap) {
		String resource = "com/mybatis/Configuration.xml";
		Reader reader =null;
		List<Map<String,Object>> sendList=null;
		List<Map<String,Object>> rsendList=new ArrayList<Map<String,Object>>();
		List<Map<String,Object>> teamCodes=null;
		Map<String,Object> teamCode = new HashMap<String,Object>();
		Map<String,Object> sendMap = new HashMap<String,Object>();
		logger.info("NoteDao 호출");
		try {
			reader = Resources.getResourceAsReader(resource);
			sqlMap = new SqlSessionFactoryBuilder().build(reader);
			session = sqlMap.openSession();
			teamCodes =session.selectList("getTeamCode",pMap);
			for(int i=0; i<teamCodes.size();i++) {
				teamCode = teamCodes.get(i);
				if(pMap.containsKey("TEAM_CODE")) {
					pMap.remove("TEAM_CODE");
				}
				pMap.put("team_code",teamCode.get("TEAM_CODE"));
				sendList = session.selectList("getSend",pMap);
				for(Object key:pMap.keySet()) {
					logger.info("key=="+key+"  pMap=="+pMap.get(key));
				}
				for(int x=0; x<sendList.size();x++) {
					sendMap = sendList.get(x);
					rsendList.add(sendMap);
					logger.info("sendMap="+sendMap.toString());
				}
				logger.info("teamCode="+teamCode.toString());
			}
//			logger.info("rsendList="+rsendList.toString());

		} catch (IOException e) {
			e.printStackTrace();
		}
		List result = new ArrayList<>(new HashSet<>(rsendList));
		logger.info("result="+result.toString());
		return result;
	}

	public int sendNote(Map<String, Object> pMap) {
		String resource = "com/mybatis/Configuration.xml";
		Reader reader =null;
		List<Map<String,Object>> noteList=null;
		logger.info("NoteDao 호출");
		int result=0;
		try {
			reader = Resources.getResourceAsReader(resource);
			sqlMap = new SqlSessionFactoryBuilder().build(reader);
			session = sqlMap.openSession();
			result =session.insert("proc_newNote",pMap);
			session.commit();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
		
	}

	public List<Map<String, Object>> noteMessage(String mem_id) {
		String resource = "com/mybatis/Configuration.xml";
		Reader reader =null;
		List<Map<String,Object>> noteMessageList=null;
		logger.info("NoteDao 호출");
		try {
			reader = Resources.getResourceAsReader(resource);
			sqlMap = new SqlSessionFactoryBuilder().build(reader);
			session = sqlMap.openSession();
			noteMessageList =session.selectList("noteMessage",mem_id);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return noteMessageList;
	}

	public void insertMessage(Map<String, Object> pMap) {
		
		String resource = "com/mybatis/Configuration.xml";
		Reader reader =null;
		logger.info("NoteDao 호출");
		try {
			reader = Resources.getResourceAsReader(resource);
			sqlMap = new SqlSessionFactoryBuilder().build(reader);
			session = sqlMap.openSession();
			pMap.remove("command");
			for(Object key:pMap.keySet()) {
				Map<String,Object> hMap = new HashMap<String, Object>();
				hMap.put("mb_code",key);
				session.update("insertMessage",hMap);
				session.commit();
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		
		
		
	}

	public void deleteMessage(Map<String, Object> pMap) {
		String resource = "com/mybatis/Configuration.xml";
		Reader reader =null;
		logger.info("NoteDao 호출");
		try {
			reader = Resources.getResourceAsReader(resource);
			sqlMap = new SqlSessionFactoryBuilder().build(reader);
			session = sqlMap.openSession();
			pMap.remove("command");
			for(Object key:pMap.keySet()) {
				Map<String,Object> hMap = new HashMap<String, Object>();
				hMap.put("mb_code",key);
				session.delete("deleteMessage",hMap);
				session.commit();
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
