package com.meet;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
		String resource = "com/mybatis/Configuration.xml";
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

	public void teamAuthorityIns(Map<String, Object> pMap, String mem_id) {
		for(String key:pMap.keySet()) {
			Map<String,Object> tMap = new HashMap<String, Object>();
			tMap.put("mem_id",mem_id);
			tMap.put("team_code",key);
			sqlSessionTemplate.insert("teamAuthorityIns",tMap);
		}
		
	}



	
}
