<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import='java.util.*' %>  
<%@page import="java.text.SimpleDateFormat"%>  
<%
	List<Map<String,Object>> getPrivate = (List<Map<String,Object>>)request.getAttribute("getPrivate");
	String pvroom_code="";
	String pvlog_content="";
	String mem_name ="";
	String pvlog_time="";
	String time = "";
	String mem_id="";

%>
<style>
.privateChatList:hover{background:#EAEAEA;} 
</style>

<div class="page-header" style="background-color:#FFF; margin-top:20px; height:60px; border-bottom: 1px solid #BDBDBD;'">
<div class='es_font'>
<h2>개인 대화방 목록</h2>
<div class="text-right" style='color:#D9418C; font-size:13px;'>
<a href='javascript:newChatting()'>+새로운 대화</a>
</div>
</div>
</div>
<div  class="container" style='width:100%; height:85%; border-right: 1px solid #BDBDBD; border-left: 1px solid #BDBDBD;  overflow-y: scroll; '>
	<div style=' margin-bottom:5px;'>
<%if(getPrivate!=null&&getPrivate.size()>0) {
	for(int i=0; i<getPrivate.size();i++){
		 Map<String,Object> rMap = getPrivate.get(i);
		 pvroom_code=(String)rMap.get("PVROOM_CODE");
		 if(rMap.containsKey("PVLOG_CONTENT")){
		 pvlog_content=(String)rMap.get("PVLOG_CONTENT");
		 }
		 else{
			 pvlog_content="채팅을 시작해주세요.";
		 }
		 mem_name =(String)rMap.get("MEM_NAME");
		 if(rMap.containsKey("PVLOG_TIME")){
		 pvlog_time=(String)rMap.get("PVLOG_TIME");
		 //[0]=년도 , [1]=월 , [2]=일, [3]=시 , [4]=분, [5]=초
		 String[] date = pvlog_time.split("\\.");
		 String reqDateStr = date[0]+date[1]+date[2]+date[3]+date[4];
		 String param = date[0]+date[1]+date[2];
		 Date curDate = new Date();
		 SimpleDateFormat dateFormat = new SimpleDateFormat("YYYYMMddHHmm");
		 SimpleDateFormat dateFormat2 = new SimpleDateFormat("YYYYMMdd");
		 Date d = new Date();
		 String format = dateFormat2.format(d);
		//요청시간을 Date로 parsing 후 time가져오기
		 Date reqDate = dateFormat.parse(reqDateStr);
		 long reqDateTime = reqDate.getTime();
		//현재시간을 요청시간의 형태로 format 후 time 가져오기
		 curDate = dateFormat.parse(dateFormat.format(curDate));
		 long curDateTime = curDate.getTime();
		 long minute = (curDateTime-reqDateTime )/60000;
		 if(format.equals(param)){
		 if(minute<60){
			time = String.valueOf(minute)+" 분전";		 
		 }
		 else if(60<minute&&minute<1439){
			 String[] str = String.valueOf(Math.floor(minute/60)).split("\\.");
			 time = str[0]+" 시간전";
		 }
		 }
		 else{
			 time = date[1]+"."+date[2];
		 }
		 }
		 mem_id = (String)rMap.get("MEM_ID");
		
		%>



	<div class='row privateChatList'  id=<%=pvroom_code+":privateChat:"+mem_name+":"+mem_id%> style='margin-bottom:8px; border-bottom: 1px solid #BDBDBD;'>
		<div class='col-sm-3'>
		<img src="../images/chatBoy.png" class="rounded" alt="Cinque Terre">
		</div>
		<div class='col-sm-9'>
		<div class='col-sm-8'>
		<span id=<%=pvroom_code+"col3mem_name" %> style='font-weight:bold; font-size:15px;'><%=mem_name %></span>
		</div>
		<div class='col-sm-4 text-right'>
		<span id=<%=pvroom_code+"col3time" %> style='color:#8C8C8C;'><%=time %></span>
		</div>
		<div class='col-sm-12' style='margin-top:5px;'>
			<span id=<%=pvroom_code+"col3content" %> style='color:#5D5D5D; word-wrap:break-word;'><%=pvlog_content %></span>
		</div>
		</div>
	</div>	

	<%}}%>

</div>
</div>

<div class='footer'>
    	<button class='btn btn-primary' style='width:49.5%;' onclick='changePrivate()'>개인대화</button>
    	<button class='btn btn-primary' style='width:49.5%;' onclick='changeTeam()'>프로젝트대화</button>
	</div>
	<script>
	$('.privateChatList')./* dbl */click(function() {
		 var str = $(this).attr('id').split(':');
		 var pvroom_code =  str[0];
		 var chat_name = str[2];
		 var chat_id = str[3];
		 var param = "pvroom_code="+pvroom_code+"&chat_name="+chat_name+"&chat_id="+chat_id;
		 chatClose()
		  var setCookie = function(name, value, exp) {
		  var date = new Date();
		  date.setTime(date.getTime() + exp*24*60*60*1000);
		  document.cookie = name + '=' + value + ';expires=' + date.toUTCString() + ';path=/';
		};
		setCookie('room_code',pvroom_code,1);
		 $.ajax({
			 type:'POST'
			 ,url:'./privateChatlog'
			 ,data:param
			 ,dataType:'html'
			 ,success:function(data){
				 $('#chatting').empty();
				 $('#chatting').html(data);
			 }
		 	 ,error:function(e){
		 		 
		 	 }
		 });
		
		 
		
		 
		 
		 
	 });
	</script>