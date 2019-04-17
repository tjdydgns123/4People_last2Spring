<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import ="java.util.*" %>   
     
     <%
     	List<Map<String,Object>>historyList = (	List<Map<String,Object>>)request.getAttribute("HistoryList");
     	List<String>HistoryMap =(List<String>) historyList.get(0).get("HistoryMap");
     	List<String>h_mem_name = new ArrayList<String>();
     	List<String>h_mem_image = new ArrayList<String>();
     	List<String>history_content = new ArrayList<String>();
     	List<String>history_time = new ArrayList<String>();
     	List<String>history_no = new ArrayList<String>();
     	List<String>h_card_code = new ArrayList<String>();
     	if(historyList!=null){
    		Iterator histr = HistoryMap.iterator();
    		while(histr.hasNext()){
    			Map<String,Object> pMap = (Map<String,Object>)histr.next();
    			Object keys[] = pMap.keySet().toArray();
    			for(int j=0;j<keys.length;j++){
    				if(keys[j].equals("mem_name")){
    					h_mem_name.add(pMap.get(keys[j]).toString());
    				}
    				else if(keys[j].equals("mem_image")){
    					h_mem_image.add(pMap.get(keys[j]).toString());
    				}
    				else if(keys[j].equals("history_content")){
    					history_content.add(pMap.get(keys[j]).toString());
    				}
    				else if(keys[j].equals("histroy_time")){
    					history_time.add(pMap.get(keys[j]).toString());
    				}
    				else if(keys[j].equals("history_no")){
    					history_no.add(pMap.get(keys[j]).toString());
    				}
    				else if(keys[j].equals("card_code")){
    					h_card_code.add(pMap.get(keys[j]).toString());
    				}
    				
    			}
    		}}
     %>
           <li class="sidebar-brand">
          <a href="#">Activity</a>
          </li>
          <%for(int i=0;i<history_content.size();i++){%>
             <li>
             <div class=col-sm-2><img src="http://192.168.0.6:9000/4People_last2Spring/pds/<%=h_mem_image.get(i)%>" style="width:30px;height:30px"></div>
             <div class=col-sm-10>
             <div><a id="<%=h_card_code.get(i) %>" href="#" onClick="cardOpen(id)" data-toggle="modal" data-target="#cardmodal" style="font-size:15px"><%=h_mem_name.get(i) %><%=history_content.get(i) %></a>
             </div>
             <div style="font-size:5px"><%=history_time.get(i) %>
             </div>
             </div>
<%--              <a id="<%=history_no.get(0) %>" href="#" style="margin-left:100%" onClick=""><img src="../images/close-cross.png" style="width:10px;hieght:10px"></a> --%>
             </li>
          <%} %>
          