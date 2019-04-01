package com.login;

import java.util.Enumeration;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping(value="/login/")
public class LoginController  {
	@Autowired
	LoginLogic l_logic = null;
	Logger logger =  Logger.getLogger(LoginController.class);
	
	@PostMapping("login")
	public String login(Model model, @RequestParam Map<String,Object> pMap) {
		List<Map<String,Object>> loginList=l_logic.loginCall(pMap);
		model.addAttribute("loginList",loginList);
		//이동할 페이지.
		return "forward:loginAction.jsp";
	
	}
	
	@PostMapping(value="signUp")
	public String signUp(Model model, @RequestParam Map<String,Object> pMap) {
		String mem_addr ="";
		for(String key:pMap.keySet()) {
			if(key.equals("mem_addr1")||key.equals("mem_addr2")||key.equals("mem_addr3")) {
				mem_addr+=pMap.get(key);
			}
		}
		String mem_hp = pMap.get("mem_hp1")+"-"+pMap.get("mem_hp2")+"-"+pMap.get("mem_hp3");
		pMap.put("mem_hp", mem_hp);
		
		String mem_companyphone = pMap.get("mem_companyphone2")+"-"+pMap.get("mem_companyphone3")+"-"+pMap.get("mem_companyphone1");
		pMap.put("mem_companyphone", mem_companyphone);
		String mem_id = pMap.get("mem_id1")+"@"+pMap.get("mem_id2");
		pMap.put("mem_id", mem_id);
		pMap.put("mem_addr", mem_addr);
		pMap.put("mem_connect","0");
		int result =l_logic.signUp(pMap);
	model.addAttribute("result",result);
	return "forward:signUpResult.jsp";
	}
//		//회원가입 요청이 들어왔을떄
//		else if("signUp".equals(command)) {
//			logger.info("LoginController signUp 호출");
//			String mem_addr ="";
//			for(String key:pMap.keySet()) {
//				logger.info("key="+key);
//				logger.info(pMap.get(key));
//				if(key.equals("mem_addr1")||key.equals("mem_addr2")||key.equals("mem_addr3")) {
//					mem_addr+=pMap.get(key);
//				}
//			}
//			String mem_hp = pMap.get("mem_hp1")+"-"+pMap.get("mem_hp2")+"-"+pMap.get("mem_hp3");
//			pMap.put("mem_hp", mem_hp);
//			
//			String mem_companyphone = pMap.get("mem_companyphone2")+"-"+pMap.get("mem_companyphone3")+"-"+pMap.get("mem_companyphone1");
//			pMap.put("mem_companyphone", mem_companyphone);
//			
//			String mem_id = pMap.get("mem_id1")+"@"+pMap.get("mem_id2");
//			pMap.put("mem_id", mem_id);
//			pMap.put("mem_addr", mem_addr);
//			pMap.put("mem_connect","0");
//			
//			logger.info("mem_id="+mem_id);
//			logger.info("mem_addr="+mem_addr);
//			logger.info("mem_hp="+mem_hp);
//			logger.info("mem_companyphone="+mem_companyphone);
//			
//			int result =l_logic.signUp(pMap);
////			path="forward|login.jsp";
//			req.setAttribute("result",result);
//			path="forward:./signUpResult.jsp";
//		}
//		return path;
//	}

}
