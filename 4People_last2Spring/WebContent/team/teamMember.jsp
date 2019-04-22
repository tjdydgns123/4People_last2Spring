<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<%
String pm1=(String)request.getAttribute("pm");
List<Map<String,Object>> memberList =(List<Map<String,Object>>)request.getAttribute("team");
String teamLeader = (String)request.getAttribute("TEAM_LEADER");
String teamName = (String)request.getAttribute("TEAM_NAME");
String teamCode = (String)session.getAttribute("team_code");


String mem_name=null;
String mem_id=null;
String p_role = null;
String pm = null;

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
("에러페이지입니다")%>
</style>
<title>Insert title here</title>
<jsp:include page="./viewTeam.jsp" flush="false">
		<jsp:param value='<%=teamLeader%>' name="teamLeader" />
		<jsp:param value='<%=java.net.URLEncoder.encode(teamName)%>' name="teamName" />
	</jsp:include>
<script type="text/javascript">
	$(window).on("load",function(){
		
		//엔터키 막기
		$('input[type="text"]').keydown(function() {
		    if (event.keyCode === 13) {
		        event.preventDefault();
		    }
		});
		
		var tag ="<div id='d_invite'><div class='col-md-6 col-md-offset-3'>"
		+"<article class='container-fluid' id='con_invite' >"
		+"<img src='https://a.trellocdn.com/prgb/dist/images/organization/new-team.b0d9f513a05be128693e.svg' width='100px' height='100px' />"
		+"<div class='card-group'>"
		+"<div class='card-body text-center'>"
		+"<p class='card-text'>프로젝트의 발전을위해 팀원을 초대해주세요</p></div></div><br>"
		+"<div><form class='navbar-form navbar-center' role='search'>"
		+"<input type='text' id='text_invite' class='form-control' placeholder='example) abcd1234@email.com' style='width:300px'></form></div>"
		+"<div class='table-responsive'><div id='d_inviteResult'></div></div>	</article></div></div>";
			
		$("#teamMember").bind("click", function(){
			$(this).addClass("active");
			$("#mem_name").show();
			$("#invite").removeClass("active");
			$("#tb_member").empty();
			$("#con_invite").empty();

			var mem_name =$("#mem_name").val();
			var param ="mem_name="+mem_name;
	
				$.ajax({
					type:"POST"
				   ,url:"./member"
				   ,data:param
				   ,dataType:"html"
				   ,success:function(result){
					   $("#d_table").html(result);
				   }
				  ,error:function(){
					  $("#d_table").text(e.responseText);
				  }
				});
		});
		$("#invite").bind("click", function(){
			$(this).addClass("active");
			$("#mem_name").hide();
			$("#t_member").empty();
			$("#d_invite").empty();
			$("#d_invite").append(tag);
			$("#teamMember").removeClass("active");
			//엔터키 막기
			$('input[type="text"]').keydown(function() {
			    if (event.keyCode === 13) {
			        event.preventDefault();
			    }
			});
			//팀원초대 ajax
			$('#text_invite').keyup(function (){
				var mem_email =$("#text_invite").val();
				var param ="mem_email="+mem_email;
				if(mem_email.length>0){
					$.ajax({
						type:"POST"
					   ,url:"./invite"
					   ,data:param
					   ,dataType:"html"
					   ,success:function(result){
						   $("#d_inviteResult").html(result);
						   
										
					   }
					  ,error:function(){
						  $("#d_inviteResult").text(e.responseText);
					  }
					});//end of ajax
					$("#btn_invite").bind("click", function(){
// 						alert($('#tb_member').child.val());
					});
					
				}
				else{
					$("#t_invite").empty();
				}
					
				
				
					
				
				
			});
		});
	});
	
	//팀원검색 ajax
	$(window).on ( "load",function (){
		
		$("#mem_name").keyup(function (){
			$("#tb_member").empty();
			
			var mem_name =$("#mem_name").val();
			var param ="mem_name="+mem_name;
			
				$.ajax({
					type:"POST"
				   ,url:"./member"
				   ,data:param
				   ,dataType:"html"
				   ,success:function(result){
					   $("#d_table").html(result);
					   
				   }
				  ,error:function(){
					  $("#d_table").text(e.responseText);
				  }
				});
			
			
			
		});
	});
	
	
	
		
	
</script>
</head>
<body>


   

  

<article class="container" id="container" >
	<div style="text-align: center;">

	<ul id="options" class="nav nav-tabs nav-justified" >
<!-- 	<li> 클릭햇을떄 눌러져잇는것처럼 보이는 속성 class="active" -->
  <li role="presentation"><a style=" font-weight:700;" href="./board?team_code=<%=teamCode %>">보드</a></li>
  <li role="presentation" class="active"><a  style=" font-weight:700;" href="./member">회원</a></li>
  <li role="presentation"><a style=" font-weight:700;" href="#">설정</a></li>
  </ul>
  </div>
	</article>

<div class="row" id="d_member">
   <div class="col-md-6 col-md-offset-3"><h2 id='inwon'>인원(<%=memberList.size() %>)</h2>
   <footer><cite title="Source Title">현재 참여중인 팀원을 나타냅니다.</cite></footer>
      <br>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
       <ul class="nav nav-pills">
  			<li id="teamMember" role="presentation" class="active"><a href="#">팀원</a></li>
  			<li id="invite" role="presentation"><a href="#">팀원초대</a></li>
      <li><form class="navbar-form" style="margin-left:500px;" role="search">
        <input type="text" id="mem_name" class="form-control" placeholder="검색" style="width:200px">
      </form>
      </li>
		</ul>
      
    </div><!-- /.navbar-collapse -->
   
      
      <div class="table-responsive">
   <div id="d_table">   
  <table class="table" id="t_member">
  <thead>
    <tr>
      <th scope="col">이름</th>
      <th scope="col">아이디</th>
      <th scope="col">역할</th>
      <th scope="col">권한</th>
    </tr>
  </thead>
  <tbody id="tb_member">
    <% 
	if(memberList!=null&&memberList.size()>0){
		for(Map<String,Object> rMap:memberList){
			 mem_name =(String)rMap.get("MEM_NAME");
			 mem_id=(String)rMap.get("MEM_ID");
			 p_role = (String)rMap.get("TM_ROLE");
			 pm = String.valueOf(rMap.get("P_M"));
%>
	
	
	
	  <tr>
      <th scope="row"><%=mem_name %></th>
      <td><%=mem_id %></td>
      <td><%=p_role %></td>
      <%if(pm.equals("1")){%>
       
       <td>관리자</td>
     
     <% }else{%>
    	 <td>노예</td>
     <% } %>
      
    </tr>
<%
		}
		}else{
%>

<%
		}
%>
    
  </tbody>
</table>
</div>
</div>
   </div>

</div>
<!-- 초대 화면 -->
<div id="d_invite" class="text-center">

</div>

<!-- 초대화면  -->


</body>
</html>