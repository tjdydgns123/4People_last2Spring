package com.calendar;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.vo.CalendarVO;

public class CalendarLogic {
	Logger logger = Logger.getLogger(CalendarLogic.class);
	CalendarDao calDao = new CalendarDao();
	public List<Map<String, Object>> calList(CalendarVO calVO) {
		logger.info("캘린더 조회 호출 성공");
		List<Map<String, Object>> calList = null;
		try {
			calList = calDao.calList(calVO);
		} catch (SQLException se) {
			se.getMessage();
		}
		return calList;
	}

	public int calIns(Map<String, Object> pMap) {
		logger.info("캘린더 입력 호출 성공");
		int result = 0;
		result = calDao.calIns(pMap);
		logger.info("result :"+result);
		return result;
	}

	public int calUpd(Map<String, Object> pMap) {
		logger.info("캘린더 수정 호출 성공");
		int result = 0;
		result = calDao.calUpd(pMap);
		return result;
	}

	public int calDel(Map<String, Object> pMap) {
		logger.info("캘린더 삭제 호출 성공");
		int result = 0;
		result = calDao.calDel(pMap);
		return result;
	}

}
