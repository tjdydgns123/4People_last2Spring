<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.google.gson.Gson" %>
<%
	List<Map<String,Object>> sideTeamList =(List<Map<String,Object>>)request.getAttribute("sideTeamList");
	String messageCount = (String)request.getAttribute("messageCount");
	if(sideTeamList!=null){
		Gson gson = new Gson();
		String json ="";
		for(int i =0; i<sideTeamList.size();i++){
			json = gson.toJson(sideTeamList);
		}
			out.print(json);
		
	}
	if(messageCount!=null&&messageCount.length()>0){
		Gson gson = new Gson();
		String json ="";
		json = gson.toJson(messageCount);
		out.print(json);
	}
	
%>