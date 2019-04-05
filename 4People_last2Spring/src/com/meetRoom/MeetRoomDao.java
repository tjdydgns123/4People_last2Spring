package com.meetRoom;

import java.io.Reader;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.board.BoardDao;

import com.vo.MeetRoomVO;

@Repository
public class MeetRoomDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate=null;
	Logger logger = Logger.getLogger(MeetRoomDao.class);
	
	public void meetRoomIns(Map<String,Object>pMap) throws SQLException {
		logger.info("Dao호출");
			 sqlSessionTemplate.insert("meetRoomIns",pMap);
			 logger.info(pMap.size());
	}
	public List<Map<String, Object>> roomList(MeetRoomVO mrVO) throws SQLException {
		logger.info("roomList 호출 성공");
		List<Map<String, Object>> roomList = 
				new ArrayList<Map<String,Object>>();
			sqlSessionTemplate.selectList("meetRoomList",mrVO); //boardList 
			 logger.info(mrVO.getMr_no());
			 logger.info(roomList.size());
			
		return roomList;
	}
}
