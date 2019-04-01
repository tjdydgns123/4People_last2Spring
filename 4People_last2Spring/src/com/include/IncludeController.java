package com.include;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.forpeople.Controller;
import com.util.HashMapBinder;

public class IncludeController implements Controller {
	IncludeLogic i_logic = new IncludeLogic();
	String category = "";
	String crud= "";
	Logger logger=  Logger.getLogger(IncludeController.class);
	
	public IncludeController(String category, String crud) {
		this.category = category;
		this.crud = crud;
	}

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		HttpSession session = req.getSession();
		String path="";
		String command = req.getParameter("command");
		if(!command.equals("")) {
			if("sidebarTeam".equals(command)) {
				Map<String,Object> pMap = new HashMap<String,Object>();
				String mem_id = String.valueOf(session.getAttribute("MEM_ID"));
				pMap.put("mem_id",mem_id);
				List<Map<String,Object>> sideTeamList = i_logic.sideTeamList(pMap);
				req.setAttribute("sideTeamList", sideTeamList);
				for(Map<String,Object> rMap:sideTeamList) {
					for(Object key:rMap.keySet()) {
						logger.info(key);
					}
				}
				path = "forward:/include/Result.jsp";
				
			}
			else if("messageCount".equals(command)) {
				String mem_id = String.valueOf(session.getAttribute("MEM_ID"));
				int count =i_logic.messageCount(mem_id);
				String messageCount = String.valueOf(count);
				req.setAttribute("messageCount", messageCount);
				path = "forward:/include/Result.jsp";
			}
		}
		
		return path;
	}

}
