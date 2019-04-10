package com.chart;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChartLogic {
	@Autowired
	ChartDao chartDao = null;
	Logger logger =Logger.getLogger(ChartLogic.class);
	public List<Map<String,Object>> ChartSel(String board_no) {
		logger.info("ChartSel 호출");
		List<Map<String,Object>> chartList = chartDao.ChartSel(board_no);
		return chartList;
	}
}
