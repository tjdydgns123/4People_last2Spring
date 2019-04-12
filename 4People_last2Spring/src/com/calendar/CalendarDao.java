package com.calendar;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.sql.SQLException;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.util.MyBatisCommonFactory;
import com.vo.CalendarVO;

//@Repository
@Service
public class CalendarDao {
	Logger logger = Logger.getLogger(CalendarDao.class);
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate = null;
	//캘린더 조회
	public List<Map<String, Object>> calList(CalendarVO calVO){
		logger.info("캘린더 조회 호출 성공");
		List<Map<String, Object>> calList = new ArrayList<Map<String, Object>>();
		
		try {
			calList = sqlSessionTemplate.selectList("calList", calVO);
			logger.info("calList :"+calList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return calList;
	}
	//캘린더 입력
	public int calINS(CalendarVO calVO) throws DataAccessException {
		logger.info("캘린더 입력 호출 성공");
		int result = 0;
		result = sqlSessionTemplate.insert("calIns", calVO);
		logger.info("result :"+result);
		return result;
	}
	//캘린더 수정
	public int calUPD(CalendarVO calVO) {
		logger.info("캘린더 수정 호출 성공");
		int result = 0;
		result = sqlSessionTemplate.insert("calUpd",calVO);
		return result;
	}
	//캘린더 삭제
	public int calDEL(CalendarVO calVO) {
		logger.info("캘린더 삭제 호출 성공");
		int result = 0;
		result = sqlSessionTemplate.insert("calDel", calVO);
		logger.info("result :"+result);
		return result;
	}
	//캘린더 팀 일정 조회
	public List<Map<String, Object>> calTeamList(CalendarVO calVO){
		logger.info("캘린더 팀 일정 조회 호출 성공");
		List<Map<String, Object>> calTeamList = new ArrayList<Map<String, Object>>();
		try {
			calTeamList = sqlSessionTemplate.selectList("calTeam", calVO);

			logger.info("calTeamList :"+calTeamList);
			logger.info(calTeamList.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return calTeamList;
	}
	public List<Map<String, Object>> calTeamCount(CalendarVO calVO) {
		logger.info("캘린더 팀 수 조회 호출 성공");
		List<Map<String, Object>> calTeamCount = new ArrayList<Map<String, Object>>();
		try {
			calTeamCount = sqlSessionTemplate.selectList("calTeamCount", calVO);
			logger.info("calTeamCount :"+calTeamCount);
			logger.info(calTeamCount.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return calTeamCount;
	}
}
