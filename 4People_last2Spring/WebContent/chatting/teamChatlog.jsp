<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
String chat_id="";
String tlog_time="";
String tlog_content="";
String team_code="";
String chat_name="";
String mem_id=(String)session.getAttribute("MEM_ID");
String mem_name=(String)session.getAttribute("MEM_NAME");
String team_name = "";
String team_inwon ="";
	List<Map<String,Object>> teamChatlog = (List<Map<String,Object>>)request.getAttribute("teamChatlog");
	List<Map<String,Object>> teamChatMember = (List<Map<String,Object>>)request.getAttribute("teamChatMember");
	List<Map<String,Object>> team_member = new ArrayList<Map<String,Object>>();
	team_inwon = String.valueOf(teamChatMember.size()+1);
	for(Map<String,Object> pMap:teamChatMember){
		Map<String,Object> rMap = new HashMap<String,Object>();
		rMap.put("mem_id",pMap.get("MEM_ID"));
		team_member.add(rMap);
		team_name = (String)pMap.get("TEAM_NAME");
	}
	
%>
	<div class='container  es_rightshadow' style='width:100%; height:100%; padding-left:0;'>
	<!-- chat 헤드 시작 -->
	<div class="page-header" style="background-color:#64ABFA; margin-top:0;border-bottom: 1px solid #BDBDBD;">
		<a><img src='../images/priavateChatRoom.png' style='width:50px; height:50px;'></a>	
		<span style='margin-left:10px; margin-top:10px; font-size:2.2rem; font-weight:bold; color:white;'><%=team_name+" ("+team_inwon+")" %></span>	
		<div class="pull-right" style='padding:10px;'>
			<a href='#' class='header_margin'><i class="fa fa-cog fa-2x" aria-hidden="true"></i></a>
			<a href='javascript:chatClose()' class='header_margin' ><i class="fa fa-times fa-2x" aria-hidden="true"></i></a>
		</div>
	</div>
	<!-- chat 헤드 끝 -->
	


		<div class="container" id='chatScroll' style='width:100%; height:75%; border-right: 1px solid #BDBDBD; border-bottom: 1px solid #BDBDBD; overflow-y: scroll; '>
    <div class="chat" >   
      <div class="chat-history">
        <ul class="chat-ul" id='chattingText'>
        
        <%if(teamChatlog.size()>0&&teamChatlog!=null){
        	for(Map<String,Object>rMap:teamChatlog){
        		chat_id=(String)rMap.get("MEM_ID");
        		tlog_time=(String)rMap.get("TLOG_TIME");
        		tlog_content=(String)rMap.get("TLOG_CONTENT");
        		team_code=(String)rMap.get("TEAM_CODE");
        		chat_name=(String)rMap.get("MEM_NAME");
        		if(mem_id.equals(chat_id)){
        		%>
        <!-- 내가 입력시 -->	
			<li class="clearfix">
            <div class="message-data align-right">
              <span class="message-data-name"><%=chat_name %></span> <i class="fa fa-circle me"></i>
            </div>
            <div class="message me-message float-right"><%=tlog_content %>  </div>
          </li>				
        		<%}else{%>
        <!-- 상대방이 입력시 -->			
        	<li class="clearfix">
            <div class="message-data">
              <span class="message-data-name"><i class="fa fa-circle you"></i><%=chat_name %></span>
            </div>
            <div class="message you-message">
            <%=tlog_content %>
            </div>
          </li>	
        	<%}
        } }%>
        
        
        
        
         </ul>
        
      </div> <!-- end chat-history -->
      
    </div> 
    </div>
    <!-- end chat -->
    <div class='footer'>
    <div class='col-sm-12'>
    	<div class='col-sm-10'>
    	<textarea  id ='chat_text' style=' height:90px; margin-left:15px; margin-top:20px; width:100%; font-size:18px;' placeholder="insert here"></textarea>
    	</div>
    	<div class='col-sm-2'>
    	<button id='chat_btn' class='btn btn-success' style='margin-top:40px; width:200px; height:50px;' onclick='btn_chat()'>전송</button>
    	</div>
    </div>
	</div>
	<!-- end container -->
</div>
<script>
	function moveScroll (id) { 
	    var el = document.getElementById(id); 
	if (el.scrollHeight > 0) el.scrollTop = el.scrollHeight; 
	} 
	$(document).ready(function (){
		moveScroll('chatScroll');
		});
	function btn_chat(){
		var content = $('#chat_text').val();
		var chat_id = '<%=team_member%>';
		var team_code = '<%=team_code%>';
		var mem_name = '<%=mem_name%>';
		teamLogIns(content,team_code,mem_name);
			var obj ={
	  			 id : chat_id,
	  			 gubun : 'teamMessage',
	  			 content : content,
	  			 room_code : team_code,
	  			 mem_name : mem_name
	  		}
			var json = JSON.stringify(obj);
			chatSocket.send(json);
			var append = "<li class='clearfix'><div class='message-data align-right'>"
						+"<span class='message-data-name'>"+mem_name+"</span> <i class='fa fa-circle me'></i></div>"
						+"<div class='message me-message float-right'>"+content+"</div></li>";
			$('#chattingText').append(append);
			moveScroll('chatScroll');
			$('#chat_text').val('');
	}
	$("#chat_text").keydown(function(key) {
		
		if (key.keyCode == 13) {
			var content = $('#chat_text').val();
			var chat_id = '<%=team_member%>';
			var team_code = '<%=team_code%>';
			var mem_name = '<%=mem_name%>';
			teamLogIns(content,team_code,mem_name);
			var obj ={
		  			 id : chat_id,
		  			 gubun : 'teamMessage',
		  			 content : content,
		  			 room_code : team_code,
		  			 mem_name : mem_name
		  		}
				var json = JSON.stringify(obj);
				chatSocket.send(json);
				var append = "<li class='clearfix'><div class='message-data align-right'>"
					+"<span class='message-data-name'>"+mem_name+"</span> <i class='fa fa-circle me'></i></div>"
					+"<div class='message me-message float-right'>"+content+"</div></li>";
		$('#chattingText').append(append);
		moveScroll('chatScroll');
				$('#chat_text').val('');
		}
		});
	function teamLogIns(content,team_code,mem_name){
		var param = "tlog_content="+content+"&team_code="+team_code;
		 $.ajax({
			 type:'POST'
			 ,url:'./teamLogIns'
			 ,data:param
			 ,dataType:'text'
			 ,success:function(data){
				
			 }
		 	 ,error:function(e){
		 		 
		 	 }
		 });
		    $('#'+team_code+"col3mem_name").text('');
			$('#'+team_code+"col3time").text('');
			$('#'+team_code+"col3content").text('');
			$('#'+team_code+"col3mem_name").text(mem_name);
			$('#'+team_code+"col3time").text('방금전');
			$('#'+team_code+"col3content").text(content);
		}
	
	
</script>