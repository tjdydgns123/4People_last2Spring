<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import='java.util.*' %>  
<%@page import="java.text.SimpleDateFormat"%>  
<%
List<Map<String,Object>> getTeam = (List<Map<String,Object>>)request.getAttribute("getTeam");
String team_code="";
String tlog_time="";
String tlog_content="";
String team_name="";
String time="";
%>
<style>
.teamChatList:hover{background:#EAEAEA;} 
</style>
<div class="page-header" style="background-color:#FFF; margin-top:20px; height:60px; border-bottom: 1px solid #BDBDBD;'">
<div class='es_font'>
<h2>프로젝트 대화방 목록</h2>
<div class="text-right" style='color:#D9418C; font-size:13px;'>
</div>
</div>
</div>
<div class="container" style='width:100%; height:85%; border-right: 1px solid #BDBDBD; border-left: 1px solid #BDBDBD;  overflow-y: scroll; '>
	<div style=' margin-bottom:5px;'>
	<%if(getTeam!=null&&getTeam.size()>0){
		for(int i =0; i<getTeam.size();i++){
			Map<String,Object> rMap = getTeam.get(i);
			team_code = (String)rMap.get("TEAM_CODE");
			tlog_content = (String)rMap.get("TLOG_CONTENT");
			team_name=(String)rMap.get("TEAM_NAME");
			tlog_time=(String)rMap.get("TLOG_TIME");
			String[] date = tlog_time.split("\\.");
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
		%>
	<div class='row teamChatList' id=<%=team_code+":teamChat" %> style='margin-bottom:8px; border-bottom: 1px solid #BDBDBD;'>
		<div class='col-sm-3'>
		<img src="../images/teamwork.png" class="rounded" alt="Cinque Terre">
		</div>
		<div class='col-sm-9'>
		<div class='col-sm-8'>
		<span id=<%=team_code+"col3mem_name"%>style='font-weight:bold; font-size:17px;'><%=team_name %></span>
		</div>
		<div class='col-sm-4 text-right'>
		<span id=<%=team_code+"col3time"%> style='color:#8C8C8C;'><%=time%></span>
		</div>
		<div class='col-sm-12' style='margin-top:5px;'>
			<span id=<%=team_code+"col3content"%> style='color:#5D5D5D; word-wrap:break-word;'><%=tlog_content %></span>
		</div>
		</div>
	</div>	
		<%}
	} %>
	</div>
</div>
<div class='footer'>
    	<button class='btn btn-primary' style='width:49.5%;' onclick='changePrivate()'>개인대화</button>
    	<button class='btn btn-primary' style='width:49.5%;' onclick='changeTeam()'>프로젝트대화</button>
	</div>
<script>
$(document).ready(function (){
	var getCookie = function(name) {
		  var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
		  return value? value[2] : null;
		};
		var room_code = getCookie('room_code');
		var watch = getCookie('gubun');
		
		if(room_code!=null&&watch=='teamMessage'){
			 var setCookie = function(name, value, exp) {
				  var date = new Date();
				  date.setTime(date.getTime() + exp*24*60*60*1000);
				  document.cookie = name + '=' + value + ';expires=' + date.toUTCString() + ';path=/';
				};
				setCookie('room_code',room_code,1);
				setCookie('gubun','teamMessage');
			var param = "team_code="+room_code;
			 $.ajax({
				 type:'POST'
				 ,url:'./teamChatlog'
				 ,data:param
				 ,dataType:'html'
				 ,success:function(data){
					 $('#chatting').empty();
					 $('#chatting').html(data);
				 }
			 	 ,error:function(e){
			 		 
			 	 }
			 });
			}
	
});
	$('.teamChatList')./* dbl */click(function() {
		 var str = $(this).attr('id').split(':');
		 var team_code =  str[0];
		 var param = "team_code="+team_code;
		 chatClose()
		  var setCookie = function(name, value, exp) {
		  var date = new Date();
		  date.setTime(date.getTime() + exp*24*60*60*1000);
		  document.cookie = name + '=' + value + ';expires=' + date.toUTCString() + ';path=/';
		};
		setCookie('room_code',team_code,1);
		setCookie('gubun','teamMessage');
		 $.ajax({
			 type:'POST'
			 ,url:'./teamChatlog'
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