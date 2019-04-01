<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ page import="com.google.gson.Gson"%>
<%
	
	List<Map<String, Object>> roomList = (List<Map<String, Object>>) request.getAttribute("roomList");
	if (roomList != null) {
		Gson g = new Gson();
		String jsonFor = g.toJson(roomList);
		out.print(jsonFor);

	}
%>