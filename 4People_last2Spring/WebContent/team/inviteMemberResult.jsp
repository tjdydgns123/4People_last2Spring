<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.*" %>
<% 
Map<String,Object> rMap =(Map<String,Object>)request.getAttribute("inviteList");
int result = 0;
String mem_name="";
String mem_id="";
String mem_role="";
String mem_dept="";
	if(rMap.size()>0&&rMap!=null){
		 mem_name =(String)rMap.get("r_mem_name");
		 mem_id=(String)rMap.get("r_mem_email");
		 mem_role = (String)rMap.get("r_mem_lank");
		 mem_dept= String.valueOf(rMap.get("r_mem_dept"));
	}
		
%>	
<!-- DB에서 받아온값이 null이 아닌경우 -->
<%if(mem_id!=null&&mem_name!=null){%>	
<table class="table" id="t_invite">
<thead>
    <tr>
      <th scope="col">이름</th>
      <th scope="col">아이디</th>
      <th scope="col">직급</th>
      <th scope="col">회사</th>
      <th scope="col"></th>
    </tr>
  </thead>
  <tbody id="tb_member">	
  
		
		<!--테이블 값 넣어주기  -->
	  <tr>
      <td scope="row" align='left'><%=mem_name %></td>
      <td align='left'><%=mem_id%></td>
      <td align='left'><%=mem_role%></td>
      <td align='left'><%=mem_dept%></td>
      <td align='right'><button id="btn_invite" class="btn btn-success">초대</button></td>
     </tr>
<!--테이블 값 넣어주기  끝--> 

  	

</tbody>
</table>

<script>
//초대버튼을 눌럿을경우
$("#btn_invite").bind("click", function(){
		var str = ""
			var checkBtn = $(this);
			// checkBtn.parent() : checkBtn의 부모는 <td>이다.
			// checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
			var tr = checkBtn.parent().parent();
			var td = tr.children();
			var mem_email = td.eq(1).text();
			var param ="inviteMember="+mem_email;
			$.ajax({
				type:"POST"
				,url:"./invite"
				,data:param
				,dataType:"html"
				,success:function(){
					alert("초대 되엇습니다 역할을 부여해주세요");
					$("#t_invite").empty();
					$("#text_invite").val("");
				}
				,error:function(){
					alert("ERROR");
				}
			});
	});
</script>

	<% } %>
	




		

  
