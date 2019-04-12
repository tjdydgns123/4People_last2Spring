package com.chart;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vo.ChartVO;

@Repository
public class ChartDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate = null;
	Logger logger = Logger.getLogger(ChartDao.class);
	public List<ChartVO> ChartSel(String mem_id) {
		logger.info("ChartSel 호출");
		List<ChartVO> chartVO = sqlSessionTemplate.selectList("chartSel",mem_id);
		logger.info(chartVO.get(0).getChartname());
		return chartVO;
	}
	public void ChartIns(ChartVO chartVO) {
		logger.info("ChartIns 호출");
		sqlSessionTemplate.insert("chartIns", chartVO);
	}
}
