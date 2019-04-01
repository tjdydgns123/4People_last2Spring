package com.board;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value="/board/")
public class BoardController  {
	@Autowired
	BoardLogic Bo_logic = null;
	String crud =null;
	Logger logger =  Logger.getLogger(BoardController.class);
	HttpSession session = null;
		@GetMapping("boardINS")
		String BoardINS (HttpServletRequest req,@RequestParam Map<String,Object> pMap) {
			session = req.getSession();
			String mem_id = String.valueOf(session.getAttribute("MEM_ID"));
			Bo_logic.BoardIns(pMap);
			return "redirect:./boardlist?mem_id="+mem_id;
			
		}
			@GetMapping("boardlist")
			String BoardList (Model model, @RequestParam Map<String,Object> pMap) {
			List<Map<String,Object>> BoardList=Bo_logic.BoardSel(pMap);
			model.addAttribute("BoardList", BoardList);
			return "forward:./board.jsp";
			
		}
			@GetMapping("boardUPD")
			String BoardUPD (HttpServletRequest req, @RequestParam Map<String,Object> pMap) {
				session = req.getSession();
				String mem_id = String.valueOf(session.getAttribute("MEM_ID"));
     			Bo_logic.BoardUpd(pMap);
			return "redirect:./board.list?mem_id="+mem_id;
				
			}
	}

