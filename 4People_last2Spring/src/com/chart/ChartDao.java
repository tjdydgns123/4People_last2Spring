package com.chart;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChartDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate = null;
	Logger logger = Logger.getLogger(ChartDao.class);
	public List<Map<String,Object>> ChartSel(String board_no) {
		logger.info("ChartSel 호출");
		List<Map<String,Object>> chartList = sqlSessionTemplate.selectList("chartSel",board_no);
		return chartList;
	}
}
