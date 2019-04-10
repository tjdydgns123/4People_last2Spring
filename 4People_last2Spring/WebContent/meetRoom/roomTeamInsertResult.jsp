<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.util.*" %>
<%
	List<Map<String,Object>> roomTeamInsert =(List<Map<String,Object>>)request.getAttribute("roomTeamInsert");
String team_code = "";
String team_name ="";
%>    
<%
	if(roomTeamInsert!=null&&roomTeamInsert.size()>0){
		for(Map<String,Object> rMap:roomTeamInsert){
			 team_code=(String)rMap.get("TEAM_CODE");
			 team_name=(String)rMap.get("TEAM_NAME");
		
	%>
	<div class='row'>
	  <div class="panel panel-info">
	  	<div class="panel-heading">
	  	</div>
	    <div class="panel-body">
	    <span style='font-size:20px;'><%=team_name%></span>
	    	<div class='pretty p-svg p-curve pull-right'  >
				<input type='checkbox' class='min2' id=<%="check"+team_code %>>
				<div class='state p-success'>
				<svg class='svg svg-icon' viewBox='0 0 20 20'>
				<path d='M7.629,14.566c0.125,0.125,0.291,0.188,0.456,0.188c0.164,0,0.329-0.062,0.456-0.188l8.219-8.221c0.252-0.252,0.252-0.659,0-0.911c-0.252-0.252-0.659-0.252-0.911,0l-7.764,7.763L4.152,9.267c-0.252-0.251-0.66-0.251-0.911,0c-0.252,0.252-0.252,0.66,0,0.911L7.629,14.566z' style='stroke: white;fill:white;'></path>
				</svg><label>
				</label>
				</div>
				</div> 
	    </div>
	  </div>
	  </div>
<%	}%>
<script>
var formData = new FormData();
$('.min2').click(function() {
	formData.append("mr_no",mr_no);
	var checkid=$(this).attr('id');
	var str = checkid.split("k");
	var id = str[1];
	if($("input:checkbox[id="+checkid+"]").is(":checked") == true){ 
// 		var append = "<input  type='hidden' name='"+id+"' value='"+id+"'  id='insert"+id+"'/>"
// 		$('#checkData').append(append);
		formData.append(id,id);
	}
	else{
// 		var el = $("#insert"+id);
// 		el.remove();
// 		$('#checkData').removeChild(el);
		formData.remove(id);
	}

	
//	     p-success
});
</script>
<%}else{ %>
	<br><br><br><br><span class='text-center'><h2>초대할 팀이없습니다.</h2></span>
<%} %>

