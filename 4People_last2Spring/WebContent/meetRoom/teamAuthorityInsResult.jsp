<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.google.gson.Gson" %>
<%
	List<Map<String,Object>> teamAuthority =(List<Map<String,Object>>)request.getAttribute("teamAuthority");
	if(teamAuthority!=null){
	Gson gson = new Gson();
	String json ="";
	for(int i =0; i<teamAuthority.size();i++){
		json = gson.toJson(teamAuthority);
	}
		out.print(json);
	
}
%>