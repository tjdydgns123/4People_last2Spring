<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.*" %>

<table class="table" id="t_member">
<thead>
    <tr>
      <th scope="col">이름</th>
      <th scope="col">아이디</th>
      <th scope="col">초대</th>
    </tr>
  </thead>
  <tbody id="tb_member" >
<% 
List<Map<String,Object>> teamList =(List<Map<String,Object>>)request.getAttribute("team");

		for(Map<String,Object> rMap:teamList){
			String mem_name =(String)rMap.get("MEM_NAME");
			String mem_id=(String)rMap.get("MEM_ID");
	
%>

<!--테이블 값 넣어주기  -->
	  <tr>
      <th scope="row"><%=mem_name %></th>
      <td><%=mem_id %></td>
      <td><button id="<%=mem_id %>" type="button" class= "btn btn-success" onClick="memberinvate2(id)">초대</button> <td>
     </tr>
<!--테이블 값 넣어주기  끝-->     
<% } %>
     </tbody>
     </table>