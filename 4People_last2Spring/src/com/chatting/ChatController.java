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
import org.springframework.web.bind.annotation.GetMapping;
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
	
	@PostMapping("teamChatlog")
	public String teamChatlog(ModelMap mMap,Model model, @RequestParam Map<String,Object> pMap) {
		String mem_id =(String)mMap.get("MEM_ID");
		pMap.put("mem_id",mem_id);
		List<Map<String,Object>> teamChatlog =c_Logic.teamChatlog(pMap);
		List<Map<String,Object>> teamChatMember =c_Logic.teamChatMember(pMap);
		model.addAttribute("teamChatlog", teamChatlog);
		model.addAttribute("teamChatMember", teamChatMember);
		
		
		return "forward:teamChatlog.jsp";
	}
	@RequestMapping("teamChat")
	public String teamChat(ModelMap mMap,Model model) {
		String mem_id =(String)mMap.get("MEM_ID");
		logger.info(mem_id);
		List<Map<String,Object>> getTeam = c_Logic.getTeam(mem_id);
		model.addAttribute("getTeam",getTeam);
		return "forward:changeTeam.jsp";
	}
	@PostMapping("chatLogIns")
	public String chatLogIns(ModelMap mMap,Model model, @RequestParam Map<String,Object> pMap) {
		String mem_id =(String)mMap.get("MEM_ID");
		pMap.put("mem_id",mem_id);
		c_Logic.chatLogIns(pMap);
		return "";
	}
	@PostMapping("teamLogIns")
	public String teamLogIns(ModelMap mMap,Model model, @RequestParam Map<String,Object> pMap) {
		String mem_id =(String)mMap.get("MEM_ID");
		pMap.put("mem_id",mem_id);
		for(String key:pMap.keySet()) {
			System.out.println("key="+key+" vlaue="+pMap.get(key));
		}
		c_Logic.teamLogIns(pMap);
		return "";
	}
	@RequestMapping("privateChat")
	public String privateChat(ModelMap mMap,Model model) {
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
	@PostMapping("privateSearch")
	public String privateSearch(ModelMap mMap,Model model, @RequestParam Map<String,Object> pMap) {
		System.out.println("호출");
		String mem_id =(String)mMap.get("MEM_ID");
		pMap.put("mem_id",mem_id);
		List<Map<String,Object>> privateSearch=c_Logic.privateSearch(pMap);
		model.addAttribute("privateSearch",privateSearch);
		return "forward:privateSearchResult.jsp";
	}
	@GetMapping("newPrivateChat")
	public String newPrivateChat(ModelMap mMap,Model model, @RequestParam Map<String,Object> pMap) {
		String mem_id =(String)mMap.get("MEM_ID");
		pMap.put("mem_id",mem_id);
		c_Logic.newPrivateChat(pMap);
		return "redirect:chatMain.jsp";
	}
	
	}


