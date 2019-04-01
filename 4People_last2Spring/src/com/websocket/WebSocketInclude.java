package com.websocket;

import java.util.HashMap;
import java.util.Map;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;


import com.google.gson.JsonElement;
import com.google.gson.JsonParser;







@ServerEndpoint("/WebSocketServer")
public class WebSocketInclude {

//	static List<Session> users = new ArrayList<>();
	static Map<String,Object> users =new HashMap<String,Object>();
	Session session;
	
	@OnOpen
	public void onOpen(Session session) {
		this.session = session;
//		users.add(session);
	}

	@OnMessage
	public void onMessage(String data, Session session) {
		System.out.println("data="+data);
		
		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(data);
		String gubun = element.getAsJsonObject().get("gubun").getAsString();
		if("open".equals(gubun)) {
			String id = element.getAsJsonObject().get("id").getAsString();
			if(users.containsKey(id)) {
				users.remove(id);
				users.put(id,session);
			}
			else {
				users.put(id,session);
			}
			System.out.println(id);
			System.out.println(users.get(id).toString());
		}
		else if("sendNote".equals(gubun)) {
			String id = element.getAsJsonObject().get("id").getAsString();
			for(Object key:users.keySet()) {
				if(key.equals(id)) {
					System.out.println("적합");
					session = (Session)users.get(key);
					session.getAsyncRemote().sendText(data);
				}
			}
		}
//		Map<String,Object> uMap = new HashMap<String, Object>();
		
//		uMap.put("session",session);
//		uMap.put("mem_id",id);
//		uMap.put("mem_name",name);
//		users.add(uMap);
		
//		for (Session sess : users) {
//			sess.getAsyncRemote().sendText(data);
//		}
		



	}
	
	@OnClose
	public void onClose() {
		for(Object key:users.keySet()) {
			if(users.get(key)==this.session) {
				System.out.println("after="+users.size());
				users.remove(key);
				System.out.println("before"+users.size());
			}
		}
//		users.remove(this.session);
		System.out.println("closed!");
	}

	@OnError
	public void onError(Throwable t) {
//		users.remove(this.session);
		for(Object key:users.keySet()) {
			if(users.get(key)==this.session) {
				users.remove(key);
			}
		}
		t.printStackTrace();
	}


}
