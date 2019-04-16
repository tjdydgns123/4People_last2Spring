<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="java.util.Map, java.util.List, java.util.Iterator, java.util.ArrayList" %>
<%
List<Map<String,Object>> cardList = ( List<Map<String,Object>>)request.getAttribute("cardList");
 List<String> partiList = (List<String>)cardList.get(0).get("partiMap");
 List<String> mem_name = new ArrayList<String>(); 
 List<String> parti_code = new ArrayList<String>(); 
 if(partiList!=null){
	 Iterator ptr = partiList.iterator();
		while(ptr.hasNext()){
			Map<String,Object> pMap = (Map<String,Object>)ptr.next();
			Object keys[] = pMap.keySet().toArray();
			for(int j=0;j<keys.length;j++){
				if(keys[j].equals("mem_name")){
					mem_name.add(pMap.get(keys[j]).toString());
				}
				else if(keys[j].equals("parti_code")){
					parti_code.add(pMap.get(keys[j]).toString());
				}
				
			}
		}
}
%>

<%if(partiList!=null){
        	 %>
      	 <button id="<%=parti_code.get(0) %>" draggable="true" ondragstart="drag(event)" style='background-color:#FFFFFF;height:33px;margin-right:3px'><%=mem_name.get(0) %></button>
        	 <%} %>