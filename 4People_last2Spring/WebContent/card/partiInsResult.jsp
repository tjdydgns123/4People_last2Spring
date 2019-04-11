<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="java.util.Map, java.util.List, java.util.Iterator, java.util.ArrayList" %>
<%
List<Map<String,Object>> cardList = ( List<Map<String,Object>>)request.getAttribute("cardList");
 List<String> partiList = (List<String>)cardList.get(0).get("partiMap");
 List<String> mem_name = new ArrayList<String>(); 
 List<String> parti_code = new ArrayList<String>(); 
 List<String> p_mem_image = new ArrayList<String>();
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
				else if(keys[j].equals("mem_image")){
					p_mem_image.add(pMap.get(keys[j]).toString());
				}
				
			}
		}
}
%>

<%if(partiList!=null){
     	 %> 
     	 <button id="<%=parti_code.get(0) %>" name="gkgk" draggable="true" ondragstart="drag(event)" style='background-color:#D9D9D9;height:37px;margin-right:3px' onClick="mouse(id)"> <img id="<%=parti_code.get(0) %>" src="http://192.168.0.6:9000/4People_last2Spring/pds/<%=p_mem_image.get(0) %>"  alt="Cinque Terre" width="30" height="30" ><%=mem_name.get(0) %></button>
<%--       	 <button id="<%=parti_code.get(0) %>" draggable="true" ondragstart="drag(event)" style='background-color:#FFFFFF;height:33px;margin-right:3px'><img id="<%=parti_code.get(0) %>" src="../images/<%=p_mem_image.get(0) %>"  width="30" height="30" ><%=mem_name.get(0) %></button> --%>
        	 <%} %>

