package com.chart;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.vo.ChartVO;

@Controller
@RequestMapping(value="/chart/", method = { RequestMethod.GET, RequestMethod.POST })
public class ChartController {
	@Autowired
	ChartLogic chartLogic = null;
	Logger logger =  Logger.getLogger(ChartController.class);
	//차트 메뉴 진입시 차트 목록 불러오기
	@GetMapping("chartList")
	public String chartList (@RequestParam("mem_id") String mem_id, Model model) {
		logger.info("chartList 호출");
		List<ChartVO> chartVO = chartLogic.chartList(mem_id);
		model.addAttribute("chartList", chartVO);
		model.addAttribute("mem_id", mem_id);
		return "forward:./chart.jsp";
	}
	//차트 생성
	@PostMapping("chartIns")
	public String chartIns (@ModelAttribute ChartVO chartVO) {
		logger.info("chartIns 호출");
		chartLogic.ChartIns(chartVO);
		return "forward:./chartList";
	}
	//선택한 차트 삭제
	@PostMapping("chartDel")
	public String chartDel (@RequestParam("no") String no) {
		logger.info("chartDel 호출");
		chartLogic.ChartDel(no);
		return "forward:./chartList";
	}
	//선택한 차트 수정
	@PostMapping("chartUpd")
	public String chartUpd (@ModelAttribute ChartVO chartVO) {
		logger.info("chartUpd 호출");
		chartLogic.chartUpd(chartVO);
		logger.info(chartVO.getData());
		return "forward:./chartList";
	}
	//선택한 차트 보여주기
	@PostMapping("chartDetail")
	public String chartDetail (@RequestParam("no") String no, Model model) {
		logger.info("chartDetail 호출" + no);
		ChartVO chartVO = chartLogic.chartDetail(no);
		model.addAttribute("chartDetail", chartVO);
		return "forward:chartDetail.jsp";
	}
	
	@GetMapping("test")
	public String test (Model model) {
		logger.info("ChartSel 호출");
		//List<Map<String,Object>> chartList = chartLogic.ChartSel(board_no);
		//model.addAttribute("chartList", chartList);
		return "forward:./chart.jsp";
	}
}
