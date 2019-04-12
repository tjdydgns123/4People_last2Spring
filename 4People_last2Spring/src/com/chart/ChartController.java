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
	@GetMapping("chartSel")
	public String ChartSel (@RequestParam("mem_id") String mem_id, Model model) {
		logger.info("ChartSel 호출");
		List<ChartVO> chartVO = chartLogic.ChartSel(mem_id);
		model.addAttribute("chartList", chartVO);
		logger.info(chartVO.get(0).getLabel() + "," + chartVO.get(1).getLabel() );
		return "forward:./chart.jsp";
	}
	//차트 생성시 삽입
	@PostMapping("chartIns")
	public String chartIns (@RequestParam("mem_id") String mem_id, @ModelAttribute ChartVO chartVO) {
		logger.info("chartIns 호출");
		chartLogic.ChartIns(chartVO);
		logger.info(chartVO.getMem_id());
		return "forward:./chartSel";
	}
	@GetMapping("test")
	public String test (Model model) {
		logger.info("ChartSel 호출");
		//List<Map<String,Object>> chartList = chartLogic.ChartSel(board_no);
		//model.addAttribute("chartList", chartList);
		return "forward:./chart.jsp";
	}
}
