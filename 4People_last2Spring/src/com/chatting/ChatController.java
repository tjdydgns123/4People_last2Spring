package com.chatting;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.forpeople.Controller;
import com.util.HashMapBinder;

public class ChatController implements Controller {
	ChatLogic c_Logic = new ChatLogic();
	String command = null;
	Logger logger = Logger.getLogger(ChatController.class);
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String path = null;
		HttpSession session = req.getSession();
		HashMapBinder binder = new HashMapBinder(req);
		command = req.getParameter("command");
		
		if(command!=null) {
			if("teamChat".equals(command)) {
				
				path="forward:./changeTeam.jsp";
			}
			else if("privateChat".equals(command)) {
				String mem_id = String.valueOf(session.getAttribute("MEM_ID"));
				List<Map<String,Object>> getPrivate = c_Logic.getPrivate(mem_id);
				req.setAttribute("getPrivate", getPrivate);
				
				
				path = "forward:./changePrivate.jsp";
			}
			else if("privateChatlog".equals(command)) {
				Map<String,Object> pMap = new HashMap<String, Object>();
				binder.ajaxBind(pMap);
				String chat_name = req.getParameter("chat_name");
				String chat_id = req.getParameter("chat_id");
				List<Map<String,Object>> privateChatlog = c_Logic.privateChatlog(pMap);
				req.setAttribute("privateChatlog",privateChatlog);
				req.setAttribute("chat_name",chat_name);
				req.setAttribute("chat_id",chat_id);
				path="forward:./privateChatlog.jsp";
			}
		}
		return path;
	}

}
