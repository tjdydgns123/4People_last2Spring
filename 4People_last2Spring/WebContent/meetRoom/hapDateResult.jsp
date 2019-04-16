<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import='java.util.*'%>
<%
List<Map<String, Object>> hapDateList =(List<Map<String, Object>>)request.getAttribute("hapDateList");
	String re_starttime ="";
	String re_endtime ="";
	String re_code="";
	String re_howmany="";
	String mr_name="";
	String re_date="";
	String re_hopedate="";
	String mr_teamname="";
%>
		<thead>
      		<tr align="center" style='border: 1px solid #BDBDBD; font-size:21px; background-color:#FFA7A7; color:#CC3D3D;'>
		      <th scope="col">예약일</th>
		      <th scope="col">회의장소</th>
		      <th scope="col">소속</th>
		      <th scope="col">참여인원</th>
		      <th scope="col">이용날짜</th>
		      <th scope="col">이용시간</th>
		    </tr>
      	</thead>
      	<tbody>
 <%if(hapDateList.size()>0&&hapDateList!=null){
	 for(Map<String,Object> rMap:hapDateList){
		 	 re_starttime =(String)rMap.get("RE_STARTTIME");
			 re_endtime =(String)rMap.get("RE_ENDTIME");
			 re_code=(String)rMap.get("RE_CODE");
			 re_howmany=(String)rMap.get("RE_HOWMANY");
			 mr_name=(String)rMap.get("MR_NAME");
			 re_date=(String)rMap.get("RE_DATE");
			 re_hopedate=(String)rMap.get("RE_HOPEDATE");
			 mr_teamname=(String)rMap.get("MR_TEAMNAME");
 %>  
 
 <tr align="center" style='font-size:18px; font-weight:bold; border: 1px solid #BDBDBD; height:70px;'>
      			<td><%=re_date %></td>
      			<td><%=mr_name %></td>
      			<td><%=mr_teamname %></td>
      			<td><%=re_howmany %></td>
      			<td><%=re_hopedate %></td>
      			<td><%=re_starttime+" ~ "+re_endtime %></td>
      		</tr>
 
 
 
 <%	 }
 }
  %>  