<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.google.gson.Gson" %>
<%
	List<Map<String,Object>> getTemaInfo =(List<Map<String,Object>>)request.getAttribute("getTemaInfo");
	if(getTemaInfo!=null){
	Gson gson = new Gson();
	String json ="";
	for(int i =0; i<getTemaInfo.size();i++){
		json = gson.toJson(getTemaInfo);
	}
		out.print(json);
	
}
%>