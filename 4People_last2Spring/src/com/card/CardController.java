package com.card;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
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
import org.springframework.web.multipart.MultipartFile;

import com.chart.ChartLogic;
import com.vo.ChartVO;


@Controller
@RequestMapping("/card/")
public class CardController {
	Logger logger = Logger.getLogger(CardController.class);
//		String crud = req.getParameter("crud");
//		String mem_id = req.getParameter("mem_id");
	@Autowired	
	CardLogic c_Logic = null;
	@Autowired
	ChartLogic chartLogic = null;
//		HttpSession session = req.getSession();
	@PostMapping("cardSel")
	public String CareSel(Model model, @RequestParam Map<String,Object>pMap,HttpServletRequest req) {
		HttpSession session = req.getSession();
		String mem_id = String.valueOf(session.getAttribute("MEM_ID"));
		pMap.put("mem_id2",mem_id);

		logger.info("sel");
			List<Map<String,Object>> cardList =null;
			cardList = c_Logic.cardSEL(pMap);
			logger.info(cardList);
			model.addAttribute("cardList", cardList);
			return"forward:../card/card.jsp";
		}
	
	//카드에서 차트 버튼 누를 때 차트 리스트 불러오기
		@GetMapping("chartCall")
		public String chartCall (@RequestParam("mem_id") String mem_id, Model model) {
			logger.info("chartCall 호출");
			List<ChartVO> chartVO = chartLogic.chartList(mem_id);
			model.addAttribute("chartCall", chartVO);
//			logger.info("chartVO.chartname : "+chartVO.get(0).getChartname());
			return "forward:../chart/chartCall.jsp";
		}
	//차트 리스트에서 한개 선택하기
		@GetMapping("cardInsert")
		public String cardInsert (@RequestParam("no") String no, Model model) {
			logger.info("cardInsert 호출");
			ChartVO chartVO = chartLogic.chartDetail(no);
			model.addAttribute("cardInsert", chartVO);
			logger.info("chartVO.no : "+chartVO.getNo());
			return "forward:../chart/cardInsert.jsp";
		}
	
