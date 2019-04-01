<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.google.gson.Gson" %>    
<%
	String comment_code = (String)request.getAttribute("comment_code");
	Gson gson = new Gson();
	String json = gson.toJson(comment_code);
	out.print(json);
%>
