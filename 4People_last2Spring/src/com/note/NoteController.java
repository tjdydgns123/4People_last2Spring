package com.note;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

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
@RequestMapping("/note/")
public class NoteController  {
	@Autowired
	NoteLogic n_logic =null;
	String command = null;
	Logger logger=  Logger.getLogger(NoteController.class);
	String mb_code ="";
	String mb_content ="";
	String note_code="";
	String mem_id="";
	HttpSession session=null;
	@PostMapping(value="newNote")
	public String newNote(Model model,@RequestParam Map<String,Object> pMap ) {
		for(String key:pMap.keySet()) {
			logger.info(key+" pMap:"+pMap.get(key));
			if(key.equals("mb_content")) {
				mb_content = (String)pMap.get(key);
			}
			if(key.equals("note_code")) {
				note_code = (String)pMap.get(key);
			}
		}
		mb_code = n_logic.newNote(pMap);
		model.addAttribute("mb_code",mb_code);
		model.addAttribute("mb_content",mb_content);
		model.addAttribute("note_code",note_code);
		
		return "forward:newNoteResult.jsp";
	}
	@PostMapping("noteDelete")
	public String noteDelete(HttpServletRequest req,Model model,@RequestParam Map<String,Object> pMap) {
		session = req.getSession();
		mem_id = String.valueOf(session.getAttribute("MEM_ID"));
		List<Map<String,Object>> noteList = n_logic.DeleteNote(pMap,mem_id);
		model.addAttribute("noteList",noteList);
		
		
		return "forward:newNoteResult.jsp";
	}
	@RequestMapping(value="myBoard")
	public String myBoard(HttpServletRequest req,Model model,@RequestParam Map<String,Object> pMap) {
		session = req.getSession();
		mem_id = String.valueOf(session.getAttribute("MEM_ID"));
		List<Map<String,Object>> noteList =n_logic.getNote(mem_id);
		model.addAttribute("noteList",noteList);
		return "forward:note2.jsp";
	}
	@PostMapping("sendSearch")
	public String sendSearch(HttpServletRequest req,Model model,@RequestParam Map<String,Object> pMap) {
		session = req.getSession();
		mem_id = String.valueOf(session.getAttribute("MEM_ID"));
		pMap.put("mem_id",mem_id);
		pMap.remove("searchName");
		String searchName = req.getParameter("searchName");
		pMap.put("searchName",searchName);
		List<Map<String,Object>> sendList = n_logic.getSend(pMap);
		model.addAttribute("sendList",sendList);
		
		return "forward:sendSearchResult.jsp";
	}
	@PostMapping("sendNote")
	public String sendNote(HttpServletRequest req,Model model,@RequestParam Map<String,Object> pMap) {
		session = req.getSession();
		String mb_sender = String.valueOf(session.getAttribute("MEM_ID"));
		pMap.put("mb_sender",mb_sender);
		String receive_id ="";
		
		Iterator<String> keys = pMap.keySet().iterator();
		while( keys.hasNext() ){
			String key = keys.next();
			if(key.equals("receive_id")) {
				receive_id = (String)pMap.get(key);
				keys.remove();
			}
		}
		String str[] = receive_id.split("\\[");
		String str2[] = str[1].split("\\]");
		String mem_id = str2[0];
		pMap.put("mem_id",mem_id);
		int result=n_logic.sendNote(pMap);
		model.addAttribute("result",result);
		
		return "forward:sendNoteResult.jsp";
	}
	@PostMapping("noteMessage")
	public String noteMessage(HttpServletRequest req,Model model,@RequestParam Map<String,Object> pMap) {
		session = req.getSession();
		String mem_id = String.valueOf(session.getAttribute("MEM_ID"));
		List<Map<String,Object>> noteMessageList=n_logic.noteMessage(mem_id);
		model.addAttribute("noteMessageList",noteMessageList);
		return"forward:noteMessageResult.jsp";
	}
	@PostMapping("insertMessage")
	public String insertMessage(Model model,@RequestParam Map<String,Object> pMap) {
		n_logic.insertMessage(pMap);
		return "redirect:myBoard";
	}
	@PostMapping("deleteMessage")
	public String deleteMessage(Model model,@RequestParam Map<String,Object> pMap) {
		n_logic.deleteMessage(pMap);
		return "redirect:myBoard";
	}
}
