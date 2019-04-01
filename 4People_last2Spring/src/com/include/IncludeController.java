package com.include;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value="/include/")
public class IncludeController{
	@Autowired
	IncludeLogic i_logic =null;
	String category = "";
	String crud= "";
	Logger logger=  Logger.getLogger(IncludeController.class);
	
	
	
	@PostMapping("sidebarTeam")
	public String sidebarTeam(HttpServletRequest req,Model model, @RequestParam Map<String,Object> pMap) {
		HttpSession session = req.getSession();
		String mem_id = String.valueOf(session.getAttribute("MEM_ID"));
		pMap.put("mem_id",mem_id);
		List<Map<String,Object>> sideTeamList = i_logic.sideTeamList(pMap);
		model.addAttribute("sideTeamList",sideTeamList);
		return "forward:/include/Result.jsp";
	}
	@PostMapping("messageCount")
	public String messageCount(HttpServletRequest req,Model model) {
		HttpSession session = req.getSession();
		String mem_id = String.valueOf(session.getAttribute("MEM_ID"));
		int count =i_logic.messageCount(mem_id);
		String messageCount = String.valueOf(count);
		model.addAttribute("messageCount", messageCount);
		return"forward:/include/Result.jsp";
	}
	
}