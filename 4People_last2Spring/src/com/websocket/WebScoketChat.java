package com.websocket;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@ServerEndpoint("/ChatServer")
public class WebScoketChat {
	
	static Map<String,Object> chatUsers = new HashMap<String,Object>();
	Session session;
	String id;
	
	@OnOpen
	public void onOpen(Session session) {
		this.session = session;
	}
	
	@OnMessage
	public void onMessage(String data, Session session) {
		System.out.println("data="+data);
		System.out.println("----"+chatUsers.toString());
		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(data);
		String gubun = element.getAsJsonObject().get("gubun").getAsString();
		if("open".equals(gubun)) {
			this.id = element.getAsJsonObject().get("id").getAsString();
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
		//개인 대화방 메시지
		else if ("privateMessage".equals(gubun)) {
			String chat_id = element.getAsJsonObject().get("id").getAsString();
			for(Object key:chatUsers.keySet()) {
				if(key.equals(chat_id)) {
					Session sess = (Session)chatUsers.get(key);
					sess.getAsyncRemote().sendText(data);
				}
			}
		}
		//팀채팅 메시지
		else if("teamMessage".equals(gubun)) {
			String mem_id = element.getAsJsonObject().get("id").getAsString();
			JsonParser parser2 = new JsonParser();
			JsonElement element2 = parser2.parse(mem_id);
			JsonArray jsonArray = element2.getAsJsonArray();
			for(int i=0; i<jsonArray.size();i++) {
				JsonObject object = (JsonObject) jsonArray.get(i);
				String team_member = object.get("mem_id").getAsString();
				System.out.println("member="+team_member);
				for(Object key:chatUsers.keySet()) {
					if(key.equals(team_member)) {
						Session sess = (Session)chatUsers.get(key);
						sess.getAsyncRemote().sendText(data);
					}
				}
			}
			

//			JsonArray member = element.getAsJsonObject().get("id").getAsJsonArray();
//			for(int i=0; i<member.size();i++) {
//				System.out.println(member.get(i));
//			}
//			JsonParser parser2 = new JsonParser();
//			JsonObject jsonObject = (JsonObject)parser2.parse(mem_id);
//			JsonArray jsonArray = (JsonArray) jsonObject.get("list");
//			for(int i = 0; i < jsonArray.size(); i++ ){
//				System.out.println(jsonArray.get(i));
//			}
			
		}
	}
	
	@OnClose
	public void onClose() {
		Iterator<String> keys = chatUsers.keySet().iterator();
		while( keys.hasNext() ){
			String key = keys.next();
			if(key.equals(this.id)) {
				System.out.println("after="+chatUsers.size());
				keys.remove();
				System.out.println("before"+chatUsers.size());
			}
		}
//		users.remove(this.session);
		System.out.println("closed!");
	}
	
	@OnError
	public void onError(Throwable t) {
//		users.remove(this.session);
		Iterator<String> keys = chatUsers.keySet().iterator();
		while( keys.hasNext() ){
			String key = keys.next();
			if(key.equals(this.id)) {
				System.out.println("after="+chatUsers.size());
				keys.remove();
				System.out.println("before"+chatUsers.size());
			}
		}
		t.printStackTrace();
	}
}
