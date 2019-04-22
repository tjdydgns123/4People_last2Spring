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
    	<button type="button"class="btn btn-default pull-right" style="text-align:left; margin-top:5px; width:100%; background-color:#FFF;" onClick="buttonFile(event)"><img src="../images/folder.png">
    	<span style='font-size:20px; color:#F15F5F; font-weight:bolder;'>첨부파일</span>
    	</button>
    	<input id="chat_file" type="file" class="uploadBtn" style="display:none;">
    	<button id='chat_btn' class='btn btn-success' style='margin-top:6px; width:200px; height:50px;' onclick='btn_chat()'>전송</button>
    	
    	</div>
    </div>
	</div>
	<!-- end container -->
</div>

<script>
	$(document).ready(function (){
		moveScroll('chatScroll');
		});
	 $("#chat_file").change(function(e){
		 var file = document.getElementById('chat_file').files[0];
		 $('#chat_text').val('파일: '+file.name);
		 });
	function moveScroll (id) { 
	    var el = document.getElementById(id); 
	if (el.scrollHeight > 0) el.scrollTop = el.scrollHeight; 
	} 
	function btn_chat(){
		var file = document.getElementById('chat_file').files[0];
	   
	    if(file==null){
	    	var content = $('#chat_text').val();
			var chat_id = '<%=chat_id%>';
			var pvRoom_code = '<%=pvRoom_code%>';
			var mem_name = '<%=mem_name%>';
			chatLogIns(content,pvRoom_code,mem_name);
				var obj ={
		  			 id : chat_id,
		  			 gubun : 'privateMessage',
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
		    }
	    else{
	    	$('#chat_text').val('파일:'+file.name);
	    	 sendFile(file);
		    }
				moveScroll('chatScroll');
				$('#chat_text').val('');
	
	}
	$("#chat_text").keydown(function(key) {
		
		if (key.keyCode == 13) {
			var content = $('#chat_text').val();
			var chat_id = '<%=chat_id%>';
			var mem_name = '<%=mem_name%>';
			var pvRoom_code = '<%=pvRoom_code%>';
			chatLogIns(content,pvRoom_code,mem_name);
			var obj ={
		  			 id : chat_id,
		  			 gubun : 'privateMessage',
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
	function chatLogIns(content,pvRoom_code,mem_name){
		var param = "pvlog_content="+content+"&pvroom_code="+pvRoom_code;
		 $.ajax({
			 type:'POST'
			 ,url:'./chatLogIns'
			 ,data:param
			 ,dataType:'text'
			 ,success:function(data){
				
			 }
		 	 ,error:function(e){
		 		 
		 	 }
		 });
		    $('#'+pvRoom_code+"col3mem_name").text('');
			$('#'+pvRoom_code+"col3time").text('');
			$('#'+pvRoom_code+"col3content").text('');
			$('#'+pvRoom_code+"col3mem_name").text(mem_name);
			$('#'+pvRoom_code+"col3time").text('방금전');
			$('#'+pvRoom_code+"col3content").text(content);
		}
	//파일전송 부분
	function sendFile(file){
		
// 		 alert(file.name);
		 var chat_id = '<%=chat_id%>';
		 var pvRoom_code = '<%=pvRoom_code%>';
		 var mem_name = '<%=mem_name%>';
		 var pvRoom_code = '<%=pvRoom_code%>';
	var obj ={
 			 id : chat_id,
 			 gubun : 'file',
 			 content : file.name,
 			 room_code : pvRoom_code,
 			 mem_name : mem_name
 		}
		var json = JSON.stringify(obj);
	chatSocket.send(json);
// 	alert('test');
	var reader = new FileReader();
	var rawData = new ArrayBuffer(); 
	reader.loadend = function() {
	}

	reader.onload = function(e) {
	rawData = e.target.result;
	chatSocket.send(rawData);
	alert("파일 전송이 완료 되었습니다.")
	var obj ={
			 id : chat_id,
			 gubun : 'file',
			 content : 'end',
			 room_code : pvRoom_code,
			 fileName : file.name,
			 mem_name : mem_name,
			 roomGubun : 'pv_room'
		}
		var json = JSON.stringify(obj);
	chatSocket.send(json);
	}

	reader.readAsArrayBuffer(file);

		 var append = "<li class='clearfix'><div class='message-data align-right'>"
				+"<span class='message-data-name'>"+mem_name+"</span> <i class='fa fa-circle me'></i></div>"
				+"<div class='message me-message float-right'><span style='font-size:17px;font-weight:bold;'>파일:&nbsp;&nbsp;&nbsp;</span><button id='"+file.name+"'class='btn btn-success btn-lg' onclick='fileDown(id)'>"+file.name+"</button></div></li>";	 
	$('#chattingText').append(append);
	moveScroll('chatScroll');
	$('#chat_text').val('');
	 $('#'+pvRoom_code+"col3mem_name").text('');
		$('#'+pvRoom_code+"col3time").text('');
		$('#'+pvRoom_code+"col3content").text('');
		$('#'+pvRoom_code+"col3mem_name").text(mem_name);
		$('#'+pvRoom_code+"col3time").text('방금전');
		$('#'+pvRoom_code+"col3content").text('파일');
	}

// 	function addEvent(){
// 	    document.getElementById("send").addEventListener("click", sendFile, false);
// 	}

// 	window.addEventListener("load", addEvent, false);
	
</script>