package com.meetRoom;

import java.util.Map;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping(value="/meetRoom/")
public class MeetRoomController {
	Logger logger = Logger.getLogger(MeetRoomController.class);
	@Autowired
	MeetRoomLogic mtRoom_logic =null;
	
	@PostMapping("meetRoomIns")
	public String meetRoomIns(Model model,@RequestParam Map<String,Object> pMap) {
		
		for(String key:pMap.keySet()) {
			System.out.println("key=="+key+" value=="+pMap.get(key));
		}
		mtRoom_logic.meetRoomIns(pMap);
		return "redirect:meetMain.jsp";
	}
	
}
