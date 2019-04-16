package com.websocket;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
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
	BufferedOutputStream bos;
    String path = "\\\\192.168.0.6\\pds\\";
	@OnOpen
	public void onOpen(Session session) {
		this.session = session;
	}
	 // 바이너리 데이터가 오게되면 호출된다.
    @OnMessage
    public void processUpload(ByteBuffer msg, boolean last, Session session) {
        
        while(msg.hasRemaining()){
            try {
                bos.write(msg.get());
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
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
		else if(gubun.equals("file")) {
			 // 클라이언트에서 파일이 끝났다는 신호로 "end" 문자열을 보낸다.
	        // data가 end가 아니라면 파일로 연결된 스트림을 연다.
			String fileName = element.getAsJsonObject().get("content").getAsString();
			
			System.out.println("========"+fileName);
			
	        if(!fileName.equals("end")){
	            
	            // 클라이언트에서 파일을 전송하기전 파일이름을 "file name:aaa.aaa" 형식으로 보낸다.
	            System.out.println(fileName);
	            File file = new File(path + fileName);
	            try {
	                bos = new BufferedOutputStream(new FileOutputStream(file));
	            } catch (FileNotFoundException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            }
	            
	        // data 가 end가 왔다면 전송이 완료되었음을 알리는 신호이므로 outputstream 을 닫아준다.
	        }else{
	            try {
	                bos.flush();
	                bos.close();
	                String roomGubun = element.getAsJsonObject().get("roomGubun").getAsString();
	                if(roomGubun.equals("pv_room")) {
	                	String chat_id = element.getAsJsonObject().get("id").getAsString();
	                	for(Object key:chatUsers.keySet()) {
	        				if(key.equals(chat_id)) {
	        					Session sess = (Session)chatUsers.get(key);
	        					sess.getAsyncRemote().sendText(data);
	        				}
	        			}
	                }
	                else if(roomGubun.equals("team_room")) {
	                	System.out.println("team_room 호출");
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
	                }
	                
	            } catch (IOException e) {
	                e.printStackTrace();
	            }
	        }
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
