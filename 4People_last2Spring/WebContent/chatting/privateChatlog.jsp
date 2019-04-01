<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
List<Map<String,Object>> privateChatlog = (List<Map<String,Object>>)request.getAttribute("privateChatlog");
String id = "";
String chat_id = (String)request.getAttribute("chat_id");
String pvLog_time = "";
String pvLog_content ="";
String pvRoom_code ="";
String mem_id = (String)session.getAttribute("MEM_ID");
String mem_name =(String)session.getAttribute("MEM_NAME");;
String chat_name = (String)request.getAttribute("chat_name");%>

	<div class='container  es_rightshadow' style='width:100%; height:100%; padding-left:0;'>
	<!-- chat 헤드 시작 -->
	<div class="page-header" style="background-color:#64ABFA; margin-top:0;border-bottom: 1px solid #BDBDBD;">
		<a><img src='../images/priavateChatRoom.png' style='width:50px; height:50px;'></a>	
		<span style='margin-left:10px; margin-top:10px; font-size:2.2rem; font-weight:bold; color:white;'><%=chat_name+"님 과의 채팅방" %></span>	
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



<%if(privateChatlog!=null){
	for(Map<String,Object>rMap:privateChatlog){
		id=(String)rMap.get("MEM_ID");
		pvLog_time=(String)rMap.get("PVLOG_TIME");
		pvLog_content=(String)rMap.get("PVLOG_CONTENT");
		pvRoom_code=(String)rMap.get("PVROOM_CODE");
			if(mem_id.equals(id)){
			%>
<!-- 내가 입력시 -->	
			<li class="clearfix">
            <div class="message-data align-right">
              <span class="message-data-name"><%=mem_name %></span> <i class="fa fa-circle me"></i>
            </div>
            <div class="message me-message float-right"><%=pvLog_content %>  </div>
          </li>		
		<%}else{%>
		
<!-- 상대방이 입력시 -->		
		<li class="clearfix">
            <div class="message-data">
              <span class="message-data-name"><i class="fa fa-circle you"></i><%=chat_name %></span>
            </div>
            <div class="message you-message">
            <%=pvLog_content %>
            </div>
          </li>
		
		<%}%>
	<%}
}
%>

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
	function btn_chat(){
		var content = $('#chat_text').val();
		var chat_id = '<%=chat_id%>';
		var pvRoom_code = '<%=pvRoom_code%>';
		var mem_name = '<%=mem_name%>';
			var obj ={
	  			 id : chat_id,
	  			 gubun : 'sendMessage',
	  			 content : content,
	  			 room_code : pvRoom_code,
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
			var chat_id = '<%=chat_id%>';
			var mem_name = '<%=mem_name%>';
			var pvRoom_code = '<%=pvRoom_code%>';
			var obj ={
		  			 id : chat_id,
		  			 gubun : 'sendMessage',
		  			 content : content,
		  			 room_code : pvRoom_code,
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
	
	
</script>