package com.team;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/team/")
public class TeamController {
	@Autowired
	TeamLogic t_logic = null;
	Logger logger=  Logger.getLogger(TeamController.class);
	HttpSession session =null;
	
	@GetMapping("newTeam")
	public String newTeam(HttpServletRequest req,Model model,@RequestParam Map<String,Object> pMap) {
		session = req.getSession();
		String mem_id = String.valueOf(session.getAttribute("MEM_ID"));
		pMap.put("mem_id",mem_id);
		String team_code=t_logic.newTeam(pMap);
//		model.addAttribute("team_code",team_code);
		return "redirect:board?team_code="+team_code;
	}
	
	
	@GetMapping("board")
	public String board(HttpServletRequest req,Model model,@RequestParam Map<String,Object> pMap) {
		session = req.getSession();
		String mem_id = String.valueOf(session.getAttribute("MEM_ID"));
		pMap.put("mem_id",mem_id);
		List<Map<String,Object>> boardList=t_logic.getBoards(pMap);
		String team_code = req.getParameter("team_code");
		if(team_code!=null) {
			if(session.getAttribute("team_code")==null) {
				session.setAttribute("team_code",team_code);
			}
			else {
				session.removeAttribute("team_code");
				session.setAttribute("team_code",team_code);
			}
		}
		model.addAttribute("team",boardList);
		model.addAttribute("gubun","board");
		return "forward:teamLoading.jsp";
		
	}
	
	@RequestMapping("member")
	public String member(HttpServletRequest req,Model model,@RequestParam Map<String,Object> pMap) {
		String path="";
		session = req.getSession();
		String team_code = String.valueOf(session.getAttribute("team_code"));
		pMap.put("team_code",team_code);
		for(String key:pMap.keySet()) {
			//회원검색을 햇을때 파라미터값으로 mem_name이 넘어온다 그떄 url주소를  ./teamMemberResult.jsp 로 설정해줌
			if(pMap.containsKey("mem_name")) {
				String mem_name = (String)pMap.get("mem_name");
				path="forward:teamMemberResult.jsp";
			}
			//회원검색을 하지않앗을떄(일반요청)
			else {
				path="forward:teamLoading.jsp";
				//member로 구분
				model.addAttribute("gubun","member");
			}
		}
		List<Map<String,Object>> memberList=t_logic.getMember(pMap);
		for(int i=0; i<memberList.size(); i++) {
			Map<String,Object> rMap = memberList.get(i);
			for(String key:rMap.keySet()) {
				if(key.equals("TEAM_NAME")) {
					model.addAttribute("TEAM_NAME",rMap.get(key));
				}
				else if(key.equals("TEAM_LEADER")) {
					model.addAttribute("TEAM_LEADER",rMap.get(key));
				}
			}
			if(rMap.containsKey("TEAM_NAME")||rMap.containsKey("TEAM_LEADER")) {
				memberList.remove(i);
			}
		}
		model.addAttribute("team",memberList);
		return path;
	}
	@RequestMapping("member3")
	public String member3(HttpServletRequest req,Model model,@RequestParam Map<String,Object> pMap) {
		String path="";
		for(String key:pMap.keySet()) {
			//회원검색을 햇을때 파라미터값으로 mem_name이 넘어온다 그떄 url주소를  ./teamMemberResult.jsp 로 설정해줌
			if(pMap.containsKey("mem_name")) {
				String mem_name = (String)pMap.get("mem_name");
				path="forward:teamMemberResult3.jsp";
			}
			//회원검색을 하지않앗을떄(일반요청)
			else {
				path="forward:teamLoading.jsp";
				//member로 구분
				model.addAttribute("gubun","member");
			}
		}
		List<Map<String,Object>> memberList=t_logic.getMember3(pMap);
		for(int i=0; i<memberList.size(); i++) {
			Map<String,Object> rMap = memberList.get(i);
			for(String key:rMap.keySet()) {
				if(key.equals("TEAM_NAME")) {
					model.addAttribute("TEAM_NAME",rMap.get(key));
				}
				else if(key.equals("TEAM_LEADER")) {
					model.addAttribute("TEAM_LEADER",rMap.get(key));
				}
			}
			if(rMap.containsKey("TEAM_NAME")||rMap.containsKey("TEAM_LEADER")) {
				memberList.remove(i);
			}
		}
		model.addAttribute("team",memberList);
		return path;
	}
	@RequestMapping("member2")
	public String member2(HttpServletRequest req,Model model,@RequestParam Map<String,Object> pMap) {
		logger.info("member2호출");
		String path="";
		session = req.getSession();
//		String team_code = String.valueOf(session.getAttribute("team_code"));
//		pMap.put("team_code",team_code);
		for(String key:pMap.keySet()) {
			//회원검색을 햇을때 파라미터값으로 mem_name이 넘어온다 그떄 url주소를  ./teamMemberResult.jsp 로 설정해줌
			if(pMap.containsKey("mem_name")) {
				String mem_name = (String)pMap.get("mem_name");
				path="forward:teamMemberResult2.jsp";
			}
			//회원검색을 하지않앗을떄(일반요청)
			else {
				path="forward:teamLoading.jsp";
				//member로 구분
				model.addAttribute("gubun","member");
			}
		}
		List<Map<String,Object>> memberList=t_logic.getMember2(pMap);
		logger.info(memberList);
		for(int i=0; i<memberList.size(); i++) {
			Map<String,Object> rMap = memberList.get(i);
			for(String key:rMap.keySet()) {
				if(key.equals("TEAM_NAME")) {
					model.addAttribute("TEAM_NAME",rMap.get(key));
				}
				else if(key.equals("TEAM_LEADER")) {
					model.addAttribute("TEAM_LEADER",rMap.get(key));
				}
			}
			if(rMap.containsKey("TEAM_NAME")||rMap.containsKey("TEAM_LEADER")) {
				memberList.remove(i);
			}
		}
		model.addAttribute("team",memberList);
		return path;
	}
	
	@PostMapping("invite")
	public String invite(HttpServletRequest req,Model model,@RequestParam Map<String,Object> pMap) {
		String path="";
		session = req.getSession();
		String team_code = String.valueOf(session.getAttribute("team_code"));
		pMap.put("team_code",team_code);
		//초대 버튼을 눌럿을떄.
		if(pMap.containsKey("inviteMember")) {
			pMap.put("p_role","미정");
			t_logic.inviteMember(pMap);
			path="forward:inviteResult.jsp";
		}
		//초대하기위해 검색을했을떄.
		else {
			Map<String,Object> rMap=t_logic.getInvite(pMap);
			model.addAttribute("inviteList",rMap);
			path="forward:inviteMemberResult.jsp";
		}
		return path;
	}
	@GetMapping("teamOut")
	public String teamOut(HttpServletRequest req,@RequestParam Map<String,Object> pMap) {
		logger.info("teamOut호출");
		logger.info("mem_id : " + pMap.get("mem_id"));
			String mem_id = (String) pMap.get("mem_id");
			
		t_logic.teamOut(pMap);
		return "forward:../board/boardlist?mem_id="+mem_id;
	}
}
