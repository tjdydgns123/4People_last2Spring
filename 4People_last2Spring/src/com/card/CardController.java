package com.card;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping("/card/")
public class CardController {
	Logger logger = Logger.getLogger(CardController.class);
//		String crud = req.getParameter("crud");
//		String mem_id = req.getParameter("mem_id");
	@Autowired	
	CardLogic c_Logic = null;
//		HttpSession session = req.getSession();
	@PostMapping("cardSel")
	public String CareSel(Model model, @RequestParam Map<String,Object>pMap) {
		logger.info("sel");
			List<Map<String,Object>> cardList =null;
			cardList = c_Logic.cardSEL(pMap);
			model.addAttribute("cardList", cardList);
			return"forward:../card/card.jsp";
		}
		//은수
//		else if("commentIns".equals(crud)){
//			logger.info("CardController commentIns 호출");
//			String mem_id2 = String.valueOf(session.getAttribute("MEM_ID"));
//			pMap.put("mem_id",mem_id2);
//			for(Object key:pMap.keySet()) {
//				logger.info("key=="+key+" vlaue=="+pMap.get(key));
//			}
//			String comment_code=c_Logic.commentIns(pMap);
//			logger.info("리턴값"+comment_code);
//			req.setAttribute("comment_code",comment_code);
//			path="forward:./commentInsReslt.jsp";
//		}
	@PostMapping("labelINS")
	 public String labelINS(Model model,@RequestParam Map<String,Object> pMap) {
			List<Map<String,Object>> labelIns = c_Logic.labelIns(pMap);
			model.addAttribute("labelIns", labelIns);
			return "forward:./labelInsResult.jsp";

	}
//		}
	@PostMapping("labelDEL")
	public String labelDEL(@RequestParam Map<String,Object> pMap) {
			c_Logic.labelDel(pMap);
		return "";
		
	}
	@PostMapping("labelUPD")
	 public String labelUPD(@RequestParam Map<String,Object> pMap) {
			c_Logic.labelUpd(pMap);
			return "";

	}
	@PostMapping("desINS")
	public String desINS(Model model,@RequestParam Map<String,Object> pMap) {
		List<Map<String,Object>> cardList = null;
		cardList =c_Logic.desIns(pMap);
		model.addAttribute("cardList", cardList);
		return "forward:../card/desInsResult.jsp";
		
	}
	@PostMapping("desUPD")
	public String desUPD(@RequestParam Map<String,Object> pMap) {
		c_Logic.desUPD(pMap);
		return "";
		
	}
	@PostMapping("memberINS")
	public String memberINS(Model model,@RequestParam Map<String,Object> pMap) {
		List<Map<String,Object>> cardList = null;
		cardList = c_Logic.memberINS(pMap);
		model.addAttribute("cardList", cardList);
		return "forward:../card/partiInsResult.jsp";
		
	}
	@PostMapping("partiDEL")
	public String partiDEL(@RequestParam Map<String,Object> pMap) {
		 c_Logic.partiDEL(pMap);
		return "";
		
	}
	@PostMapping("checkINS")
	public String checkINS(Model model,@RequestParam Map<String,Object> pMap) {
		List<Map<String,Object>> cardList = null;
		cardList = c_Logic.checkINS(pMap);
		model.addAttribute("cardList", cardList);
		return "forward:../card/checkiInsResult.jsp";
		
	}
}
