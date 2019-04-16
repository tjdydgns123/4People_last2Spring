
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map, java.util.ArrayList, java.lang.Integer, java.util.Iterator" %>
<% String name = (String)session.getAttribute("MEM_NAME"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../include/top.jsp"  flush="false">
		<jsp:param value="" name="top" />
	</jsp:include> 
<title>Insert title here</title>
<%
	
  String mem_id = (String)session.getAttribute("MEM_ID");
	String team_code="";
List<Map<String,Object>> boardList = (List<Map<String,Object>>)request.getAttribute("BoardList");
List<String> TeamCr = (List<String>)boardList.get(0).get("teamMap");
List<String> boardCr = (List<String>)boardList.get(0).get("boardMap");
List<String> t_team_code = new ArrayList<String>();
List<String> t_team_name = new ArrayList<String>();
List<String> b_team_code = new ArrayList<String>();
List<String> b_board_no = new ArrayList<String>();
List<String> b_board_title = new ArrayList<String>();
List<String> b_board_update = new ArrayList<String>();
List<String> b_board_color = new ArrayList<String>();
Iterator itr = TeamCr.iterator();
while(itr.hasNext()){
	//out.print(itr.next()+"<br>");
	Map<String,Object> pMap = (Map<String,Object>)itr.next();
	Object keys[] = pMap.keySet().toArray();
	for(int j=0;j<keys.length;j++){
//			out.print(keys[j]+" - ");
//			out.print(pMap.get(keys[j])+"<br>");
		if(keys[j].equals("team_code")){
			t_team_code.add(pMap.get(keys[j]).toString());
		}
		else if(keys[j].equals("team_name")){
			t_team_name.add(pMap.get(keys[j]).toString());
		}
		
	}
}
Iterator b_itr = boardCr.iterator();
while(b_itr.hasNext()){
	//out.print(itr.next()+"<br>");
	Map<String,Object> pMap = (Map<String,Object>)b_itr.next();
	Object keys[] = pMap.keySet().toArray();
	for(int j=0;j<keys.length;j++){
//			out.print(keys[j]+" - ");
//			out.print(pMap.get(keys[j])+"<br>");
		if(keys[j].equals("team_code")){
			b_team_code.add(pMap.get(keys[j]).toString());
		}
		else if(keys[j].equals("board_no")){
			b_board_no.add(pMap.get(keys[j]).toString());
		}
		else if(keys[j].equals("board_title")){
			b_board_title.add(pMap.get(keys[j]).toString());
		}
		else if(keys[j].equals("board_update")){
			b_board_update.add(pMap.get(keys[j]).toString());
		}
		else if(keys[j].equals("board_color")){
			b_board_color.add(pMap.get(keys[j]).toString());
		}
		
	}
}

%>
<!-- 	<style> -->

<!-- 	</style> -->
	<script type="text/javascript">
	  var temp = new Array();
	  var color ="btn-default";
	  var team_code;
	  function teamCodeset(id){
		  team_code = id
	  }
	  function addInput() {
	      temp=document.getElementById("op").value;
// 	      //alert("title: "+temp);
// 	      //alert("color: "+color);
<%-- 	      //alert("<%=mem_id%>"); --%>
// 	      //alert(team_code);
// 		  document.getElementById('parah').innerHTML+="<input type='button' class='btn "+color+" btn-lg btn-block' value="+temp+">"
		  location.href="./boardINS?boardtitle="+temp+"&color="+color+"&mem_id=<%=mem_id%>&team_code="+team_code;
		}
	  function boardupd(id){
			//alert(id);
		  location.href="./boardUPD?board_no="+id+"&mem_id=<%=mem_id%>+team_code="+team_code;
		  
	  }
	  function boardmove(id){
		  location.href="../boardList/boardListSel?mem_id=<%=mem_id%>&board_no="+id+"&team_code="+team_code;
// 		  location.href="../boardList/boardList.jsp";
	  }
	function defaultt(){
		color ="btn-default";
	}	 
	function primary(){
		color ="btn-primary";
	}	 
	function success(){
		color ="btn-success";
	}	 
	function info(){
		color ="btn-info";
	}	 
	function warning(){
		color ="btn-warning";
	}	 
	function danger(){
		color ="btn-danger";
	}	 

	

	
	</script>
</head>
<body>
 
	<table id="board_table" class="table">
<tr>
	<div class=" row col-md-offset-1"style="margin-top:100px;" id="updateboard">
	<h3 style="color:#5bc0de"> <span class="label"><img src="../images/new.jpg"></span>업데이트 </h3>
	<%for(int k=0;k<b_team_code.size();k++) {
		if(b_board_update.get(k).equals("1")){	
	%>
	<div class="col-md-2" id="<%=b_board_no.get(k)%>+u">
	<input type='button' style='WIDTH: 150pt; HEIGHT: 100pt' id="<%=b_board_no.get(k)%>" class="btn <%=b_board_color.get(k) %> " value="<%=b_board_title.get(k) %>" onClick="boardupd(id)">
	</div>
<%} }%>
	</div>
	</tr>
<% for(int i=0;i<t_team_code.size();i++) { %>
<tr>
	<div class=" row col-md-offset-1"style="margin-updateboard:700px;" >
	<h3 style="color:#5bc0de"> <span class="label"><img src="../images/my.png"></span><%=t_team_name.get(i) %> </h3>
	<div class="col-md-2 "id="board">
	<input type="button" style="WIDTH: 150pt; HEIGHT: 100pt" id="<%=t_team_code.get(i) %>" class="btn btn-default " data-target="#layerpop" data-toggle="modal" value="새 보드 생성하기..." onClick="teamCodeset(id)">
	</div>
	<%for(int j=0;j<b_team_code.size();j++) {%>
	<%if(t_team_code.get(i).equals(b_team_code.get(j))){ 
	  if(!b_board_no.get(j).substring(0,2).equals("ne")){%>
	<div class='col-md-2'>
	<input type='button' style='WIDTH: 150pt; HEIGHT: 100pt' id="<%=b_board_no.get(j) %>" class="btn <%=b_board_color.get(j) %> " value="<%=b_board_title.get(j) %>" onClick='boardmove(id)'>
	</div>
	<% }}
    }	
	%>
	</div>
	</tr>
	<tr>&nbsp;</tr>
	<tr>&nbsp;</tr>
	<tr>&nbsp;</tr>
	<tr>&nbsp;</tr>
	<tr>&nbsp;</tr>
	<tr>&nbsp;</tr>
<% } %>
</table>
 <!--  모달영역 -->
<div class="modal fade" id="layerpop" >
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- header -->
      <div class="modal-header">
        <!-- 닫기(x) 버튼 -->
        <button type="button" class="close" data-dismiss="modal">×</button>
        <!-- header title -->
        <h4 class="modal-title">보드명</h4>
      </div>
      <!-- body -->
      <div class="modal-body">
            <input type=text id="op" name="boardtitle">
           
      </div>
      <!-- Footer -->
      <div class="modal-footer" id="create">
		 <input type="button" style="float:left" class="btn btn-default" onClick="defaultt()"/>
            <input type="button" style="float:left" class="btn btn-primary" onClick="primary()"/>
            <input type="button" style="float:left" class="btn btn-success" onClick="success()"/>
            <input type="button" style="float:left" class="btn btn-info" onClick="info()"/>
            <input type="button" style="float:left" class="btn btn-warning" onClick="warning()"/>
            <input type="button" style="float:left" class="btn btn-danger" onClick="danger()"/>
        <button type="button" class="btn btn-default" data-dismiss="modal" onClick="addInput()">생성</button>
      </div>
    </div>
  </div>
</div>


</body>
</html>