package com.chatting;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;


@Controller
@SessionAttributes(value= {"MEM_ID"})
@RequestMapping(value="/chatting/")
public class ChatController {
	@Autowired
	ChatLogic c_Logic = null;
	String command = null;
	Logger logger = Logger.getLogger(ChatController.class);
	@PostMapping("teamChat")
	public String teamChat(ModelMap mMap,Model model, @RequestParam Map<String,Object> pMap) {
		
		return "forward:changeTeam.jsp";
	}
	@PostMapping("privateChat")
	public String privateChat(ModelMap mMap,Model model, @RequestParam Map<String,Object> pMap) {
		String mem_id =(String)mMap.get("MEM_ID");
		logger.info(mem_id);
		List<Map<String,Object>> getPrivate = c_Logic.getPrivate(mem_id);
		model.addAttribute("getPrivate", getPrivate);
		return "forward:changePrivate.jsp";
	}
	@PostMapping("privateChatlog")
	public String privateChatlog(HttpServletRequest req,Model model, @RequestParam Map<String,Object> pMap) {
		String chat_name = req.getParameter("chat_name");
		String chat_id = req.getParameter("chat_id");
		List<Map<String,Object>> privateChatlog = c_Logic.privateChatlog(pMap);
		if(privateChatlog!=null) {
			model.addAttribute("privateChatlog",privateChatlog);
		}
		model.addAttribute("chat_name",chat_name);
		model.addAttribute("chat_id",chat_id);
		return "forward:privateChatlog.jsp";
	}
	
	}


