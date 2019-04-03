<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder" %>       
<%String mem_id  = (String)session.getAttribute("MEM_ID"); 
	String room_code = "";
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../csss/es_chat.css">
<jsp:include page="../include/top.jsp" flush="false">
		<jsp:param value="" name="top" />
</jsp:include>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.2/jquery-ui.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.2/js/bootstrap.js"></script>

<title>Insert title here</title>
<style type="text/css">
 .header_margin{
 	margin:10px;
 	color:#D8D8D8;
 }
 .footer {
  position: relative;
  left: 0;
  bottom: 0;
  width: 100%;
}
::-webkit-input-placeholder {
   font-size: 20px;
}
.es_font{
font-family: 'Noto Sans KR', sans-serif;
}
body{
	background-color:#FFF;
}

</style>
<script type="text/javascript">
//전역변수
	var mem_id = '<%=mem_id%>';
//채팅을 닫을경우
function chatClose(){
	$('#chatting').empty();
	var append = "<div class='text-center' style='padding:300px;'><span style='font-size:40px; color:#EAEAEA;'>채팅방을 열어주세요<span></div>"
	$('#chatting').append(append);
}
//newPrivateChat
function newPrivateChat(){
	var senderId = $("#newChattingSearch").val();
	var str = senderId.split('[');
	var str2 = str[1].split(']');
	var mem_id = str2[0];
	location.href="./newPrivateChat?senderId="+mem_id;
// 	alert(mem_id);
}

//새로운 대화(모달) 검색
function newChattingSearch (){
	 var searchName =$("#newChattingSearch").val();
		if(searchName.length>0){
		var param = "searchName="+searchName;
			$.ajax({
				type:"POST"
			   ,url:"./privateSearch"
			   ,data:param
			   ,dataType:"json"
			   ,success:function(data){
				   $(function (){
					  var value =[];
						 $.each(data , function( key, val){
							value.push(val.MEM_NAME+" ["+val.MEM_ID+"]");
						 });
				   $(".autocomplete").autocomplete({
					    source: value
					  });
					  });
			   }
			  ,error:function(e){
				 console.log(e.printstack);
			  }
			});
		 }
	 }
 $(document).ready(function (){
	 //개인대화방 리스트중 하나 클릭시
	
	 //화면이 로드 되면서 실행됨
	 var tag = "<span><img  src='../images/chat.png' ></span><span style='font-size:30px; color:white; font-weight:bold;'>채팅</span>";
	 $('#navChat').append(tag);
	 
	 var getCookie = function(name) {
		  var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
		  return value? value[2] : null;
		};
		
		var room_code = getCookie('room_code');
		var watch = getCookie('gubun');
		if(room_code!=0){
			if(watch=='privateMessage'){
				changePrivate();
				}
			else if(watch=='teamMessage'){
				changeTeam();
				}
			else{
				changePrivate();
				}
			}
	
			
		
	 
 });
 
 //개인대화방 버튼클릭시
 function changePrivate(){
	 var param ='mem_id='+mem_id;
	 $.ajax({
			type:'POST' 
			,url:'./privateChat'
			,data: param
			,dataType:'html'
			,success:function(data){
				$('#rightMenu').empty();
				$('#rightMenu').html(data);
				}
			 ,error:function(e){
				 console.log(e.printstack);
			  }
		 });
 }
 //팀 대화방 버튼 클릭시
 function changeTeam(){
	 $.ajax({
		url:'./teamChat'
		,dataType:'html'
		,success:function(data){
			$('#rightMenu').empty();
			$('#rightMenu').html(data);
			}
		 ,error:function(e){
			 console.log(e.printstack);
		  }
	 });
 }
 //새로운 대화 눌럿을 시.
 function newChatting(){
	 $('#newChatting').modal('show');
 }
</script>
</head>
<body>
<div>

</div>
<div class='col-sm-9 ' style='height:850px; margin-top:15px; padding-left:5px;' id='chatting'>
<div class='text-center' style='padding:300px;'><span style='font-size:40px; color:#EAEAEA;'>채팅방을 열어주세요<span></div>
</div>
<!-- 오른쪽 메뉴 -->
<div class='col-sm-3'  style='height:850px;'>
<div class='container'  id ='rightMenu' style='width:100%; height:100%; padding-left:0;'>

