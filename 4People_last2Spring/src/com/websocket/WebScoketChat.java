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

@ServerEndpoint("/ChatServer")
public class WebScoketChat {
	
	static Map<String,Object> chatUsers = new HashMap<String,Object>();
	Session session;
	
	
	@OnOpen
	public void onOpen(Session session) {
		this.session = session;
	}
	
	@OnMessage
	public void onMessage(String data, Session session) {
		System.out.println("data="+data);
		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(data);
		String gubun = element.getAsJsonObject().get("gubun").getAsString();
		if("open".equals(gubun)) {
			String id = element.getAsJsonObject().get("id").getAsString();
			if(chatUsers.containsKey(id)) {
				chatUsers.remove(id);
				chatUsers.put(id,session);
			}
			else {
				chatUsers.put(id,session);
			}
			System.out.println("채팅"+id);
			System.out.println(chatUsers.get(id).toString());
		}
		else if ("sendMessage".equals(gubun)) {
			String id = element.getAsJsonObject().get("id").getAsString();
			for(Object key:chatUsers.keySet()) {
				if(key.equals(id)) {
					Session sess = (Session)chatUsers.get(key);
					sess.getAsyncRemote().sendText(data);
				}
			}
		}
	}
	
	@OnClose
	public void onClose() {
		for(Object key:chatUsers.keySet()) {
			if(chatUsers.get(key)==this.session) {
				chatUsers.remove(key);
			}
		}
//		users.remove(this.session);
		System.out.println("closed!");
	}
	
	@OnError
	public void onError(Throwable t) {
//		users.remove(this.session);
		for(Object key:chatUsers.keySet()) {
			if(chatUsers.get(key)==this.session) {
				chatUsers.remove(key);
			}
		}
		t.printStackTrace();
	}
}
