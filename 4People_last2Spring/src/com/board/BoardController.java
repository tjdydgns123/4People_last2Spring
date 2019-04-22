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
import org.springframework.web.bind.annotation.PostMapping;
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
		@GetMapping("teamBoardINS")
		String teamBoardINS (HttpServletRequest req, @RequestParam Map<String,Object> pMap) {
			session = req.getSession();
			String mem_id = String.valueOf(session.getAttribute("MEM_ID"));
			String team_code="";
			for(String key:pMap.keySet()) {
				if(key.contains("team_code")) {
					team_code=(String)pMap.get(key);
				}
			}
			Bo_logic.BoardIns(pMap);
			return "redirect:../team/board?team_code="+team_code;
		}
			@GetMapping("boardlist")
			String BoardList (Model model, @RequestParam Map<String,Object> pMap) {
			List<Map<String,Object>> BoardList=Bo_logic.BoardSel(pMap);
			logger.info("BoardList호출 : " +BoardList.get(0) );
			model.addAttribute("BoardList", BoardList);
			return "forward:./board.jsp";
			
		}
			@GetMapping("boardUPD")
			String BoardUPD (HttpServletRequest req, @RequestParam Map<String,Object> pMap) {
				session = req.getSession();
				String mem_id = String.valueOf(session.getAttribute("MEM_ID"));
				String team_code=req.getParameter("team_code");
				String board_no = req.getParameter("board_no");
     			Bo_logic.BoardUpd(pMap);
     			return "redirect:../boardList/boardListSel?mem_id="+mem_id+"&team_code="+team_code+"&board_no="+board_no;
				
			}
	}

