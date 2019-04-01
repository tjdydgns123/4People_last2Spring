package com.note;


import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class NoteLogic {
	Logger logger =Logger.getLogger(NoteLogic.class);
	@Autowired
	NoteDao n_Dao = null;
	
	public String newNote(Map<String, Object> pMap) {
		String mb_code = "";
		logger.info("NoteLogic 호출");
		mb_code = n_Dao.newNote(pMap);
		return mb_code;
	}

	public List<Map<String,Object>> DeleteNote(Map<String, Object> pMap,String mem_id) {
		logger.info("NoteLogic 호출");
		List<Map<String,Object>> noteList =n_Dao.DeleteNote(pMap,mem_id);
		return noteList;
	}
	public List<Map<String, Object>> getNote(String mem_id) {
		logger.info("NoteLogic 호출");
		List<Map<String,Object>> noteList=n_Dao.getNote(mem_id);
		return noteList;
	}

	public List<Map<String, Object>> getSend(Map<String, Object> pMap) {
		logger.info("NoteLogic 호출");
		List<Map<String,Object>> sendList=n_Dao.getSend(pMap);
		return sendList;
	}

	public int sendNote(Map<String, Object> pMap) {
		logger.info("NoteLogic 호출");
		int result =n_Dao.sendNote(pMap);
		return result;
	}

	public List<Map<String, Object>> noteMessage(String mem_id) {
		logger.info("NoteLogic 호출");
		List<Map<String,Object>> noteMessageList=n_Dao.noteMessage(mem_id);
		return noteMessageList;
	}

	public void insertMessage(Map<String, Object> pMap) {
		logger.info("NoteLogic 호출");
		n_Dao.insertMessage(pMap);

	}

	public void deleteMessage(Map<String, Object> pMap) {
		logger.info("NoteLogic 호출");
		n_Dao.deleteMessage(pMap);	
		
	}

}
