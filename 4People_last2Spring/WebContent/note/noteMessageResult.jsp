<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.google.gson.Gson" %>
<%
	List<Map<String,Object>> noteMessageList =(List<Map<String,Object>>)request.getAttribute("noteMessageList");
	if(noteMessageList!=null){
	Gson gson = new Gson();
	String json ="";
	for(int i =0; i<noteMessageList.size();i++){
		json = gson.toJson(noteMessageList);
	}
		out.print(json);
	
}
%>