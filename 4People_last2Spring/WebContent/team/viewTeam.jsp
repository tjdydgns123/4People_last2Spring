<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% 	
	
	String mem_id = (String)session.getAttribute("MEM_ID"); 
	String teamLeader = (String)request.getParameter("teamLeader");
	String teamName = java.net.URLDecoder.decode((String)request.getParameter("teamName"));


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트팀</title>
<jsp:include page="../include/top.jsp" flush="false">
		<jsp:param value="" name="top" />
	</jsp:include>
</head>

<body>
	
	

<!-- 		<div class="img img-collaborate"> -->
			<div id="parah" class="col-md-6 col-md-offset-3" style='padding:30px; margin-top:10px;'>
			<h2><%=teamName %></h2>
			<img src="https://upload.wikimedia.org/wikipedia/commons/1/1e/Default-avatar.jpg" width="100" />
    		<%if(teamLeader.equals(mem_id)){%>
    			<button id="btn_update" type="button" class="btn btn-info navbar-btn" onClick="addInput()">팀 프로필 수정</button>
    		<%} %>
    		
			
	     </div>
	    	
	     
	<br><br>

</body>
</html>