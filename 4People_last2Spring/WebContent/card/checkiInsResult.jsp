<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import ="java.util.*" %> 
     <%
     List<Map<String,Object>> cardList = ( List<Map<String,Object>>)request.getAttribute("cardList");
     List<String> checkList = (List<String>)cardList.get(0).get("checkMap");
     List<String> check_code = new ArrayList<String>(); 
     List<String> check_title = new ArrayList<String>(); 
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
     %>  
      <% if(checkList!=null) {%>
         <h3><img src="../images/plan.png">&nbsp;<%=check_title.get(0) %> &nbsp;&nbsp;&nbsp;<button id="<%=check_code.get(0) %>" oncClick="checkDEL(id)" style="background-color:#D9D9D9"><img src="../images/removebtn.png"></button></h3>
         <div class="progress">
   <div id="barbar" class="progress-bar progress-bar-danger progress-bar-striped active" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
    0%
   </div>
   </div>
      <div class="checkbox">
	  <label>
	    <input id="hihi2" type="checkbox" value="" onClick="hihi(this,id)">
	    호 호 호 호 호
	  </label>
	 </div>
      <div class="checkbox">
	  <label>
	    <input id="hihi3" type="checkbox" value="" onClick="hihi(this,id)">
	   히 히 히 히 히
	  </label>
	 </div>
      <div class="checkbox">
	  <label>
	    <input id="hihi4" type="checkbox" value="" onClick="hihi(this,id)">
	   하하하하
	  </label>
	 </div>
      <div class="checkbox">
	  <label>
	    <input id="hihi5" type="checkbox" value="" onClick="hihi(this,id)">
	   희희희희
	  </label>
	 </div>
   <%} %>