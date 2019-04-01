package com.login;

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
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate = null;
	Logger logger = Logger.getLogger(LoginDao.class);
	public List<Map<String, Object>> loginCall(Map<String, Object> pMap) {
		logger.info("로그인호출");
		List<Map<String,Object>> loginList = null;
		try {
			loginList = sqlSessionTemplate.selectList("loginCall", pMap);
			
			logger.info("loginList:"+loginList.size());
			for(Map<String,Object> rMap:loginList) {
				for(String key:rMap.keySet()) {
					logger.info(key+" rMap:"+rMap.get(key));
					
				}
			}
			
		} catch (Exception e) {
				e.printStackTrace();
		}
		return loginList;
	}
//	public int signUp(Map<String, Object> pMap) {
//		int result =0;
//		try {
//			String resource = "com/mybatis/Configuration.xml";
//			Reader reader = null;
//			reader = Resources.getResourceAsReader(resource);
//			sqlMap = new SqlSessionFactoryBuilder().build(reader);
//			session = sqlMap.openSession(); 
//			String sql = session.getConfiguration().getMappedStatement("signUp").getBoundSql(pMap).getSql();
//	        List<ParameterMapping> parameterMappings = session.getConfiguration().getMappedStatement("signUp").getBoundSql(pMap).getParameterMappings();
//	        
//	        for (ParameterMapping parameterMapping : parameterMappings) {
//	            String param = (String) pMap.get(parameterMapping.getProperty());
//	            sql = sql.replaceFirst("\\?", "'" + param + "'");
//	        }
//	 
//	        logger.info("sql : " + sql);
//			 result=session.insert("signUp", pMap);
//			session.commit();
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	
//		return result;
//		
//	}


}
