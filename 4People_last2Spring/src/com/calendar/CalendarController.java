package com.calendar;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.forpeople.Controller;
import com.util.DateFormatter;
import com.util.HashMapBinder;
import com.vo.CalendarVO;

public class CalendarController implements Controller {
	CalendarLogic cal_logic = new CalendarLogic();
	String crud = null;
	String category = null;
	Logger logger = Logger.getLogger(CalendarController.class);
	
	public CalendarController(String category, String crud) {
		this.category = category;
		this.crud = crud;
	}

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String path = null;
		//Map<String, Object> pMap = new HashMap<String, Object>();
		//HashMapBinder binder = new HashMapBinder(req);
		//binder.bind(pMap);
		CalendarVO calVO = new CalendarVO();
		if("sel".equals(crud)) {
			logger.info("캘린더 조회 호출 성공");
			List<Map<String, Object>> calList = null;
			calList = cal_logic.calList(calVO);
			req.setAttribute("calList", calList);
			path="forward:/"+category+"/calendar.jsp";
		}
		else if("ins".equals(crud)) {
			logger.info("캘린더 입력 호출 성공");
			int result = 0;//입력 성공 여부 저장
			Map<String, Object> pMap = new HashMap<String, Object>();
			DateFormatter dateformat = new DateFormatter();
			HashMapBinder hmb = new HashMapBinder(req);
			hmb.bind(pMap);
			logger.info(pMap.get("cal_title"));
			logger.info(pMap.get("cal_startdate"));
			dateformat.calc_date(pMap);
			logger.info(pMap.get("cal_title"));
			logger.info(pMap.get("cal_startdate"));
			req.setAttribute("cal_startdate", pMap.get("cal_startdate"));
			req.setAttribute("cal_enddate", pMap.get("cal_enddate"));
			result = cal_logic.calIns(pMap);
			logger.info("result :"+result);
			if(result==1) {
				path="redirect:/4people/"+category+"/calList.for?crud=sel";
			}
			else if(result==0) {
				path="redirect:/"+category+"/calInsFail.jsp";
			}
		}
		else if("upd".equals(crud)) {
			logger.info("캘린더 수정 호출 성공");
			int result = 0;//수정 성공 여부 저장
			Map<String, Object> pMap = new HashMap<String, Object>();
			HashMapBinder hmb = new HashMapBinder(req);
			hmb.bind(pMap);
			result = cal_logic.calUpd(pMap);
			if(result==1) {
				path="redirect:/4people/"+category+"/calUpdSuccess.jsp";
			}
			else if(result==0) {
				path="redirect:/"+category+"/calUpdFail.jsp";
			}
		}
		else if("del".equals(crud)) {
			logger.info("캘린더 삭제 호출 성공");
			int result = 0;//수정 성공 여부 저장
			Map<String, Object> pMap = new HashMap<String, Object>();
			HashMapBinder hmb = new HashMapBinder(req);
			hmb.bind(pMap);
			result = cal_logic.calDel(pMap);
			if(result==1) {
				path="redirect:/"+category+"/calDelSuccess.jsp";
			}
			else if(result==0) {
				path="redirect:/"+category+"/calDelFail.jsp";
			}
		}
		
		return path;
	}

}
