<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map, java.util.List, java.util.Iterator, java.util.ArrayList" %>
<%
List<Map<String,Object>> labelIns = ( List<Map<String,Object>>)request.getAttribute("labelIns");
String label_color = ( String)labelIns.get(0).get("r_label_color");
String label_content = ( String)labelIns.get(0).get("r_label_content");
String label_code = ( String)labelIns.get(0).get("r_label_code");
%>

<input id="<%=label_code %>" type='button' class="btn <%=label_color %>" value="<%= label_content%>" data-toggle="modal" data-target="#label_modal2" onClick="label_codee(id)">