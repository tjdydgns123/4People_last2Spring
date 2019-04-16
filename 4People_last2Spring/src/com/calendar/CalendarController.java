package com.calendar;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.vo.CalendarVO;

@Controller
@RequestMapping(value="/calendar/")
public class CalendarController{
	Logger logger = Logger.getLogger(CalendarController.class);
	@Autowired
	CalendarLogic calLogic = null;
	
	//캘린더 개인 일정 조회
	@GetMapping("calList")
	public String calList(HttpServletRequest req, @ModelAttribute CalendarVO calVO
						 , Model model) {
		logger.info("캘린더 조회 호출 성공");
		HttpSession session = req.getSession();
	    String mem_id= String.valueOf(session.getAttribute("MEM_ID"));
	    calVO.setMem_id(mem_id);
		List<Map<String, Object>> calList = null;
		List<Map<String, Object>> calTeamList = null;
		List<Map<String, Object>> calTeamCount = null;
		String path = "";
		calList = calLogic.calList(calVO);
		calTeamList = calLogic.calTeamList(calVO);
		calTeamCount = calLogic.calTeamCount(calVO);
		model.addAttribute("calList", calList);
		model.addAttribute("calTeamList", calTeamList);
		model.addAttribute("calTeamCount", calTeamCount);
		logger.info("calList :"+calList);
		return "forward:calendar.jsp";
	}
	//캘린더 개인 일정 입력
	@GetMapping("calINS")
	public String calINS(@ModelAttribute CalendarVO calVO) {
		logger.info("캘린더 입력 호출 성공");
		int result = 0;
		result = calLogic.calINS(calVO);
		logger.info("result :"+result);
		return "redirect:calList?gubun=INS";
	}
	//캘린더 개인 일정 수정
	@GetMapping("calUPD")
	public String calUPD(@ModelAttribute CalendarVO calVO) {
		logger.info("캘린더 수정 호출 성공");
		int result = 0;
		result = calLogic.calUPD(calVO);
		logger.info("result :"+result);
		return "redirect:calList?gubun=UPD";
	}
	//캘린더 개인 일정 삭제
	@GetMapping("calDEL")
	public String calDEL(@ModelAttribute CalendarVO calVO) {
		logger.info("캘린더 삭제 호출 성공");
		int result = 0;
		result = calLogic.calDEL(calVO);
		logger.info("result :"+result);
		return "redirect:calList?gubun=DEL";
	}
	/*
	 * //캘린더 팀 일정 조회
	 * 
	 * @GetMapping("calTeamList") public String calTeamList(@ModelAttribute
	 * CalendarVO calVO , Model model) { logger.info("캘린더 팀 일정 조회 호출 성공");
	 * List<Map<String, Object>> calList = null; String path = ""; calList =
	 * calLogic.calList(calVO);
	 * 
	 * model.addAttribute("calList", calList); logger.info("calList :"+calList);
	 * return "forward:calendar.jsp"; }
	 */
/*
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
	}*/

}
