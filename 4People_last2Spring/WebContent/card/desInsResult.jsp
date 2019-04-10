<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map, java.util.List, java.util.Iterator, java.util.ArrayList" %>
<%
     List<Map<String,Object>> cardList = ( List<Map<String,Object>>)request.getAttribute("cardList");
	List<String> desList = (List<String>)cardList.get(0).get("desMap");
	 String des_content = null; 
     String des_no = null; 
	if(desList!=null){
		 Iterator dtr = desList.iterator();
			while(dtr.hasNext()){
				Map<String,Object> pMap = (Map<String,Object>)dtr.next();
				Object keys[] = pMap.keySet().toArray();
				for(int j=0;j<keys.length;j++){
					if(keys[j].equals("des_no")){
						des_no=(pMap.get(keys[j]).toString());
					}
					else if(keys[j].equals("des_content")){
						des_content=(pMap.get(keys[j]).toString());
					}
					
				}
			}
	}
     %>
      <%if(des_content!=null){ %>
         <span><h5 style="margin-left:45px;"><%=des_content.replace("#","<br>") %></h5></span>
         <%} %>