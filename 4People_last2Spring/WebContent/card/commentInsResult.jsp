<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.util.Map, java.util.List, java.util.Iterator, java.util.ArrayList" %>
 <%
 String mem_id = (String)session.getAttribute("MEM_ID");
 List<Map<String,Object>> cardList = ( List<Map<String,Object>>)request.getAttribute("cardList");
 List<String> commentsList = ( List<String>)cardList.get(0).get("commentsMap");
 List<String> comm_no = new ArrayList<String>(); 
 List<String> comm_time = new ArrayList<String>(); 
 List<String> comm_content = new ArrayList<String>(); 
 List<String> comm_maker = new ArrayList<String>(); 
 List<String> c_mem_name = new ArrayList<String>(); 
 List<String> c_mem_image = new ArrayList<String>(); 
 
 if(commentsList!=null){
     Iterator ctr = commentsList.iterator();
		while(ctr.hasNext()){
			Map<String,Object> pMap = (Map<String,Object>)ctr.next();
			Object keys[] = pMap.keySet().toArray();
			for(int j=0;j<keys.length;j++){
				if(keys[j].equals("comm_no")){
					comm_no.add(pMap.get(keys[j]).toString());
				}
				else if(keys[j].equals("comm_time")){
					comm_time.add(pMap.get(keys[j]).toString());
				}
				else if(keys[j].equals("comm_content")){
					comm_content.add(pMap.get(keys[j]).toString());
				}
				else if(keys[j].equals("mem_name")){
					c_mem_name.add(pMap.get(keys[j]).toString());
				}
				else if(keys[j].equals("comm_maker")){
					comm_maker.add(pMap.get(keys[j]).toString());
				}
				else if(keys[j].equals("mem_image")){
					c_mem_image.add(pMap.get(keys[j]).toString());
				}
				
			}
		}
        }
  %>
 <% if(commentsList!=null){
        	 for(int i=0;i<commentsList.size();i++){
           
         %>
         	<img  width="30px" height="30px"  src="http://192.168.0.6:9000/4People_last2Spring/pds/<%=c_mem_image.get(i)%>">
         		<label><span style='font-size:20px; font_weight:bold; margin:5px;'><%=c_mem_name.get(i) %></span><span style='font-size:8px;'><%=comm_time.get(i) %></span>
         		<%if(mem_id.equals(comm_maker.get(i))){ %>
         		<a id="<%=comm_no.get(i) %>" style="margin-left:130px;" href="#" onClick="commDEL(id)"><img src="../images/close-cross.png" style="width:8px;hieght:8px"></a>
         		<%} %>
         		</label>
         	<div>
         	<label style='background-color: #FFFFFF;color:#17375E;margin-left:50px; width:50%; height:25px;border-radius: 8px 8px 8px 10px; border:0;' >&nbsp;&nbsp;&nbsp;<%=comm_content.get(i) %></label>
         	</div>	
         	<%
        	 }}
         	%>