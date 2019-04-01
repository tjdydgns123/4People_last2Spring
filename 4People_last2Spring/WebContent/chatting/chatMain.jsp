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
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
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
.ui-autocomplete {
    position: absolute;
    z-index: 1040;
    cursor: default;
    padding: 0;
    margin-top: 2px;
    list-style: none;
    background-color: #ffffff;
    border: 1px solid #ccc
    -webkit-border-radius: 5px;
       -moz-border-radius: 5px;
            border-radius: 5px;
    -webkit-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
       -moz-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
}
.ui-autocomplete > li {
  padding: 3px 20px;
}
.ui-autocomplete > li.ui-state-focus {
  background-color: #DDD;
}
.ui-helper-hidden-accessible {
  display: none;
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


 $(document).ready(function (){
	 //개인대화방 리스트중 하나 클릭시
	
	 //화면이 로드 되면서 실행됨
	 var tag = "<span><img  src='../images/chat.png' ></span><span style='font-size:30px; color:white; font-weight:bold;'>채팅</span>";
	 $('#navChat').append(tag);
	 changePrivate();
	 
	 //새로운 대화(모달) 검색
	 $('#receive_id').keyup(function (){
			var searchName =$("#newChattingSearch").val();
			if(searchName.length>2){
			var param = "searchName="+searchName;
				$.ajax({
					type:"POST"
				   ,url:"./note.for?command=sendSearch"
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
		});
	 
 });
 
 //개인대화방 버튼클릭시
 function changePrivate(){
	 var param ='mem_id='+mem_id;
	 $.ajax({
			type:'POST' 
			,url:'./chatting.for?command=privateChat'
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
	 var param ='mem_id='+mem_id+"&team_code="+1;
	 $.ajax({
		type:'POST' 
		,url:'./chatting.for?command=teamChat'
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
<div class="modal fade" id="newChatting" role="dialog" >
    <div class="modal-dialog modal-md">
      <div class="modal-content" style='background-color:#FFF;'>
        <div class="modal-header text-center">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">새로운 대화</h4>
        </div>
        <div class="modal-body" style='height:350px;'>
         	<div class="form-group ui-widget">
			    <label>검색</label>
			    <input class="form-control autocomplete" placeholder="이름을 입력하세요" id='newChattingSearch' />
			  </div>
			  <div>
			  	<div class='text-center'style='color:#EAEAEA; padding:50px; margin-top:40px;'>
			  		<h3>검색결과화면</h3>
			  	</div>
			  </div>
         	
        </div>
      </div>
    </div>
  </div>
<!-- 새로운 대화 모달 -->
<script type="text/javascript">
	var chatSocket = new WebSocket('ws://192.168.0.6:9001/4people/ChatServer')
	var mem_id = '<%=mem_id%>';
	var msg;
	var mem_name;
	
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
		 mem_name = info.mem_name;
		<%
		Cookie[] cooks = request.getCookies();
		if(cooks!=null && cooks.length!=0){
			for(int i=0;i<cooks.length;i++){//쿠키에 담긴 정보의 수만큼
				if(cooks[i].getName().equals("room_code")){%>//쿠키 이름에 맞는 것
				var room_code ='<%=cooks[i].getValue()%>';
// 				System.out.print("***************"+room_code);
				<%}
			}
		}%>
		
		//col-sm-9에 append
		if(room_code==send_room_code){
			alert('if'+room_code);
			var append = "<li class='clearfix'><div class='message-data'>"
						 +"<span class='message-data-name'><i class='fa fa-circle you'></i>"+mem_name+"</span></div>"
						 +"<div class='message you-message'>"+msg+"</div></li>";
			$('#chattingText').append(append);
			moveScroll('chatScroll');
		}
		//col-sm-3에 append
		else if(room_code!=send_room_code){
			alert('else'+room_code);
			$('#'+send_room_code+"col3mem_name").text('');
			$('#'+send_room_code+"col3time").text('');
			$('#'+send_room_code+"col3content").text('');
			$('#'+send_room_code+"col3mem_name").text(mem_name);
			$('#'+send_room_code+"col3time").text('방금전');
			$('#'+send_room_code+"col3content").text(msg);
		}
		
	
		
		
	}
	//에러발생시
	chatSocket.onerror = function() {
		
	}
	//소켓이 닫힐시
	chatSocket.onclose = function() {
		
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