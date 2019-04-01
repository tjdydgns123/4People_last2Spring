package com.team;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.forpeople.Controller;
import com.util.HashMapBinder;

public class TeamController implements Controller {
	TeamLogic t_logic = new TeamLogic();
	String command = null;
	Logger logger=  Logger.getLogger(TeamController.class);
	
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String path=null;
		HttpSession session = req.getSession();
		command = req.getParameter("command");
		
		if(command!=null) {
			if("board".equals(command)) {
				Map<String,Object> pMap = new HashMap<String,Object>();
				HashMapBinder binder = new HashMapBinder(req);
				binder.bind(pMap);
				logger.info("TeamController board 호출");
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
				for(Object key:pMap.keySet()) {
					logger.info("key=="+key+" value=="+pMap.get(key));
				}
				logger.info("boardList.size"+boardList.size());
				req.setAttribute("team",boardList);
				req.setAttribute("gubun","board");
				path="forward:./teamLoading.jsp";
				for(Map<String,Object> rMap:boardList) {
					for(String key:rMap.keySet()) {
						logger.info(key+" rMap:"+rMap.get(key));
						
					}
				}
			}
			//member정보
			else if("member".equals(command)) {
				logger.info("TeamController member 호출");
				Map<String,Object> pMap = new HashMap<String,Object>();
				HashMapBinder binder = new HashMapBinder(req);
				binder.ajaxBind(pMap);
				String team_code = String.valueOf(session.getAttribute("team_code"));
				pMap.put("team_code",team_code);
				for(String key:pMap.keySet()) {
					logger.info(key+" pMap:"+pMap.get(key));
					//회원검색을 햇을때 파라미터값으로 mem_name이 넘어온다 그떄 url주소를  ./teamMemberResult.jsp 로 설정해줌
					if(pMap.containsKey("mem_name")) {
						String mem_name = (String)pMap.get("mem_name");
						path="forward:./teamMemberResult.jsp";
					}
					//회원검색을 하지않앗을떄(일반요청)
					else {
						
						path="forward:./teamLoading.jsp";
						//member로 구분
						req.setAttribute("gubun","member");
					}
				}
				List<Map<String,Object>> memberList=t_logic.getMember(pMap);
				logger.info("boardList.size"+memberList.size());
				
				for(int i=0; i<memberList.size(); i++) {
					Map<String,Object> rMap = memberList.get(i);
					for(String key:rMap.keySet()) {
						if(key.equals("TEAM_NAME")) {
							req.setAttribute("TEAM_NAME",rMap.get(key));
							logger.info("TEAM_NAME="+rMap.get(key));
							
						}
						else if(key.equals("TEAM_LEADER")) {
							req.setAttribute("TEAM_LEADER",rMap.get(key));
							logger.info("TEAM_LEADER="+rMap.get(key));
						}
						
					}
					if(rMap.containsKey("TEAM_NAME")||rMap.containsKey("TEAM_LEADER")) {
						memberList.remove(i);
					}
				}
				req.setAttribute("team",memberList);
			}
			//친구초대 검색시||친구초대시
			else if("invite".equals(command)) {
				
				Map<String,Object> pMap = new HashMap<String,Object>();
				HashMapBinder binder = new HashMapBinder(req);
				binder.ajaxBind(pMap);
				String team_code = String.valueOf(session.getAttribute("team_code"));
				pMap.put("team_code",team_code);
				for(String key:pMap.keySet()) {
					logger.info(key+" pMap:"+pMap.get(key));
				}
				//초대 버튼을 눌럿을떄.
				if(pMap.containsKey("inviteMember")) {
					logger.info("TeamController inviteMember 호출");
					pMap.put("p_role","미정");
					t_logic.inviteMember(pMap);
					
					path="forward:./inviteResult.jsp";
				}
				//초대하기위해 검색을했을떄.
				else {
					logger.info("TeamController inviteList 호출");
					Map<String,Object> rMap=t_logic.getInvite(pMap);
					logger.info("boardList.size"+rMap.size());
					
						for(String key:rMap.keySet()) {
							logger.info(key+" rMap:"+rMap.get(key));
							
						}
					
					req.setAttribute("inviteList",rMap);
					path="forward:./inviteMemberResult.jsp";
				}
				
			}
		}
		logger.info("path:"+path);
		return path;
	}

}
