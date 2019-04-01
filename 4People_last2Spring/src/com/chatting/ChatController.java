package com.chatting;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.util.HashMapBinder;

@Controller
@RequestMapping(value="/chatting/")
public class ChatController {
	@Autowired
	ChatLogic c_Logic = null;
	String command = null;
	Logger logger = Logger.getLogger(ChatController.class);
	HttpSession session = null;
	@PostMapping("teamChat")
	public String teamChat(HttpServletRequest req,Model model, @RequestParam Map<String,Object> pMap) {
		
		return "forward:changeTeam.jsp";
	}
	@PostMapping("privateChat")
	public String privateChat(HttpServletRequest req,Model model, @RequestParam Map<String,Object> pMap) {
		session = req.getSession();
		String mem_id = String.valueOf(session.getAttribute("MEM_ID"));
		logger.info(mem_id);
		List<Map<String,Object>> getPrivate = c_Logic.getPrivate(mem_id);
		for(Map<String,Object> rMap:getPrivate) {
			
		}
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


