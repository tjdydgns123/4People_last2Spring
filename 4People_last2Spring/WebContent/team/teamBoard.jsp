<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<%
List<Map<String,Object>> boardList =(List<Map<String,Object>>)request.getAttribute("team");
String teamLeader = "";
String teamName = "";
String mem_id = (String)session.getAttribute("MEM_ID");
String team_code = (String)session.getAttribute("team_code");

String board_no = "";
String board_color="";
String board_title="";
	for(Map<String,Object> rMap:boardList){
		teamLeader = (String)rMap.get("TEAM_LEADER");
		teamName =(String)rMap.get("TEAM_NAME");
	}
%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<jsp:include page="./viewTeam.jsp" flush="false">
		<jsp:param value='<%=teamLeader%>' name="teamLeader" />
		<jsp:param value='<%=java.net.URLEncoder.encode(teamName)%>' name="teamName" />
	</jsp:include>
<title>Insert title here</title>

<script type="text/javascript">
var color ="btn-default";
function boardmove(id){
	var str = id.split('w');
	var board_id = str[1];
	if(board_id=='new'){
		$('#layerpop').modal('show');
		}
	else{
		var team_code ='<%=team_code%>'
		location.href="../boardList/boardListSel?mem_id=<%=mem_id%>&board_no="+id+"&team_code="+team_code;
		}
}
function addInput() {
      var temp=document.getElementById("op").value;
      var mem_id = '<%=mem_id%>'
      var team_code ='<%=team_code%>'
	  location.href='../board/teamBoardINS?boardtitle='+temp+'&color='+color+'&mem_id='+mem_id+'&team_code='+team_code;
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

<!-- 위 버튼들 -->
<div class='col-sm-8 col-md-offset-2'>
<article class="container" >
	<div style="text-align: center;">
<ul id="options" class="nav nav-tabs nav-justified" >
<!-- 	<li> 클릭햇을떄 눌러져잇는것처럼 보이는 속성 class="active" -->
  <li role="presentation" class="active"><a style=" font-weight:700;" href="./board?team_code=<%=team_code %>">보드</a></li>
  <li role="presentation" ><a  style=" font-weight:700;" href="./member">회원</a></li>
  <li role="presentation"><a style=" font-weight:700;" href="#">설정</a></li>
  </ul>
  </div>
  <%for(int i=0; i<boardList.size();i++){
	Map<String,Object> rMap = boardList.get(i);
	for(Object key:rMap.keySet()){
		board_no = (String)rMap.get("BOARD_NO");
		board_color=(String)rMap.get("BOARD_COLOR");
		board_title=(String)rMap.get("BOARD_TITLE");}%>
	<div class='col-md-2' style='margin-top:50px;'>
	<input type='button' style='WIDTH: 120pt; HEIGHT: 120pt; padding:20px;' id="<%=board_no %>" class="btn <%=board_color %> " value="<%=board_title %>" onClick='boardmove(id)'>
	</div>
	<%} %>
	</article>
</div>
<!-- 위 버튼들 -->

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