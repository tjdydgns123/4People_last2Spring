package com.meetRoom;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;



import com.vo.MeetRoomVO;

public class MeetRoomLogic {
	MeetRoomDao mtRoom_dao = new MeetRoomDao();
	Logger logger =Logger.getLogger(MeetRoomLogic.class);
	public int meetRoomIns(Map<String,Object> pMap){
		int result = 0;
		logger.info("logic호출");
		try {
			
			result=mtRoom_dao.meetRoomIns(pMap);
		} catch (SQLException se) {
			se.getMessage();
		}
		return result;
	}
	
	public List<Map<String, Object>> roomList(MeetRoomVO mrVO) {
		List<Map<String, Object>> roomList = null;
		try {
			logger.info("roomList  호출");
			roomList= mtRoom_dao.roomList(mrVO);
		} catch (SQLException se) {
			se.getMessage();
		}
		return roomList;

	}
}
