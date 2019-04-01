<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import ="java.util.*" %>   
<%
   String mem_id = (String)session.getAttribute("MEM_ID");
	String board_no = (String)request.getAttribute("board_no");

 List<Map<String,Object>> board_List =(List<Map<String,Object>>)request.getAttribute("b_boardList");

		List<String> BLIST_NO =new ArrayList<String>();
		List<String> BLIST_TITLE = new ArrayList<String>();
		List<String> BL_team_code = new ArrayList<String>();
		for(Map<String,Object> rMap:board_List){
			BLIST_NO.add(String.valueOf(rMap.get("BLIST_NO")));
			BLIST_TITLE.add(rMap.get("BLIST_TITLE").toString());
			BL_team_code.add(rMap.get("TEAM_CODE").toString());
		}	
%>
		<% for(int i=0;i<BLIST_NO.size();i++){ %>
     <div id=<%=BLIST_NO.get(i) %> class="panel panel-default col-sm-2" style="background-color: #F6F6F6;">
  <!-- Default panel contents -->
     <div  class="panel-heading"><h4 id="listtitle"><%=BLIST_TITLE.get(i) %></h4></div>

  <!-- Table -->
     <table class="table" id=<%=BLIST_NO.get(i)+ "cardAdd"%>>
 	  <tr id=<%=BLIST_NO.get(i)+"tt" %>>
 	  </tr>
 	  <tr id=<%=BLIST_NO.get(i)+"bb" %>> 	
   	</tr>
  </table>
  <div class="panel-heading"><a id="gg" href="javascript:cardAdd(<%=BLIST_NO.get(i) %>)" >+ 새 카드 추가하기</a></div>
</div>

<%}%>
 <div id=min class="panel panel-default col-sm-2" style="background-color: #F6F6F6;">
  <!-- Default panel contents -->
  <div  class="panel-heading"><h4 id="listtitle"></h4></div>

  <!-- Table -->
  <table class="table" id="cardAdd">
 	<tr id="ggtt" >
 	</tr>
 	<tr id="ggbb"> 	
 	</tr>
  </table>
  <div class="panel-heading"><a id="gg" href="javascript:cardAdd('gg')" >+ 새 보드 추가하기</a></div>
  
</div>