	@PostMapping("commentIns")
	public String commentIns(Model model,@RequestParam Map<String,Object> pMap,HttpServletRequest req) {
		HttpSession session = req.getSession();
		String mem_id = String.valueOf(session.getAttribute("MEM_ID"));
		pMap.put("mem_id2",mem_id);
		List<Map<String,Object>> cardList = c_Logic.commentIns(pMap);
		model.addAttribute("cardList", cardList);
		return "forward:../card/commentInsResult.jsp";
		
	}
	@PostMapping("commentDEL")
	public String commentDEL(Model model,@RequestParam Map<String,Object> pMap,HttpServletRequest req) {
		HttpSession session = req.getSession();
		String mem_id = String.valueOf(session.getAttribute("MEM_ID"));
		pMap.put("mem_id2",mem_id);
		List<Map<String,Object>> cardList = c_Logic.commentDEL(pMap);
		model.addAttribute("cardList", cardList);
		return "forward:../card/commentInsResult.jsp";
		
	}
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
		return "redirect:../card/del.jsp";
		
	}
	@PostMapping("labelUPD")
	 public String labelUPD(@RequestParam Map<String,Object> pMap) {
			c_Logic.labelUpd(pMap);
			return "redirect:../card/del.jsp";

	}
	@PostMapping("desINS")
	public String desINS(Model model,@RequestParam Map<String,Object> pMap,HttpServletRequest req) {
		HttpSession session = req.getSession();
		String mem_id = String.valueOf(session.getAttribute("MEM_ID"));
		pMap.put("mem_id2",mem_id);
		List<Map<String,Object>> cardList = null;
		cardList =c_Logic.desIns(pMap);
		model.addAttribute("cardList", cardList);
		return "forward:../card/desInsResult.jsp";
		
	}
	@PostMapping("desUPD")
	public String desUPD(@RequestParam Map<String,Object> pMap) {
		c_Logic.desUPD(pMap);
		return "redirect:../card/del.jsp";
		
	}
	@PostMapping("memberINS")
	public String memberINS(Model model,@RequestParam Map<String,Object> pMap,HttpServletRequest req) {
		List<Map<String,Object>> cardList = null;
		HttpSession session = req.getSession();
		String mem_id = String.valueOf(session.getAttribute("MEM_ID"));
		pMap.put("mem_id2",mem_id);
		cardList = c_Logic.memberINS(pMap);
		model.addAttribute("cardList", cardList);
		return "forward:../card/partiInsResult.jsp";
		
	}
	@PostMapping("partiDEL")
	public String partiDEL(@RequestParam Map<String,Object> pMap) {
		 c_Logic.partiDEL(pMap);
		 return "redirect:../card/del.jsp";
		
	}
	@PostMapping("checkINS")
	public String checkINS(Model model,@RequestParam Map<String,Object> pMap,HttpServletRequest req) {
		List<Map<String,Object>> cardList = null;
		HttpSession session = req.getSession();
		String mem_id = String.valueOf(session.getAttribute("MEM_ID"));
		pMap.put("mem_id2",mem_id);
		cardList = c_Logic.checkINS(pMap);
		model.addAttribute("cardList", cardList);
		return "forward:../card/checkiInsResult.jsp";
		
	}
	@PostMapping("checklistINS")
	public String checklistINS(Model model,@RequestParam Map<String,Object> pMap,HttpServletRequest req) {
		List<Map<String,Object>> cardList = null;
		HttpSession session = req.getSession();
		String mem_id = String.valueOf(session.getAttribute("MEM_ID"));
		pMap.put("mem_id2",mem_id);
		cardList = c_Logic.checkListINS(pMap);
		model.addAttribute("cardList", cardList);
		logger.info(cardList);
		return "forward:../card/checkiInsResult.jsp";
		
	}
	@PostMapping("checklistUPD")
	public String checklistUPD(@RequestParam Map<String,Object> pMap) {
		c_Logic.checkListUPD(pMap);
		return "";
		
	}
	@PostMapping("checklistUPD2")
	public String checklistUPD2(@RequestParam Map<String,Object> pMap) {
		c_Logic.checkListUPD2(pMap);
		return "redirect:../card/del.jsp";
		
	}
	@PostMapping("checklistDEL")
	public String checklistDEL(Model model,@RequestParam Map<String,Object> pMap,HttpServletRequest req) {
		List<Map<String,Object>> cardList = null;
		HttpSession session = req.getSession();
		String mem_id = String.valueOf(session.getAttribute("MEM_ID"));
		pMap.put("mem_id2",mem_id);
		cardList = c_Logic.checklistDEL(pMap);
		model.addAttribute("cardList", cardList);
		return "forward:../card/checkiInsResult.jsp";
		
	}
	@PostMapping("checkDEL")
	public String checkDEL(@RequestParam Map<String,Object> pMap) {
		 c_Logic.checkDEL(pMap);
		 return "redirect:../card/del.jsp";
		
	}
	@PostMapping("fileINS")
	public String fileINS(Model model,@RequestParam Map<String,Object> pMap
			              , @RequestParam("fname") MultipartFile fname,HttpServletRequest req){
		List<Map<String,Object>> cardList = null;
		logger.info(pMap);
		logger.info(fname.getOriginalFilename());
		String filename = fname.getOriginalFilename();
		String savePath = "\\\\192.168.0.6\\pds";
		if(fname !=null) {
			pMap.put("ATT_NAME", filename);
			String fullPath = savePath+"\\"+filename;
			File file = new File(fullPath);
			if(!fname.isEmpty()) {
				try {
					byte[] bytes = fname.getBytes();
					BufferedOutputStream bos = 
							new BufferedOutputStream(
									new FileOutputStream(file));
					bos.write(bytes);
					bos.close();
					long size=  file.length();
					double d_size = Math.floor(size/1024.0);
					int i_size = (int)d_size;
					pMap.put("ATT_SIZE", String.valueOf(i_size));
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		HttpSession session = req.getSession();
		String mem_id = String.valueOf(session.getAttribute("MEM_ID"));
		pMap.put("mem_id2",mem_id);
		cardList = c_Logic.fileINS(pMap);
		model.addAttribute("cardList",cardList);
		logger.info(cardList);
		return "forward:../card/fileInsResult.jsp";
	}
	@PostMapping("fileDEL")
	public String fileDEL(@RequestParam Map<String,Object> pMap) {
		c_Logic.fileDEL(pMap);
		return "redirect:../card/del.jsp";
		
	}
	@PostMapping("cardDueDateUPD")
	public String cardDueDateUPD(Model model,@RequestParam Map<String,Object> pMap,HttpServletRequest req) {
		List<Map<String,Object>> cardList = null;
		HttpSession session = req.getSession();
		String mem_id = String.valueOf(session.getAttribute("MEM_ID"));
		pMap.put("mem_id2",mem_id);
		cardList = c_Logic.cardDueDateUPD(pMap);
		model.addAttribute("cardList",cardList);
		return "forward:../card/cardDueDateUPDResult.jsp";
		
	}
}