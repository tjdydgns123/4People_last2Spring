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

import com.board.BoardDao;

import com.vo.MeetRoomVO;

public class MeetRoomDao {
	SqlSessionFactory  sqlSessionFactory ;
	//
	SqlSession session;
	Logger logger = Logger.getLogger(MeetRoomDao.class);
	
	public int meetRoomIns(Map<String,Object>pMap) throws SQLException {
		int result=0;
		logger.info("Dao호출");
		try {
			String resource ="com/mybatis/Configuration.xml";
			Reader reader = null;
			reader =Resources.getResourceAsReader(resource);
			sqlSessionFactory  = new SqlSessionFactoryBuilder().build(reader);
			 session = sqlSessionFactory.openSession();
			 result = session.insert("meetRoomIns",pMap);
			 session.commit();
			 logger.info(pMap.size());
			 logger.info("result:"+result);
			
				 
				 
		} catch (Exception e) {
			System.out.println(e.toString());
			e.printStackTrace();
		}
		
		return result;
	}
	public List<Map<String, Object>> roomList(MeetRoomVO mrVO) throws SQLException {
		logger.info("roomList 호출 성공");
		List<Map<String, Object>> roomList = 
				new ArrayList<Map<String,Object>>();
		try {
			String resource ="com/mybatis/Configuration.xml";
			Reader reader = null;
			reader =Resources.getResourceAsReader(resource);
			sqlSessionFactory  = new SqlSessionFactoryBuilder().build(reader);
			 session = sqlSessionFactory.openSession();
			 session.selectList("meetRoomList",mrVO); //boardList 
			 logger.info(mrVO.getMr_no());
			 logger.info(roomList.size());
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return roomList;
	}
}
