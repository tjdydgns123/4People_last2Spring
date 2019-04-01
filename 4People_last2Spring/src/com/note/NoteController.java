package com.note;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.json.JSONObject;

import com.forpeople.Controller;
import com.google.gson.Gson;
import com.team.TeamController;
import com.team.TeamLogic;
import com.util.HashMapBinder;

public class NoteController implements Controller {
	NoteLogic n_logic = new NoteLogic();
	String command = null;
	Logger logger=  Logger.getLogger(NoteController.class);
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		String path=null;
		String mb_code ="";
		String mb_content ="";
		String note_code="";
		HttpSession session = req.getSession();
		command = req.getParameter("command");
		if(command!=null) {
			if("newNote".equals(command)) {
				Map<String,Object> pMap = new HashMap<String,Object>();
				HashMapBinder binder = new HashMapBinder(req);
				binder.ajaxBind(pMap);
				logger.info("NoteController newNote 호출");
				for(String key:pMap.keySet()) {
					logger.info(key+" pMap:"+pMap.get(key));
					if(key.equals("mb_content")) {
						mb_content = (String)pMap.get(key);
					}
					if(key.equals("note_code")) {
						note_code = (String)pMap.get(key);
					}
				}
				mb_code = n_logic.newNote(pMap);
				logger.info("mb_code="+mb_code+"  mb_content="+mb_content+" note_code="+note_code);
				req.setAttribute("mb_code",mb_code);
				req.setAttribute("mb_content",mb_content);
				req.setAttribute("note_code",note_code);
				path = "forward:./newNoteResult.jsp";
			}//new note of end
			
			else if("noteDelete".equals(command)) {
				Map<String,Object> pMap = new HashMap<String,Object>();
				HashMapBinder binder = new HashMapBinder(req);
				binder.ajaxBind(pMap);
				logger.info("NoteController DeleteNote 호출");
				String mem_id = String.valueOf(session.getAttribute("MEM_ID"));
				for(String key:pMap.keySet()) {
					logger.info(key+" pMap:"+pMap.get(key));
				}
				List<Map<String,Object>> noteList = n_logic.DeleteNote(pMap,mem_id);
				req.setAttribute("noteList",noteList);
				path = "forward:./note2.jsp";
			}//delete of end
			
			else if("myBoard".equals(command)) {
				String mem_id = String.valueOf(session.getAttribute("MEM_ID"));
				logger.info("NoteController getNote 호출  아이디=="+mem_id);
				List<Map<String,Object>> noteList =n_logic.getNote(mem_id);
				req.setAttribute("noteList",noteList);
				path="forward:./note2.jsp";

			}//myBoard of end
			
			else if("sendSearch".equals(command)) {
				String mem_id = String.valueOf(session.getAttribute("MEM_ID"));
				logger.info("NoteController sendSearch 호출");
				Map<String,Object> pMap = new HashMap<String, Object>();
				pMap.put("mem_id",mem_id);
				String searchName = req.getParameter("searchName");
				logger.info("searchName[1]=="+searchName);
				pMap.put("searchName",searchName);
				List<Map<String,Object>> sendList = n_logic.getSend(pMap);
//				JSONObject obj = new JSONObject();
//				obj.put("sendList", sendList);
//				res.setContentType("application/json");
//				res.setCharacterEncoding("UTF-8");
//				String json = "";
//				Gson gson = new Gson();
//				for(int i =0;i<sendList.size();i++) {
////					gson += new Gson().toJson(sendList.get(i));
//				}
//				json += gson.toJson(sendList);
//				System.out.println("gson=="+json);
				req.setAttribute("sendList",sendList);
				
				path="forward:./sendSearchResult.jsp";
			}//sendSearch of end
			else if("sendNote".equals(command)) {
				String mb_sender = String.valueOf(session.getAttribute("MEM_ID"));
				logger.info("NoteController sendNote 호출");
				Map<String,Object> pMap = new HashMap<String, Object>();
				HashMapBinder binder = new HashMapBinder(req);
				binder.ajaxBind(pMap);
				pMap.put("mb_sender",mb_sender);
				String receive_id ="";
				for(Object key:pMap.keySet()) {
					if(key.equals("receive_id")) {
						receive_id = (String)pMap.get(key);
						pMap.remove("receive_id");
					}
				}
				String str[] = receive_id.split("\\[");
				String str2[] = str[1].split("\\]");
				String mem_id = str2[0];
				pMap.put("mem_id",mem_id);
				for(Object key:pMap.keySet()) {
					logger.info("key=="+key+"pMap=="+pMap.get(key));
				}
				int result=n_logic.sendNote(pMap);
				logger.info("result="+result);
				req.setAttribute("result",result);
				
				path="forward:./sendNoteResult.jsp";
			}
			else if("noteMessage".equals(command)) {
				logger.info("NoteController noteMessage호출");
				String mem_id = String.valueOf(session.getAttribute("MEM_ID"));
				List<Map<String,Object>> noteMessageList=n_logic.noteMessage(mem_id);
				req.setAttribute("noteMessageList",noteMessageList);
				path="forward:./noteMessageResult.jsp";
			}
			
			else if("insertMessage".equals(command)) {
				Map<String,Object> pMap = new HashMap<String,Object>();
				HashMapBinder binder = new HashMapBinder(req);
				binder.bind(pMap);
				for(Object key:pMap.keySet()) {
					logger.info("key="+key+" value="+pMap.get(key));
				}
				n_logic.insertMessage(pMap);
				path="redirect:note.for?command=myBoard";
			}
			else if("deleteMessage".equals(command)) {
				Map<String,Object> pMap = new HashMap<String,Object>();
				HashMapBinder binder = new HashMapBinder(req);
				binder.bind(pMap);
				for(Object key:pMap.keySet()) {
					logger.info("key="+key+" value="+pMap.get(key));
				}
				n_logic.deleteMessage(pMap);
				path="redirect:note.for?command=myBoard";
			}
		}
		
		
		
		
		
		return path;
	}

}
