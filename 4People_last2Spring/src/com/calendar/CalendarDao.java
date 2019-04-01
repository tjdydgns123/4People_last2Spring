package com.calendar;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.sql.SQLException;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;
import com.util.MyBatisCommonFactory;
import com.vo.CalendarVO;


public class CalendarDao {
	Logger logger = Logger.getLogger(CalendarDao.class);
	private SqlSessionFactory sqlSessionFactory = null;
	private SqlSession sqlSession = null;
	public CalendarDao() {
		sqlSessionFactory = MyBatisCommonFactory.getSqlSessionFactory();
	}
	public List<Map<String, Object>> calList(CalendarVO calVO) throws SQLException{
		logger.info("캘린더 조회 호출 성공");
		List<Map<String, Object>> calList = new ArrayList<Map<String, Object>>();
		sqlSession = sqlSessionFactory.openSession();
		calList = sqlSession.selectList("calList", calVO);
		logger.info("calList :"+calList);
		//logger.info(calList.get(5).get("CAL_TITLE"));
		return calList;
	}
	public int calIns(Map<String, Object> pMap) {
		int result = 0;
		logger.info("캘린더 입력 호출 성공");
		sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.insert("calIns", pMap);
		sqlSession.commit();
		logger.info("result :"+result);
		//logger.info(pMap.size());
		return result;
	}
	public int calUpd(Map<String, Object> pMap) {
		// TODO Auto-generated method stub
		return 0;
	}
	public int calDel(Map<String, Object> pMap) {
		// TODO Auto-generated method stub
		return 0;
	}

}
