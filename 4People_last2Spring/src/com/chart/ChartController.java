package com.chart;

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
@RequestMapping(value="/chart/")
public class ChartController {
	@Autowired
	ChartLogic chartLogic = null;
	Logger logger =  Logger.getLogger(ChartController.class);
	@GetMapping("chartSel")
	public String ChartSel (@RequestParam("board_no") String board_no, Model model) {
		logger.info("ChartSel 호출");
		List<Map<String,Object>> chartList = chartLogic.ChartSel(board_no);
		model.addAttribute("chartList", chartList);
		return "forward:./chart.jsp";
	}
	@GetMapping("test")
	public String test (Model model) {
		logger.info("ChartSel 호출");
		//List<Map<String,Object>> chartList = chartLogic.ChartSel(board_no);
		//model.addAttribute("chartList", chartList);
		return "forward:./chart.jsp";
	}
}