</div>
</div>
<!-- 오른쪽 메뉴 -->
<!-- <!-- col-sm-3 header end -->

<!-- 새로운 대화 모달 -->

  <!--  -->
  
  
<!-- 새로운 대화 모달 -->
<script type="text/javascript">

	var chatSocket = new WebSocket('ws://192.168.0.6:9000/4People_last2Spring/ChatServer')
	var mem_id = '<%=mem_id%>';
	var msg;
	var mem_name;
	var ok;
	
	//소켓 접속시
	chatSocket.onopen = function() {
		var obj ={
   			 id : mem_id,
   			 gubun : 'open'
   		}
		var json = JSON.stringify(obj);
		chatSocket.send(json);
	}
	//서버에서 메시지가 날라올떄.
	chatSocket.onmessage = function(message) {
		var info = JSON.parse(message.data);
		 msg = info.content;
		var send_room_code = info.room_code;
		var gubun = info.gubun;
		 mem_name = info.mem_name;
		if(ok!="denied"){
			new Notification(mem_name, {body:msg});
			}
		 var getCookie = function(name) {
			  var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
			  return value? value[2] : null;
			};
			
			var room_code = getCookie('room_code');
			var watch = getCookie('gubun');
		if(watch=='privateMessage'){
				if(gubun=='privateMessage'){
					
					//col-sm-9에 append
					if(room_code==send_room_code){
						var append = "<li class='clearfix'><div class='message-data'>"
									 +"<span class='message-data-name'><i class='fa fa-circle you'></i>"+mem_name+"</span></div>"
									 +"<div class='message you-message'>"+msg+"</div></li>";
						$('#chattingText').append(append);
						moveScroll('chatScroll');
					}
					//col-sm-3에 append
					else if(room_code!=send_room_code){
						$('#'+send_room_code+"col3mem_name").text('');
						$('#'+send_room_code+"col3time").text('');
						$('#'+send_room_code+"col3content").text('');
						$('#'+send_room_code+"col3mem_name").text(mem_name);
						$('#'+send_room_code+"col3time").text('방금전');
						$('#'+send_room_code+"col3content").text(msg);
					}
					}
			}
		else if(watch=='teamMessage'){
					if(gubun=='teamMessage'){
						
						//col-sm-9에 append
						if(room_code==send_room_code){
							var append = "<li class='clearfix'><div class='message-data'>"
								 +"<span class='message-data-name'><i class='fa fa-circle you'></i>"+mem_name+"</span></div>"
								 +"<div class='message you-message'>"+msg+"</div></li>";
								$('#chattingText').append(append);
								moveScroll('chatScroll');
							}
						//col-sm-3에 append
						else if(room_code!=send_room_code){
							$('#'+send_room_code+"col3mem_name").text('');
							$('#'+send_room_code+"col3time").text('');
							$('#'+send_room_code+"col3content").text('');
							$('#'+send_room_code+"col3mem_name").text(mem_name);
							$('#'+send_room_code+"col3time").text('방금전');
							$('#'+send_room_code+"col3content").text(msg);
							}
								
						}
			}
		
		
	
		
		
	}
	//에러발생시
	chatSocket.onerror = function() {
		
	}
	//소켓이 닫힐시
	chatSocket.onclose = function() {
		
	}
	function getNotificationPermission() {
	    // 브라우저 지원 여부 체크
	    if (!("Notification" in window)) {
	        alert("데스크톱 알림을 지원하지 않는 브라우저입니다.");
	    }
	    // 데스크탑 알림 권한 요청
	    Notification.requestPermission(function (result) {
	        // 권한 거절
	        ok=result;
	        if(result == 'denied') {
	            alert('알림을 차단하셨습니다.\n브라우저의 사이트 설정에서 변경하실 수 있습니다.');
	            return false;
	        }
	    });
	}
	
// 	//엔터키 눌럿을떄 서버로 전송
// 	$("#chat_text").keydown(function(key) {

// 		if (key.keyCode == 13) {
// 			alert('엔터이벤트');
// 		}
// 		});
// 	//버튼 눌럿을떄 서버로 전송
// 	function btn_chat(){
// 		alert('버튼이벤트');
// 	}
	
</script>
</body>
</html>