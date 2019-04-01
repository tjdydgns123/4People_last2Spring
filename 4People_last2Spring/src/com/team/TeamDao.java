package com.team;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.mapping.ParameterMapping;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;

import com.login.LoginDao;

public class TeamDao {
	SqlSessionFactory  sqlMap = null;
	SqlSession session = null;
	Logger logger = Logger.getLogger(TeamDao.class);
	//board가져오기
	public List<Map<String, Object>> getBoard(Map<String, Object> pMap) {
		List<Map<String,Object>> boardList = null;
		logger.info("TeamDao호출");
		String resource = "com/mybatis/Configuration.xml";
		Reader reader =null;
		try {
			reader = Resources.getResourceAsReader(resource);
			sqlMap = new SqlSessionFactoryBuilder().build(reader);
			session = sqlMap.openSession();
			boardList = session.selectList("boardList",pMap);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return boardList;
	}
	//프로젝트에 참여중인 회원정보가져오기
	public List<Map<String, Object>> getMember(Map<String, Object> pMap) {
		List<Map<String,Object>> memberList = null;
		logger.info("TeamDao호출");
		String resource = "com/mybatis/Configuration.xml";
		Reader reader =null;
		
		
		try {
			reader = Resources.getResourceAsReader(resource);
			sqlMap = new SqlSessionFactoryBuilder().build(reader);
			session = sqlMap.openSession();
			memberList = session.selectList("getMember",pMap);
			Map<String,Object> rMap = session.selectOne("teamInfo",pMap);
			memberList.add(rMap);
			String sql = session.getConfiguration().getMappedStatement("getMember").getBoundSql(pMap).getSql();
	        List<ParameterMapping> parameterMappings = session.getConfiguration().getMappedStatement("getMember").getBoundSql(pMap).getParameterMappings();
	        	
	        for (ParameterMapping parameterMapping : parameterMappings) {
	            String param = (String) pMap.get(parameterMapping.getProperty());
	            sql = sql.replaceFirst("\\?", "'" + param + "'");
	        }
	 
	        logger.info("sql : " + sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return memberList;
	}
	//초대를 위해 검색햇을떄.
	public Map<String,Object> getInvite(Map<String, Object> pMap) {
		System.out.println(pMap);
		logger.info("TeamDao호출");
		String resource = "com/mybatis/Configuration.xml";
		Reader reader =null;
		try {
			reader = Resources.getResourceAsReader(resource);
			sqlMap = new SqlSessionFactoryBuilder().build(reader);
			session = sqlMap.openSession();
//			String sql = session.getConfiguration().getMappedStatement("getInvite").getBoundSql(pMap).getSql();
//	        List<ParameterMapping> parameterMappings = session.getConfiguration().getMappedStatement("getInvite").getBoundSql(pMap).getParameterMappings();
//	        
//	        for (ParameterMapping parameterMapping : parameterMappings) {
//	            String param = (String) pMap.get(parameterMapping.getProperty());
//	            sql = sql.replaceFirst("\\?", "'" + param + "'");
//	        }
////	        logger.info("sql : " + sql);
			session.selectList("getInvite",pMap);
			logger.info("pMap : " + pMap);
				pMap.remove("p_code");
				pMap.remove("mem_email");
			
			//logger.info("return값="+inviteList.get(0).toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		return pMap;
	}
	//초대버튼눌럿을떄
	public void inviteMember(Map<String, Object> pMap) {
		logger.info("TeamDao호출");
		String resource = "com/mybatis/Configuration.xml";
		Reader reader =null;
		try {
			reader = Resources.getResourceAsReader(resource);
			sqlMap = new SqlSessionFactoryBuilder().build(reader);
			session = sqlMap.openSession();
			
//			String sql = session.getConfiguration().getMappedStatement("inviteMember").getBoundSql(pMap).getSql();
//	        List<ParameterMapping> parameterMappings = session.getConfiguration().getMappedStatement("inviteMember").getBoundSql(pMap).getParameterMappings();
//	        
//	        for (ParameterMapping parameterMapping : parameterMappings) {
//	            String param = (String) pMap.get(parameterMapping.getProperty());
//	            sql = sql.replaceFirst("\\?", "'" + param + "'");
//	        }
//	        logger.info("sql : " + sql);


			session.insert("inviteMember",pMap);
			session.commit();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
