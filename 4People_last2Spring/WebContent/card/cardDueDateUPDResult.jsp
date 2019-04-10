<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="java.util.Map, java.util.List, java.util.Iterator, java.util.ArrayList" %>
<%
List<Map<String,Object>> cardList = ( List<Map<String,Object>>)request.getAttribute("cardList");
String card_name = (String)cardList.get(0).get("card_name");
String card_duedate = (String)cardList.get(0).get("card_duedate");
%>

<%if(card_duedate!=null){out.print(card_duedate+"  -  ");}  %>  <%=card_name %>