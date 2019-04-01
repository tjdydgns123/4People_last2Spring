package com.note;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class NoteDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate=null;
	Logger logger = Logger.getLogger(NoteDao.class);
	
	public String newNote(Map<String, Object> pMap) {
		String mb_code ="";
		logger.info("NoteDao 호출");
		sqlSessionTemplate.insert("proc_newNote",pMap);
		return mb_code;
	}

	public List<Map<String,Object>> DeleteNote(Map<String, Object> pMap,String mem_id) {
		List<Map<String,Object>> noteList=null;
		logger.info("NoteDao 호출");
		sqlSessionTemplate.delete("DeleteNote",pMap);
		noteList =sqlSessionTemplate.selectList("getNote",mem_id);
		return noteList;
	}

	public List<Map<String, Object>> getNote(String mem_id) {
		List<Map<String,Object>> noteList=null;
		logger.info("NoteDao 호출");
		noteList =sqlSessionTemplate.selectList("getNote",mem_id);
		return noteList;
	}

	public List<Map<String, Object>> getSend(Map<String, Object> pMap) {
		List<Map<String,Object>> sendList=null;
		List<Map<String,Object>> rsendList=new ArrayList<Map<String,Object>>();
		List<Map<String,Object>> teamCodes=null;
		Map<String,Object> teamCode = new HashMap<String,Object>();
		Map<String,Object> sendMap = new HashMap<String,Object>();
		logger.info("NoteDao 호출");
		teamCodes =sqlSessionTemplate.selectList("getTeamCode",pMap);
		for(int i=0; i<teamCodes.size();i++) {
			teamCode = teamCodes.get(i);
			if(pMap.containsKey("TEAM_CODE")) {
				pMap.remove("TEAM_CODE");
			}
			pMap.put("team_code",teamCode.get("TEAM_CODE"));
			sendList = sqlSessionTemplate.selectList("getSend",pMap);
			for(int x=0; x<sendList.size();x++) {
				sendMap = sendList.get(x);
				rsendList.add(sendMap);
			}
		}
		List result = new ArrayList<>(new HashSet<>(rsendList));
		logger.info("result="+result.toString());
		return result;
	}

	public int sendNote(Map<String, Object> pMap) {
		List<Map<String,Object>> noteList=null;
		int result=0;
		result =sqlSessionTemplate.insert("proc_newNote",pMap);
		return result;
	}

	public List<Map<String, Object>> noteMessage(String mem_id) {
		List<Map<String,Object>> noteMessageList=null;
		logger.info("NoteDao 호출");
		noteMessageList =sqlSessionTemplate.selectList("noteMessage",mem_id);
		return noteMessageList;
	}

	public void insertMessage(Map<String, Object> pMap) {
		pMap.remove("command");
		for(Object key:pMap.keySet()) {
			Map<String,Object> hMap = new HashMap<String, Object>();
			hMap.put("mb_code",key);
			sqlSessionTemplate.update("insertMessage",hMap);
		}
	}

	public void deleteMessage(Map<String, Object> pMap) {
		logger.info("NoteDao 호출");
		pMap.remove("command");
		for(Object key:pMap.keySet()) {
			Map<String,Object> hMap = new HashMap<String, Object>();
			hMap.put("mb_code",key);
			sqlSessionTemplate.delete("deleteMessage",hMap);
		}
	}

}
