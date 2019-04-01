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
function boardmove(id){
		var team_code = '<%=team_code%>';
		location.href="../boardList/boardList.for?crud=sel2&mem_id=<%=mem_id%>&board_no="+id+"&team_code="+team_code;
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
  <li role="presentation" class="active"><a style=" font-weight:700;" href="./team.for?command=board">보드</a></li>
  <li role="presentation" ><a  style=" font-weight:700;" href="./team.for?command=member">회원</a></li>
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

</body>
</html>