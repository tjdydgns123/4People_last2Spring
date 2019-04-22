<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import ="java.util.*" %> 
     <%
     List<Map<String,Object>> cardList = ( List<Map<String,Object>>)request.getAttribute("cardList");
     List<String> checkList = (List<String>)cardList.get(0).get("checkMap");
     List<String> check_con_List = (List<String>)cardList.get(0).get("checklistMap");
     List<String> check_code = new ArrayList<String>(); 
     List<String> check_title = new ArrayList<String>(); 
     List<String> check_con_code = new ArrayList<String>(); 
     List<String> check_con_name = new ArrayList<String>(); 
     List<String> check_con_confirm = new ArrayList<String>(); 
 	if(checkList!=null){
		 Iterator chtr = checkList.iterator();
			while(chtr.hasNext()){
				Map<String,Object> pMap = (Map<String,Object>)chtr.next();
				Object keys[] = pMap.keySet().toArray();
				for(int j=0;j<keys.length;j++){
					if(keys[j].equals("check_title")){
						check_title.add(pMap.get(keys[j]).toString());
					}
					else if(keys[j].equals("check_code")){
						check_code.add(pMap.get(keys[j]).toString());
					} 
					
				}
			}
	}
 	if(check_con_List!=null){
		 Iterator chcotr = check_con_List.iterator();
			while(chcotr.hasNext()){
				Map<String,Object> pMap = (Map<String,Object>)chcotr.next();
				Object keys[] = pMap.keySet().toArray();
				for(int j=0;j<keys.length;j++){
					if(keys[j].equals("check_con_name")){
						check_con_name.add(pMap.get(keys[j]).toString());
					}
					else if(keys[j].equals("check_con_code")){
						check_con_code.add(pMap.get(keys[j]).toString());
					}
					else if(keys[j].equals("check_con_confirm")){
						check_con_confirm.add(pMap.get(keys[j]).toString());
					}
					
				}
			}
	}
	int ccl_ALLlength =0;
	int check_length = 0;
	int plus_length = 0;
	if(check_con_code.size()>0){
	ccl_ALLlength=Math.round(100/check_con_code.size());
	
	for(int j=0;j<check_con_confirm.size();j++){
		if(check_con_confirm.get(j).equals("1")){
			check_length +=1;
		}
	}
	plus_length = ccl_ALLlength*check_length;
	}
     %>  
      <% if(check_title.size()!=0) {%>
         <h3 id="check_addhaja"><img src="../images/plan.png">&nbsp;<%=check_title.get(0) %> &nbsp;&nbsp;
         <a href="#" id="<%=check_code.get(0) %>" onClick="checklistadd(id)"><img src="../images/add-file.png"></a>&nbsp;&nbsp;<a  href="#" id="<%=check_code.get(0) %>" onClick="checkDEL(id)" style="background-color:#D9D9D9">
         <img src="../images/removebtn.png"></a></h3>
         <div class="progress">
     <%if(check_length==check_con_code.size()){ %>
   <div id="barbar" class="progress-bar progress-bar-danger progress-bar-striped active" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width:100%;">
    100%
    <%} else if(check_length==0){%>
   <div id="barbar" class="progress-bar progress-bar-danger progress-bar-striped active" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width:0%;">
     0%
    <%}else{ %>
   <div id="barbar" class="progress-bar progress-bar-danger progress-bar-striped active" role="progressbar" aria-valuenow="<%=plus_length %>" aria-valuemin="0" aria-valuemax="100" style="width: <%=plus_length %>%;">
    <%=plus_length %>%
   <%} %>
   </div>
 
</div>
  <%} %>
     	<% if(check_con_List!=null){ 
		for(int i=0;i<check_con_code.size();i++){%>
      <div class="checkbox">
	  <label>
	  	<% if(check_con_confirm.get(i).equals("0")){ %>
	    <input id="<%=check_con_code.get(i) %>" type="checkbox" value="" onClick="hihi(this,id)">
	   		<%=check_con_name.get(i) %>
	   		<%} else{%>
	    <input id="<%=check_con_code.get(i) %>" type="checkbox" value="" checked onClick="hihi(this,id)">
	   		<%=check_con_name.get(i) %>
	   		<%} %>
	  </label>
	    <a id="<%=check_con_code.get(i) %>" href="#" style="margin-left:100%" onClick="ck_con_del(id)"><img src="../images/close-cross.png"></a>
	 </div>
     <%} }%>
  