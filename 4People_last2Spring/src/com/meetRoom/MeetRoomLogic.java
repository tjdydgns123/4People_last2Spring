package com.meetRoom;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.vo.MeetRoomVO;

@Service
public class MeetRoomLogic {
	MeetRoomDao mtRoom_dao = new MeetRoomDao();
	Logger logger =Logger.getLogger(MeetRoomLogic.class);
	public void meetRoomIns(Map<String,Object> pMap){
		logger.info("logic호출");
		try {
			
			mtRoom_dao.meetRoomIns(pMap);
		} catch (SQLException se) {
			se.getMessage();
		}
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
