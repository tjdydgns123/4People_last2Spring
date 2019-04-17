package com.boardlist;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.board.BoardController;

@Controller
@RequestMapping(value="/boardList/")
public class BoardListController  {
	@Autowired
	BoardListLogic Bdlist_logic = null;
	Logger logger =  Logger.getLogger(BoardController.class);
	
	@GetMapping("boardListINS")
	String BoardListINS (HttpServletRequest req,Model model, @RequestParam Map<String,Object> pMap) {
		logger.info("ins호출");
		    String board_no = req.getParameter("board_no");
			Bdlist_logic.BdlistIns(pMap);
			return "redirect:./boardListSel?board_no="+board_no;
	}
	@GetMapping("boardListINS2")
	String BoardListINS2 (HttpServletRequest req,Model model, @RequestParam Map<String,Object> pMap) {
			String board_no = req.getParameter("board_no");
			logger.info("ins2호출");
			Bdlist_logic.cardIns(pMap);
			return "redirect:./boardListSel?board_no="+board_no;
	}
		@GetMapping("boardListSel")
		String BoardList (HttpServletRequest req,Model model, @RequestParam Map<String,Object> pMap) {
			logger.info("sel호출");
			List<Map<String,Object>>b_boardList =Bdlist_logic.BdlistSel(pMap);
		String board_no = req.getParameter("board_no");
		model.addAttribute("board_no", board_no);
		model.addAttribute("b_boardList", b_boardList);
		return "forward:./boardList.jsp";
		
	}
		@PostMapping("team_memberINS")
		String BoadrListteam_memberINS(Model model, @RequestParam Map<String,Object> pMap) {
			List<Map<String,Object>>b_boardList =Bdlist_logic.team_memberINS(pMap);
			model.addAttribute("b_boardList", b_boardList);
			return "forward:./team_memberINSResult.jsp";
		}
	@PostMapping("historySel")
	  String historySel(Model model,@RequestParam Map<String,Object> pMap) {
		List<Map<String,Object>>HistoryList =Bdlist_logic.historySel(pMap);
		model.addAttribute("HistoryList", HistoryList);
		return"forward:./historySelResult.jsp";
	}

}
