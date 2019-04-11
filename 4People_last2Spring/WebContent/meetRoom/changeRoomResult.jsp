<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
	List<Map<String,Object>> meetingRoomInfo =(List<Map<String,Object>>)request.getAttribute("meetingRoomInfo");
	List<Map<String,Object>> teamAuthority =(List<Map<String,Object>>)request.getAttribute("teamAuthority");
	
	String team_name = "";
	String team_code = "";
	String mr_no="";
	String mem_id = (String)session.getAttribute("MEM_ID");
	%>
	<%if(meetingRoomInfo!=null){
	Map<String,Object> rMap = meetingRoomInfo.get(0);
	mr_no         = (String)rMap.get("MR_NO");       
	String mr_loc        = (String)rMap.get("MR_LOC");
	String mr_capacity   = (String)rMap.get("MR_CAPACITY");
	String mr_name       = (String)rMap.get("MR_NAME");
	String mr_master     = (String)rMap.get("MR_MASTER");
	String mr_starttime  = (String)rMap.get("MR_STARTTIME");
	String mr_endtime    = (String)rMap.get("MR_ENDTIME");
	String mr_memo       = (String)rMap.get("MR_MEMO");
	String mr_facility   = (String)rMap.get("MR_FACILITY");
	String mr_image      = (String)rMap.get("MR_IMAGE");
	String mr_detaileloc = (String)rMap.get("MR_DETAILELOC");
	%>
		<script type="text/javascript">
		$(function(){
			$('#mr_name').val('<%=mr_name%>');
			$('#mr_loc').val('<%=mr_loc%>');
			$('#mr_detaileloc').val('<%=mr_detaileloc%>');
			$('#mr_master').val('<%=mem_id%>');
			$('#mr_capacity').val('<%=mr_capacity%>');
			$('#mr_starttime').val('<%=mr_starttime%>');
			$('#mr_endtime').val('<%=mr_endtime%>');
			$('#mr_facility').val('<%=mr_facility%>');
			$('#mr_memo').val('<%=mr_memo%>');
			$('#roomImage').attr('src','<%="http://192.168.0.6:9000/4People_last2Spring/pds/"+mr_image%>');
		});
		</script>	
<%}
	
%>
	<%if(teamAuthority!=null){
		for(Map<String,Object> tMap:teamAuthority){
			team_code = (String)tMap.get("TEAM_CODE");
			team_name = (String)tMap.get("TEAM_NAME");
		%>
	<button id=<%="team_code"+team_code %> class='btn btn-default btn-lg'><%=team_name %>&nbsp;&nbsp;<a id=<%=team_code %> class='teamDelete' href='javascript:void(0)' onclick='teamDelete(id)'><img src='../images/buttonClose.png' width='15%' height='10px'></a></button>
	<%} }%>
	
	