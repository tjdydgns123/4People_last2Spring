package com.login;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class LoginLogic {
	@Autowired
	LoginDao l_dao = null;
	Logger logger =Logger.getLogger(LoginLogic.class);
	public List<Map<String,Object>> loginCall(Map<String,Object> pMap){
		logger.info("로그인호출");
		List<Map<String,Object>> loginList =null;
		loginList=l_dao.loginCall(pMap);
		return loginList;
	}
//	public int signUp(Map<String,Object> pMap) {
//		logger.info("signUp호출");
//		int result =l_dao.signUp(pMap);
//		return result;
//	}
}
