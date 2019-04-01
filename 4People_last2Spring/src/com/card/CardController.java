package com.card;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.forpeople.Controller;
import com.util.HashMapBinder;

public class CardController implements Controller {
	Logger logger = Logger.getLogger(CardController.class);
	public String execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String path=null;
		
		String crud = req.getParameter("crud");
		String mem_id = req.getParameter("mem_id");
		Map<String,Object> pMap = new HashMap<String,Object>();
		HashMapBinder binder = new HashMapBinder(req);
		binder.ajaxBind(pMap);
		logger.info("cardcontroller출");
		//은수
		CardLogic c_Logic = new CardLogic();
		HttpSession session = req.getSession();
		//은수
		if("sel".equals(crud)) {
			logger.info("sel");
			List<Map<String,Object>> cardList =null;
			cardList = c_Logic.cardSEL(pMap);
			req.setAttribute("cardList", cardList);
			path ="forward:../card/card.jsp";
		}
		//은수
		else if("commentIns".equals(crud)){
			logger.info("CardController commentIns 호출");
			String mem_id2 = String.valueOf(session.getAttribute("MEM_ID"));
			pMap.put("mem_id",mem_id2);
			for(Object key:pMap.keySet()) {
				logger.info("key=="+key+" vlaue=="+pMap.get(key));
			}
			String comment_code=c_Logic.commentIns(pMap);
			logger.info("리턴값"+comment_code);
			req.setAttribute("comment_code",comment_code);
			path="forward:./commentInsReslt.jsp";
		}
		else if("labelins".equals(crud)) {
			List<Map<String,Object>> labelIns = c_Logic.labelIns(pMap);
			req.setAttribute("labelIns", labelIns);
			path ="forward:./labelInsResult.jsp";
		}
		else if("labelDel".equals(crud)) {
			c_Logic.labelDel(pMap);
			path ="hh:../card/card.jsp";
		}
		else if("labelUpd".equals(crud)) {
			c_Logic.labelUpd(pMap);
			path ="hh:./card/card.jsp";
		}
		else if("desIns".equals(crud)) {
			c_Logic.desIns(pMap);
			path ="hh:./card/card.jsp";
		}
	
	
		return path;
	}
}
