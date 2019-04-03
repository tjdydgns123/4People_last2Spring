<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="java.util.*"%>
<%
	List<Map<String,Object>> privateSearch =(List<Map<String,Object>>)request.getAttribute("privateSearch");
	if(privateSearch!=null){
		Gson gson = new Gson();
		String json ="";
		for(int i =0; i<privateSearch.size();i++){
			json = gson.toJson(privateSearch);
		}
			out.print(json);
		
	}
%>