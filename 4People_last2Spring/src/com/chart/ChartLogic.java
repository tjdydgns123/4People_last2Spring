package com.chart;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vo.ChartVO;

@Service
public class ChartLogic {
	@Autowired
	ChartDao chartDao = null;
	Logger logger =Logger.getLogger(ChartLogic.class);
	public List<ChartVO> chartList(String mem_id) {
		logger.info("chartList 호출");
		List<ChartVO> chartVO = chartDao.chartList(mem_id);
		return chartVO;
	}
	public void ChartIns(ChartVO chartVO) {
		logger.info("ChartIns 호출");
		chartDao.ChartIns(chartVO);
	}
	public void ChartDel(String no) {
		logger.info("ChartDel 호출");
		chartDao.ChartDel(no);
	}
	public void chartUpd(ChartVO chartVO) {
		logger.info("chartUpd 호출");
		chartDao.chartUpd(chartVO);
	}
}
