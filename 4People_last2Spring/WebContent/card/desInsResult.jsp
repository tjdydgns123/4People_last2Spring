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
<%--       <%if(des_content!=null){ %> --%>
<%--          <span><h5 style="margin-left:45px;"><%=des_content.replace("#","<br>") %></h5></span> --%>
<%--          <%} %> --%>
<h3 id="hth"><img src="../images/description4.png">요약    <%if(des_content!=null){ %>
           <a id="<%=des_no%>" href="#" onclick="desUPD(id)" style="margin-left:20px">edit</a>
		<%}%>     </h3>
       
          <div id="des_con">
          <div id="des_conss" class="droptarget" ondrop="drop(event)" ondragover="allowDrop(event)">
          <%if(des_content==null){ %>
         <textarea  id="des_text" style="margin-left:50px; width:500px; height:150px; border-radius: 8px 8px 8px 10px; border:0; " />
         <%}%>
          </div>
          <div id="des_cons">
          <%if(des_content!=null){ %>
         <span><h5 style="margin-left:45px;"><%=des_content.replace("#","<br>") %></h5></span>
         <%} %>
         </div>
         </div>
         <div id="des_bt">
         <%if(des_content==null){ %>
         <input id="<%=des_no %>" type="button" style="margin-left:50px; margin-top:10px" class="btn btn-success col-sm-2 col-sm-offset-5" value="저장" onClick="descriptionIns(id)">
         <%} %>
         </div>