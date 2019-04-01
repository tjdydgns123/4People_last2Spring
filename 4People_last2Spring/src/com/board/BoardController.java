package com.board;

import java.util.List;
import java.util.Map;

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
	
//		String mem_id = req.getParameter("mem_id");
	String mem_id = "dydgns11@naver.com";
//		if("ins".equals(crud)) {
//			Bo_logic.BoardIns(pMap);
//			path ="redirect:./board.for?crud=sel&mem_id="+mem_id;
//		}
			@GetMapping("boardlist")
			String BoardList (Model model, @RequestParam Map<String,Object> pMap) {
			List<Map<String,Object>> BoardList=Bo_logic.BoardSel(pMap);
			model.addAttribute("BoardList", BoardList);
			return "forward:./board.jsp";
			
		}
//		else if("upd".equals(crud)) {
//			logger.info("upd호출"+pMap.get("board_no"));
//			Bo_logic.BoardUpd(pMap);
//			path ="redirect:./board.for?crud=sel&mem_id="+mem_id;
//		}
	}

