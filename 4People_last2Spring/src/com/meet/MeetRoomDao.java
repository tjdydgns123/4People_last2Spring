package com.meet;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vo.MeetRoomVO;

@Repository
public class MeetRoomDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate= null;
	
	Logger logger = Logger.getLogger(MeetRoomDao.class);
	
	public void meetRoomIns(Map<String,Object>pMap) {
			 logger.info("Dao호출");
			 logger.info(pMap.size());
			 System.out.println(sqlSessionTemplate);
			sqlSessionTemplate.insert("meetRoomIns", pMap);
			 logger.info(pMap.size());
	}
//	public List<Map<String, Object>> roomList(MeetRoomVO mrVO) throws SQLException {
//		logger.info("roomList 호출 성공");
//		List<Map<String, Object>> roomList = 
//				new ArrayList<Map<String,Object>>();
//			sqlSessionTemplate.selectList("meetRoomList",mrVO); //boardList 
//			 logger.info(mrVO.getMr_no());
//			 logger.info(roomList.size());
//			
//		return null;
//	}

	public List<Map<String, Object>> myMeetingRoom(String mem_id) {
		logger.info("Dao호출");
		List<Map<String, Object>> myMeetingRoomNames = sqlSessionTemplate.selectList("myMeetingRoomNames",mem_id);
		
		return myMeetingRoomNames;
	}

	public List<Map<String, Object>> teamAuthority(Map<String, Object> pMap) {
		logger.info("teamAuthority Dao호출");
		List<Map<String, Object>> teamAuthorityList = sqlSessionTemplate.selectList("teamAuthorityList",pMap);
		return teamAuthorityList;
	}

	public List<Map<String, Object>> meetingRoomInfo(Map<String, Object> pMap) {
		List<Map<String, Object>> meetingRoomInfo =sqlSessionTemplate.selectList("meetingRoomInfo",pMap);
		return meetingRoomInfo;
	}

	public void roomUpd(Map<String, Object> pMap) {
		sqlSessionTemplate.update("roomUpd",pMap);
		
	}

	public List<Map<String, Object>> roomTeamInsert(Map<String, Object> pMap) {
		List<Map<String, Object>> roomTeamInsert =sqlSessionTemplate.selectList("roomTeamInsert",pMap);
		return roomTeamInsert;
	}

	public List<Map<String,Object>> teamAuthorityIns(Map<String, Object> pMap) {
		String mr_no = (String)pMap.get("mr_no");
		pMap.remove("mr_no");
		List<Map<String,Object>> getTeamInfo = new ArrayList<Map<String,Object>>();
		List<Map<String,Object>> resultList = null;
		for(String key:pMap.keySet()) {
			Map<String,Object> tMap = new HashMap<String, Object>();
			tMap.put("mr_no",mr_no);
			tMap.put("team_code",key);
			Map<String,Object> rMap = null;
			resultList=sqlSessionTemplate.selectList("getTeamInfo",tMap);
			rMap = resultList.get(0);
			getTeamInfo.add(rMap);
			sqlSessionTemplate.insert("teamAuthorityIns",tMap);
		}
		return getTeamInfo;
		
	}

	public void teamDelete(Map<String, Object> pMap) {
		sqlSessionTemplate.delete("roomTeamDelete",pMap);
		
	}
	
	public List<Map<String, Object>> roomSearch(Map<String, Object> pMap, String searchDate) {
		List<Map<String, Object>> roomSearch = sqlSessionTemplate.selectList("roomSearch",pMap);
		for(int i=0;i<roomSearch.size();i++) {
			String mr_no = (String)roomSearch.get(i).get("MR_NO");
			Map<String,Object> tMap = new HashMap<String, Object>();
			tMap.put("mr_no",mr_no);
			tMap.put("re_hopedate",searchDate);
			List<Map<String, Object>> timeResult = sqlSessionTemplate.selectList("timeResult",tMap);
			roomSearch.get(i).put("timeResult",timeResult);
		}
		logger.info("+++++++++++++"+roomSearch.toString());
		
		return roomSearch;
	}

	public List<Map<String, Object>> availableTeams(Map<String, Object> pMap) {
		List<Map<String, Object>> availableTeams = sqlSessionTemplate.selectList("availableTeams",pMap);
		return availableTeams;
	}

	public void reservationOk(Map<String, Object> pMap) {
		sqlSessionTemplate.insert("reservationOk",pMap);
		
	}

	public Map<String, Object> myReserVation(String mem_id) {
		List<Map<String, Object>> afterSize = sqlSessionTemplate.selectList("myReserVationAfter",mem_id);
		List<Map<String, Object>> beforeSize = sqlSessionTemplate.selectList("myReserVationBefore",mem_id);
		Map<String, Object> sizes = new HashMap<String,Object>();
			sizes.put("after", afterSize.size());
			sizes.put("before", beforeSize.size());
		return sizes;
	}

	public List<Map<String, Object>> afterDate(String mem_id) {
		List<Map<String, Object>> afterDateList = sqlSessionTemplate.selectList("myReserVationAfter",mem_id);
		
		
		return afterDateList;
	}

	public List<Map<String, Object>> beforeDate(String mem_id) {
		List<Map<String, Object>> beforeDateList = sqlSessionTemplate.selectList("myReserVationBefore",mem_id);
		return beforeDateList;
	}

	public List<Map<String, Object>> hapDate(String mem_id) {
		List<Map<String, Object>> hapDateList = sqlSessionTemplate.selectList("hapDate",mem_id);
		return hapDateList;
	}

	public int reservationCancel(String re_code) {
		int result = sqlSessionTemplate.delete("reservationCancel",re_code);
		return result;
	}
	 public List<Map<String, Object>> reservationCal(MeetRoomVO mrVO) {
	      logger.info("회의실 캘린더 호출 성공");
	      List<Map<String, Object>> reCalList = new ArrayList<Map<String, Object>>();
	      try {
	         reCalList = sqlSessionTemplate.selectList("reCalList", mrVO);
	         logger.info("reCalList :"+reCalList);
	         logger.info(reCalList.size());
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return reCalList;
	   }

	}



	
