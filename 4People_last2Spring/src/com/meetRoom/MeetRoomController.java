package com.meetRoom;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.forpeople.Controller;
import com.util.HashMapBinder;

import com.vo.MeetRoomVO;

public class MeetRoomController implements Controller {
	Logger logger = Logger.getLogger(MeetRoomController.class);
	MeetRoomLogic mtRoom_logic = new MeetRoomLogic();
	
	
	String crud;
	String path;
	

	/*public MeetRoomController(String work, String requestName, String crud) {
		this.work = work;
		this.requestName = requestName;
		this.crud = crud;
	}*/
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		crud = req.getParameter("crud");
		logger.info("crud==>"+crud);
		Map<String,Object> pMap = new HashMap<String,Object>();
		HashMapBinder binder = new HashMapBinder(req);
		binder.bind(pMap);
		if ("sel".equals(crud)) {
			logger.info("회의실 조회 호출");
			// insert here
			
//			 * 스프링의 경우에는 사용자가 입력한 값을 서버측에서 요청하는 코드를 생략할 수 있다.
//			 * 왜냐하면 @ModelAttribute와 @RequestParam 두 가지 객체를 지원하므로 
//			 * @ModelAttribute에는 VO타입을 담을 수 있다
//			 * @RequestParam
			 
			MeetRoomVO mrVO = new MeetRoomVO();
			
			mrVO.setMr_image(req.getParameter("mr_image"));
			mrVO.setMr_name(req.getParameter("mr_name"));
			mrVO.setMr_loc(req.getParameter("mr_loc"));
			mrVO.setMr_master(req.getParameter("mr_master"));
			mrVO.setMr_starttime(req.getParameter("mr_starttime"));
			mrVO.setMr_endtime(req.getParameter("mr_endtime"));
			mrVO.setMr_capacity(req.getParameter("mr_capacity"));
			mrVO.setMr_facility(req.getParameter("mr_facility"));
			mrVO.setMr_memo(req.getParameter("mr_memo"));
			List<Map<String, Object>> roomList = null;
			roomList = mtRoom_logic.roomList(mrVO);
			req.setAttribute("roomList", roomList);
			
			// foarward처리
			path = "forward:./jsonMeetRoomList.jsp";
			logger.info("path:"+path);
			logger.info("roomList:"+roomList);
			/*RequestDispatcher view = req.getRequestDispatcher(path);
			view.forward(req, res);*/
		}
		else if("ins".equals(crud)) {
		
			logger.info(req.getParameter("mr_image"));
			logger.info(req.getParameter("mr_name"));
			logger.info(req.getParameter("mr_loc"));
			logger.info("회의실 입력 호출");
			int result=0;
			
			mtRoom_logic.meetRoomIns(pMap);
			result = mtRoom_logic.meetRoomIns(pMap);
			if(result==1) {//1이면 등록성공 
				this.path="redirect:./meetRoomSuccess.jsp";
			}else if(result ==0) {//0이면 등록 실패
				this.path="redirect:./meetRoomFail.jsp";
			}
			
		}
		logger.info("path:"+path);
		return path;
		
	}
	
}
