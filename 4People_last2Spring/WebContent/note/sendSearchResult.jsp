<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.google.gson.Gson" %>
<%
	List<Map<String,Object>> sendList =(List<Map<String,Object>>)request.getAttribute("sendList");
	if(sendList!=null){
		Gson gson = new Gson();
		String json ="";
		for(int i =0; i<sendList.size();i++){
			json = gson.toJson(sendList);
		}
			out.print(json);
		
	}
%>