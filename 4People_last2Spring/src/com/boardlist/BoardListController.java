package com.boardlist;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.board.BoardController;
import com.forpeople.Controller;
import com.util.HashMapBinder;

public class BoardListController implements Controller {
	BoardListLogic Bdlist_logic = new BoardListLogic();
	String crud =null;
	Logger logger =  Logger.getLogger(BoardController.class);
	
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String path=null;
		crud = req.getParameter("crud");
		String board_no = req.getParameter("board_no");
		String team_code = req.getParameter("team_code");
		Map<String,Object> pMap = new HashMap<String,Object>();
		HashMapBinder binder = new HashMapBinder(req);
		binder.bind(pMap);
		List<Map<String,Object>> b_boardList =null;
		if("ins".equals(crud)) {
			logger.info("ins호출");
			Bdlist_logic.BdlistIns(pMap);
//			path ="redirect:./boardListfor?crud=sel&board_no="+board_no;
			path ="redirect:./boardList.for?crud=sel2&board_no="+board_no;
		}
		else if("ins2".equals(crud)) {
			logger.info("ins2호출");
			Bdlist_logic.cardIns(pMap);
			path ="redirect:./boardList.for?crud=sel2&board_no="+board_no;
		}
		else if("sel2".equals(crud)) {
			logger.info("sel호출");
			logger.info(board_no);
			b_boardList =Bdlist_logic.BdlistSel(pMap);
			req.setAttribute("b_boardList", b_boardList);
			req.setAttribute("board_no", board_no);
			path="forward:./boardList.jsp";
		}
		else if("sel".equals(crud)) {
			b_boardList =Bdlist_logic.BdlistSel(pMap);
			req.setAttribute("b_boardList", b_boardList);
			req.setAttribute("board_no", board_no);
			path="forward:./boardListResult.jsp";
		}
		return path;
	}

}
