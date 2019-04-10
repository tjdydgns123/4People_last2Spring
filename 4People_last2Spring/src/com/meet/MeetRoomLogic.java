package com.meet;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MeetRoomLogic {
	@Autowired
	MeetRoomDao mtRoom_dao = null;
	Logger logger =Logger.getLogger(MeetRoomLogic.class);
	public void meetRoomIns(Map<String,Object> pMap){
		logger.info("logic호출");
		mtRoom_dao.meetRoomIns(pMap);
	}
	public List<Map<String, Object>> myMeetingRoom(String mem_id) {
		logger.info("logic호출");
		List<Map<String, Object>> myMeetingRoomNames = mtRoom_dao.myMeetingRoom(mem_id);
		return myMeetingRoomNames;
	}
	public List<Map<String, Object>> meetingRoomInfo(Map<String, Object> pMap) {
		List<Map<String, Object>> meetingRoomInfo =mtRoom_dao.meetingRoomInfo(pMap);
		return meetingRoomInfo;
	}
	public List<Map<String, Object>> teamAuthority(Map<String, Object> pMap) {
		List<Map<String, Object>> teamAuthority =mtRoom_dao.teamAuthority(pMap);
		return teamAuthority;
	}
	public void roomUpd(Map<String, Object> pMap) {
		
		mtRoom_dao.roomUpd(pMap);
	}
	public List<Map<String, Object>> roomTeamInsert(Map<String, Object> pMap) {
		List<Map<String, Object>> roomTeamInsert = mtRoom_dao.roomTeamInsert(pMap);
		return roomTeamInsert;
	}
	public List<Map<String, Object>> teamAuthorityIns(Map<String, Object> pMap) {
		List<Map<String, Object>> getTeamInfo= mtRoom_dao.teamAuthorityIns(pMap);
		
		 return getTeamInfo;
	}
	public void teamDelete(Map<String, Object> pMap) {
		mtRoom_dao.teamDelete(pMap);
		
	}
	
	
//	public List<Map<String, Object>> roomList(MeetRoomVO mrVO) {
//		List<Map<String, Object>> roomList = null;
//		try {
//			logger.info("roomList  호출");
//			roomList= mtRoom_dao.roomList(mrVO);
//		} catch (SQLException se) {
//			se.getMessage();
//		}
//		return roomList;
//
//	}
}
