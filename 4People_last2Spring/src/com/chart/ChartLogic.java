package com.chart;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vo.ChartVO;

@Service
public class ChartLogic {
	@Autowired
	ChartDao chartDao = null;
	Logger logger =Logger.getLogger(ChartLogic.class);
	public List<ChartVO> ChartSel(String mem_id) {
		logger.info("ChartSel 호출");
		List<ChartVO> chartVO = chartDao.ChartSel(mem_id);
		return chartVO;
	}
	public void ChartIns(ChartVO chartVO) {
		logger.info("ChartIns 호출");
		chartDao.ChartIns(chartVO);
	}
}
