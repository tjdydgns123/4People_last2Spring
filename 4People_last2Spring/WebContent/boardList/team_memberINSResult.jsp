<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import ="java.util.*" %> 
 <%
 List<Map<String,Object>> board_List =(List<Map<String,Object>>)request.getAttribute("b_boardList");
 String t_team_name = null;
 String top_board_name = null;
 List<String> profile_image =new ArrayList<String>();
 List<String> profileMap = null;
 if(board_List!=null){
		t_team_name=board_List.get(0).get("team_name").toString();
		top_board_name=board_List.get(0).get("board_name").toString();
		profileMap =(List<String>) board_List.get(0).get("porfileMap");
}
 if(profileMap!=null){
		Iterator porfiletr = profileMap.iterator();
		while(porfiletr.hasNext()){
			Map<String,Object> pMap = (Map<String,Object>)porfiletr.next();
			Object keys[] = pMap.keySet().toArray();
			for(int j=0;j<keys.length;j++){
				if(keys[j].equals("mem_image")){
					profile_image.add(pMap.get(keys[j]).toString());
				}
			}
		}}
 %>
    
    <h3 class="panel-title"><img src="../images/meeting.png">&nbsp;&nbsp;<%=t_team_name %>&nbsp;&nbsp;|&nbsp;&nbsp;<%=top_board_name %>&nbsp;&nbsp;|&nbsp;&nbsp;
        <%if(profileMap!=null){
        	for(int i=0;i<profile_image.size();i++){%>
        <img src="http://localhost:9000/4People_last2Spring/pds/<%=profile_image.get(i)%>" style="width:40px;height:40px">&nbsp;
        <%}} %>
        <button style="background-color:#FFFFFF; color:#000000;height:40px; border-radius: 8px 8px 8px 10px; border:0;" onClick="mem_name_ajax2()" data-target="#label_modal4" data-toggle="modal">+추가</button>
        </h3>