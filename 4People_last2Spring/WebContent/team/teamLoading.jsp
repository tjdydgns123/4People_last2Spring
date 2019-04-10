<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.*" %>
    
<%
	List<Map<String,Object>> teamList =(List<Map<String,Object>>)request.getAttribute("team");
	String gubun=(String)request.getAttribute("gubun");

	
%>
<!DOCTYPE html>
<html>
<head>
<style>
#loading {
 width: 100%;  
 height: 100%;  
 top: 0px;
 left: 0px;
 position: fixed;  
 display: block;  
 opacity: 0.7;  
 background-color: #fff;  
 z-index: 99;  
 text-align: center; } 
  
#loading-image {  
 position: absolute;  
 top: 50%;  
 left: 50%; 
 z-index: 100; }
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<%if(teamList!=null&&teamList.size()>0){
	if("board".equals(gubun)){
		
%>
		<jsp:forward page="./teamBoard.jsp"/>
<% 	}else if("member".equals(gubun)){
		
%>
       <jsp:forward page="./teamMember.jsp"/>
<% }	
 }
%>

<jsp:include page="../team/teamBoard.jsp" flush="false">
		<jsp:param value="" name="top" />
	</jsp:include>
<div id="loading"><img id="loading-image" src="../images/loading2.gif" alt="Loading..." /></div>
</body>
</html>