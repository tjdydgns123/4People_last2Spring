package com.calendar;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vo.CalendarVO;

@Service
public class CalendarLogic {
	Logger logger = Logger.getLogger(CalendarLogic.class);
	@Autowired
	CalendarDao calDao = null;
	
	public List<Map<String, Object>> calList(CalendarVO calVO) {
		logger.info("캘린더 조회 호출 성공");
		List<Map<String, Object>> calList = null;
		calList = calDao.calList(calVO);
		logger.info("calList :"+calList);
		return calList;
	}
	public int calINS(CalendarVO calVO) {
		logger.info("캘린더 입력 호출 성공");
		int result = 0;
		result = calDao.calINS(calVO);
		logger.info("result :"+result);
		return result;
	}
	public int calUPD(CalendarVO calVO) {
		logger.info("캘린더 수정 호출 성공");
		int result = 0;
		result = calDao.calUPD(calVO);
		logger.info("result :"+result);
		return result;
	}
	public int calDEL(CalendarVO calVO) {
		logger.info("캘린더 삭제 호출 성공");
		int result = 0;
		result = calDao.calDEL(calVO);
		logger.info("result :"+result);
		return result;
	}
	public List<Map<String, Object>> calTeamList(CalendarVO calVO) {
		logger.info("캘린더 팀 일정 조회 호출 성공");
		List<Map<String, Object>> calTeamList = null;
		calTeamList = calDao.calTeamList(calVO);
		logger.info("calTeamList :"+calTeamList);
		return calTeamList;
	}
	public List<Map<String, Object>> calTeamCount(CalendarVO calVO){
		logger.info("캘린더 팀 수 조회 호출 성공");
		List<Map<String, Object>> calTeamCount = null;
		calTeamCount = calDao.calTeamCount(calVO);
		logger.info("calTeamCount :"+calTeamCount);
		return calTeamCount;
	}


}
