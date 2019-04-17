package com.meet;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vo.MeetRoomVO;

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
	public List<Map<String, Object>> roomSearch(Map<String, Object> pMap, String searchDate) {
		List<Map<String, Object>> roomSearch = mtRoom_dao.roomSearch(pMap,searchDate);
		return roomSearch;
	}
	public List<Map<String, Object>> availableTeams(Map<String, Object> pMap) {
		List<Map<String, Object>> availableTeams = mtRoom_dao.availableTeams(pMap);
		return availableTeams;
	}
	public void reservationOk(Map<String, Object> pMap) {
		mtRoom_dao.reservationOk(pMap);
		
	}
	public Map<String, Object> myReserVation(String mem_id) {
		Map<String, Object> myReserVationList = mtRoom_dao.myReserVation(mem_id);
		
		return myReserVationList;
	}
	public List<Map<String, Object>> afterDate(String mem_id) {
		List<Map<String, Object>> afterDate = mtRoom_dao.afterDate(mem_id);
		return afterDate;
	}
	public List<Map<String, Object>> beforeDate(String mem_id) {
		List<Map<String, Object>> beforeDate = mtRoom_dao.beforeDate(mem_id);
		return beforeDate;
	}
	public List<Map<String, Object>> hapDate(String mem_id) {
		List<Map<String, Object>> hapDate = mtRoom_dao.hapDate(mem_id);
		return hapDate;
	}
	public int reservationCancel(String re_code) {
		int reuslt = mtRoom_dao.reservationCancel(re_code);
		return reuslt;
	}
	  public List<Map<String, Object>> reservationCal(MeetRoomVO mrVO) {
	      logger.info("회의실 캘린더 호출 성공");
	      List<Map<String, Object>> reCalList = null;
	      reCalList = mtRoom_dao.reservationCal(mrVO);
	      logger.info("reCalList :"+reCalList);
	      return reCalList;
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
