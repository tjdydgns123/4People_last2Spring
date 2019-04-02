<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.google.gson.Gson" %>
 <%
 String team_code = (String)request.getAttribute("team_code");
 if(team_code!=null&&team_code.length()>0){%>
     <script>
	 location.href='./board?team_code='+'<%=team_code%>';
	 </script>	 
<%	}else{%>
 	<script>
	alert('실패');
 	</script>
<% }%>   
    