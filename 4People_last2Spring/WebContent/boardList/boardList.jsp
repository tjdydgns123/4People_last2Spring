<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import ="java.util.*" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<jsp:include page="../include/top.jsp"  flush="false">
		<jsp:param value="" name="top" />
	</jsp:include> 
<title>Insert title here</title>
<%
   String mem_id = (String)session.getAttribute("MEM_ID");
	String board_no = (String)request.getAttribute("board_no");
	String titlee ="자바팀";
	
 List<Map<String,Object>> board_List =(List<Map<String,Object>>)request.getAttribute("b_boardList");
		List<String> BLIST_NO =new ArrayList<String>();
		List<String> BLIST_TITLE = new ArrayList<String>();
		List<String> BL_team_code = new ArrayList<String>();
		List<String> C_BLIST_NO =new ArrayList<String>();
		List<String> CARD_CODE =new ArrayList<String>();
		List<String> CARD_NAME =new ArrayList<String>();
	    String t_team_code= null;  
		List<String> BLISTMap = null;
		List<String> CARDLISTMAP = null;
		if(board_List!=null){
	    		t_team_code=board_List.get(0).get("r_team_code").toString();
				BLISTMap =(List<String>) board_List.get(0).get("BLISTMAP");
				CARDLISTMAP =(List<String>) board_List.get(0).get("CARDLISTMAP");
		}
		if(BLISTMap!=null){
		Iterator itr = BLISTMap.iterator();
		while(itr.hasNext()){
			Map<String,Object> pMap = (Map<String,Object>)itr.next();
			Object keys[] = pMap.keySet().toArray();
			for(int j=0;j<keys.length;j++){
				if(keys[j].equals("TEAM_CODE")){
					BL_team_code.add(pMap.get(keys[j]).toString());
				}
				else if(keys[j].equals("BLIST_NO")){
					BLIST_NO.add(pMap.get(keys[j]).toString());
				}
				else if(keys[j].equals("BLIST_TITLE")){
					BLIST_TITLE.add(pMap.get(keys[j]).toString());
				}
				
			}
		}}
		if(CARDLISTMAP!=null){
		Iterator ctr = CARDLISTMAP.iterator();
		while(ctr.hasNext()){
			Map<String,Object> pMap = (Map<String,Object>)ctr.next();
			Object keys[] = pMap.keySet().toArray();
			for(int j=0;j<keys.length;j++){
				if(keys[j].equals("CARD_CODE")){
					CARD_CODE.add(pMap.get(keys[j]).toString());
				}
				else if(keys[j].equals("BLIST_NO")){
					C_BLIST_NO.add(pMap.get(keys[j]).toString());
				}
				else if(keys[j].equals("CARD_NAME")){
					CARD_NAME.add(pMap.get(keys[j]).toString());
				}
				
			}
		}}
		
		
%>
<style type="text/css">

.testimonial-group > .row {
  overflow-x: auto;
  white-space: nowrap;
   height:830px; 
}
 .testimonial-group > .row > .col-sm-2 { 
    display: inline-block;  
    float: none;   
 } 
.es_info-color {
    background-color: rgb(51, 181, 229) !important;
}
.navbar-default .navbar-nav>li>a {
    color: #FFF;
    margin-bottom:5px;
}
.modal-backdrop {
	position: absolute;
	top: 0;
	right: 0;
	left: 0;
	background-color:transparent ; !important;
}


/* Decorations */
/* .col-sm-2 { color: #fff; font-size: 48px; padding-bottom: 20px; padding-top: 18px; } */
/* .col-sm-2:nth-child(3n+1) { background: #c69; } */
/* .col-sm-2:nth-child(3n+2) { background: #9c6; } */
/* .col-sm-2:nth-child(3n+3) { background: #69c; } */
</style>
<script type="text/javascript">
<%-- 	alert("<%=BLISTMap%>"); --%>
<%-- 	alert("<%=CARDLISTMAP%>"); --%>
<%-- 	alert("<%=CARD_CODE.size()%>"); --%>
var color ="btn-default";
var temp = new Array();
var label_code='';

function mo_close(){
	$('#label_modal2').modal('hide');
}
function mo_close2(){
	$('#label_modal').modal('hide');
}
function label_codee(id){
	label_code= id;
	
}

/* 은수 */
  var card_code=''; 
  var team_code = '<%=t_team_code%>';
  var des_code = '';
  function commentDeletModal(){
	  $ ( '#commentDeleteModal' ). modal({
		    target : '#checkList' 
		});
		  
	 $('#commentDeleteModal').modal('show');
	 
  }
 
 	function label_del(){
 		var param = "label_code="+label_code;
		$.ajax({
			type:"POST"
		   ,url:"../card/labelDEL?"
		   ,data:param
		   ,dataType:"html"
		   ,success:function(data){
			   $('#'+label_code+'').remove();
			   $('#cardmodal').modal('show');
		   }
		  ,error:function(jqXHR, exception){
			  if (jqXHR.status === 0) {
		            alert('Not connect.\n Verify Network.');
		        }
		        else if (jqXHR.status == 400) {
		            alert('Server understood the request, but request content was invalid. [400]');
		        }
		        else if (jqXHR.status == 401) {
		            alert('Unauthorized access. [401]');
		        }
		        else if (jqXHR.status == 403) {
		            alert('Forbidden resource can not be accessed. [403]');
		        }
		        else if (jqXHR.status == 404) {
		            alert('Requested page not found. [404]');
		        }
		        else if (jqXHR.status == 500) {
		            alert('Internal server error. [500]');
		        }
		        else if (jqXHR.status == 503) {
		            alert('Service unavailable. [503]');
		        }
		        else if (exception === 'parsererror') {
		            alert('Requested JSON parse failed. [Failed]');
		        }
		        else if (exception === 'timeout') {
		            alert('Time out error. [Timeout]');
		        }
		        else if (exception === 'abort') {
		            alert('Ajax request aborted. [Aborted]');
		        }
		        else {
		            alert('Uncaught Error.n' + jqXHR.responseText);
		        }


		  }
});
 	}
 	function label_Upd(){
 		var text =''; 
 			text = document.getElementById('label_text2').value;
		 var param = "label_content="+text+"&label_color="+color+"&label_code="+label_code;
		 if(text.length<1){
		 $('#'+label_code+'').attr('class','btn '+color+'');
		 } else{
		 $('#'+label_code+'').attr('value',text);
		 $('#'+label_code+'').attr('class','btn '+color+'');
		 }
			$.ajax({
					type:"POST"
				,url:"../card/labelUPD"
					,data:param
						   ,dataType:"html"
						   ,success:function(result){
// 							   $('#card_label').empty();
// 						    $('#card_label').append(result);
						   }
						   });
 	}
		function comment(){
			var comment = $('#input_comment').val();
			alert(comment);
			var param = "comment="+comment+"&card_code="+card_code+"&team_code="+team_code;
			$.ajax({
				type:"POST"
			   ,url:"../card/card.for?crud=commentIns"
			   ,data:param
			   ,dataType:"json"
			   ,success:function(data){
				   var comment_code =data;
				   
				   var today = new Date();
				   var dd = today.getDate();
				   var mm = today.getMonth()+1; //January is 0!
				   var yyyy = today.getFullYear();
				   var sigan = today.getHours()+":"+today.getMinutes();
				   var week = new Array('일요일','월요일','화요일','수요일','목요일','금요일','토요일','일요일');
				   var day = week[today.getDay()];
				   if(dd<10) {
				       dd='0'+dd
				   } 

				   if(mm<10) {
				       mm='0'+mm
				   } 
				   today = yyyy+'-'+mm+'-'+dd;
				   
				   var mem_name ='<%=session.getAttribute("MEM_NAME")%>'
				   alert(mem_name);
				   var append = "<div class='es_comment' style='background-color: #D9D9D9;'>"
				   				+"<img  width='30px' height='30px'  src='../images/comment.png'>"
				   				+"<label><span style='font-size:20px; color:#4374D9; font_weight:bold; margin:5px;'>"+mem_name+"</span><span style='font-size:8px;'>"+today+"&nbsp;&nbsp;"+day+" &nbsp;&nbsp;"+sigan+"</span></label>"
				   				+"<a href='javascript:commentDeletModal()' style='margin-left:300px;'> <img  width='15px' height='15px'  src='../images/commentDelete.png'></a>"
				   				+"<div class='es_contant' style='padding-left:40px;'><span>"+comment+"</span></div></div></div>"
					
				   	$('#coment').append(append);			
				   	$('#input_comment').val("");
				   
			   }
			  ,error:function(jqXHR, exception){
				  if (jqXHR.status === 0) {
			            alert('Not connect.\n Verify Network.');
			        }
			        else if (jqXHR.status == 400) {
			            alert('Server understood the request, but request content was invalid. [400]');
			        }
			        else if (jqXHR.status == 401) {
			            alert('Unauthorized access. [401]');
			        }
			        else if (jqXHR.status == 403) {
			            alert('Forbidden resource can not be accessed. [403]');
			        }
			        else if (jqXHR.status == 404) {
			            alert('Requested page not found. [404]');
			        }
			        else if (jqXHR.status == 500) {
			            alert('Internal server error. [500]');
			        }
			        else if (jqXHR.status == 503) {
			            alert('Service unavailable. [503]');
			        }
			        else if (exception === 'parsererror') {
			            alert('Requested JSON parse failed. [Failed]');
			        }
			        else if (exception === 'timeout') {
			            alert('Time out error. [Timeout]');
			        }
			        else if (exception === 'abort') {
			            alert('Ajax request aborted. [Aborted]');
			        }
			        else {
			            alert('Uncaught Error.n' + jqXHR.responseText);
			        }


			  }
	});
		}
/* 은수 */
 
	function cardAdd(id){
// 		alert(id);
		document.getElementById(id+'tt').innerHTML+="<input type='text' id='"+id+"textval'>";
		if(id=="gg"){
		document.getElementById(id+'bb').innerHTML+="<input type='button' class='btn btn-success' value='생성' onClick='boardlistAdd("+id+")'>";
		}
		else{
		document.getElementById(id+'bb').innerHTML+="<input type='button' class='btn btn-success' value='생성' onClick='cardlist("+id+")'>";
		}
	}
	function boardlistAdd(id){
// 		alert(id);
		alert("<%=board_no%>");
		var r_BL_team_code = "<%=t_team_code%>";
		alert(r_BL_team_code);
		alert(r_BL_team_code.substring(1,2));
		var str_team_code = r_BL_team_code.substring(1,2);
		var input2 = document.getElementById('ggtextval').value;
		<%=titlee%> = input2;
// 		var param = "bd_title="+input2;
		var param = "?team_code="+r_BL_team_code+"&mem_id=<%=mem_id%>&board_no=<%=board_no%>&BLIST_TITLE="+input2;
		alert(param);
		$('#jae').empty();
<%-- 		location.href="./boardList.for?crud=ins&team_code=<%=BL_team_code%>&mem_id=<%=mem_id%>&board_no=<%=board_no%>&BLIST_TITLE="+input2; --%>
		location.href="./boardListINS"+encodeURI(param);
			
// 			$.ajax({
// 				type:"POST"
<%-- 			   ,url:"./boardList.for?crud=ins&team_code=<%=BL_team_code%>&mem_id=<%=mem_id%>&board_no=<%=board_no%>&BLIST_TITLE="+input2 --%>
// 			   ,data:param
// 			   ,dataType:"html"
// 			   ,success:function(result){
// 				   $("#jae").html(result);
				   
// 			   }
// 			  ,error:function(){
// 				  $("#d_table").text(e.responseText);
// 			  }
// 			});
	}
	function cardlist(id){

		var input = document.getElementById(id+'textval').value;
          $('#'+id+'tt').empty();
		$('#'+id+'bb').empty();
		document.getElementById(id+"cardAdd").innerHTML+="<input type='button' class='btn btn-default btn-block' value='"+input+"'>";
		var r_BL_team_code = "<%=t_team_code%>";
		var param = "team_code="+r_BL_team_code+"&board_no=<%=board_no%>&mem_id=<%=mem_id%>&card_name="+input+"&BLIST_NO="+id;
		location.href="./boardListINS2?"+encodeURI(param);
		

	}
	function cardOpen(id){
		var param = "card_code="+id;
		//은수
		card_code =id;  
		//은수
			$('#cardmodal').empty();
			$.ajax({
					type:"POST"
				,url:"../card/cardSel"
					,data:param
						   ,dataType:"html"
						   ,success:function(result){
						    $('#cardmodal').append(result);
// // 							   $('#myModal').modal()  
// 							   $('#cardmodal').modal('show');
						   }
			,error:function(jqXHR, exception){
				  if (jqXHR.status === 0) {
			            alert('Not connect.\n Verify Network.');
			        }
			        else if (jqXHR.status == 400) {
			            alert('Server understood the request, but request content was invalid. [400]');
			        }
			        else if (jqXHR.status == 401) {
			            alert('Unauthorized access. [401]');
			        }
			        else if (jqXHR.status == 403) {
			            alert('Forbidden resource can not be accessed. [403]');
			        }
			        else if (jqXHR.status == 404) {
			            alert('Requested page not found. [404]');
			        }
			        else if (jqXHR.status == 500) {
			            alert('Internal server error. [500]');
			        }
			        else if (jqXHR.status == 503) {
			            alert('Service unavailable. [503]');
			        }
			        else if (exception === 'parsererror') {
			            alert('Requested JSON parse failed. [Failed]');
			        }
			        else if (exception === 'timeout') {
			            alert('Time out error. [Timeout]');
			        }
			        else if (exception === 'abort') {
			            alert('Ajax request aborted. [Aborted]');
			        }
			        else {
			            alert('Uncaught Error.n' + jqXHR.responseText);
			        }


			  }
			});
			
	}
			function labelAdd(){
// 				document.getElementById("card_label").innerHTML+="<input type='button' class='btn btn-default ' value='gg'>";
			}
			 function addInput() {
			      temp=document.getElementById("label_text").value;
				 var param = "label_content="+temp+"&label_color="+color+"&mem_id=<%=mem_id%>&team_code=<%=t_team_code%>&card_code="+card_code;
// 				document.getElementById("card_label").innerHTML+="<input type='button' class='btn "+color+" ' value='"+temp+"'>";
// 				$("#card_label").append("<input type='button' class='btn "+color+" ' value='"+temp+"' data-toggle='modal' data-target=''#label_modal2' onClick='label_codee(id)''>");
<%-- 				  location.href="../card/card.for?crud=labelins&label_content="+temp+"&label_color="+color+"&mem_id=<%=mem_id%>&team_code=<%=t_team_code%>&card_code="+card_code; --%>
				  
// 				  $('#card_label').empty();
					$.ajax({
							type:"POST"
						,url:"../card/labelINS"
							,data:param
								   ,dataType:"html"
								   ,success:function(result){
								    $('#card_label').append(result);
		// // 							   $('#myModal').modal()  
// 		 							   $('#cardmodal').modal('show');
								   }
					,error:function(jqXHR, exception){
// 		 							   $('#cardmodal').modal('show');
						  if (jqXHR.status === 0) {
					            alert('Not connect.\n Verify Network.');
					        }
					        else if (jqXHR.status == 400) {
					            alert('Server understood the request, but request content was invalid. [400]');
					        }
					        else if (jqXHR.status == 401) {
					            alert('Unauthorized access. [401]');
					        }
					        else if (jqXHR.status == 403) {
					            alert('Forbidden resource can not be accessed. [403]');
					        }
					        else if (jqXHR.status == 404) {
					            alert('Requested page not found. [404]');
					        }
					        else if (jqXHR.status == 500) {
					            alert('Internal server error. [500]');
					        }
					        else if (jqXHR.status == 503) {
					            alert('Service unavailable. [503]');
					        }
					        else if (exception === 'parsererror') {
					            alert('Requested JSON parse failed. [Failed]');
					        }
					        else if (exception === 'timeout') {
					            alert('Time out error. [Timeout]');
					        }
					        else if (exception === 'abort') {
					            alert('Ajax request aborted. [Aborted]');
					        }
					        else {
					            alert('Uncaught Error.n' + jqXHR.responseText);
					        }


					  }
					});
				}
			function defaultt(){
				color ="btn-default";
			}	 
			function primary(){
				color ="btn-primary";
			}	 
			function success(){
				color ="btn-success";
			}	 
			function info(){
				color ="btn-info";
			}	 
			function warning(){
				color ="btn-warning";
			}	 
			function danger(){
				color ="btn-danger";
			}
			function descriptionIns(id){
				alert(id);
				des_code = id;
				var text = '';
					text = $('#des_text').val();
					 var param = "des_content="+text+"&des_maker=<%=mem_id%>&team_code=<%=t_team_code%>&card_code="+card_code;
				alert(text);
				$('#des_con').empty();
				$('#des_bt').empty();
				document.getElementById('des_con').innerHTML+="<span><h5>"+text+"</h5></span>";
				document.getElementById('hth').innerHTML+="<a style='margin-left:20px'>edit</a>";
				
				$.ajax({
					type:"POST"
				,url:"../card/desINS"
					,data:param
						   ,dataType:"html"
						   ,success:function(result){
// 						    $('#card_label').append(result);
						   }
							});
				}
			function desUPD(id){
				des_code = id;
				alert(id);
				document.getElementById('des_conss').innerHTML+= "<textarea  id='des_text' style='margin-left:50px; width:500px; height:150px; border-radius: 8px 8px 8px 10px; border:0; '/>";
				document.getElementById('des_bt').innerHTML+=  "<input type='button' style='margin-left:50px; margin-top:10px' class='btn btn-success col-sm-2 col-sm-offset-5' value='저장' onClick='descriptionUPD()'>";
					
			}
				function descriptionUPD(){
					
				var text = '';
				text = $('#des_text').val();
				var param = "des_content="+text+"&des_no="+des_code;
				alert(text);
				if(text.length==0){
					alert('빈'+text.length);
				$('#des_conss').empty();
				$('#des_bt').empty();
					}
				else{
					alert('찬'+text.length)
				$('#des_conss').empty();
				$('#des_cons').empty();
				$('#des_cons').append("<span><h5>"+text+"</h5></span>");
				$('#des_bt').empty();
			
				$.ajax({
					type:"POST"
				,url:"../card/desUPD"
					,data:param
						   ,dataType:"html"
						   ,success:function(result){
// 						    $('#card_label').append(result);
						   }
							});
					}
				}
	
</script>
</head>
<body style="background-color:2489F8;">


	<div id="haha" class="panel panel-primary"  >
    <div class="panel-heading">
        <h3 class="panel-title"><img src="../images/team.png"> <%=titlee%></h3>
    </div>
    </div>
    
    <!--===================== 리스트들============================= -->
     <div  id="jae" class="testimonial-group">
      <div class="row">
		<% for(int i=0;i<BLIST_NO.size();i++){ %>
     <div id=<%=BLIST_NO.get(i) %> class="panel panel-default col-sm-2" style="background-color: #F6F6F6; margin-left:15px;">
  <!-- Default panel contents -->
     <div  class="panel-heading"><h4 id="listtitle"><%=BLIST_TITLE.get(i) %></h4></div>

  <!-- Table -->
     <table class="table" id=<%=BLIST_NO.get(i)+ "cardAdd"%>>
 	  <tr id=<%=BLIST_NO.get(i)+"tt" %>>
 	  </tr>
 	  <tr id=<%=BLIST_NO.get(i)+"bb" %>> 	
   	</tr>
   	<%for(int j=0;j<C_BLIST_NO.size();j++){
   	  if(C_BLIST_NO.get(j).equals(BLIST_NO.get(i))){
   	   %>
   	<input  id=<%=CARD_CODE.get(j) %> type="button" class="btn btn-default btn-block" value=<%=CARD_NAME.get(j) %> data-toggle="modal"  data-backdrop="static" data-target="#cardmodal" onClick="cardOpen(id)">
   	<%}} %>
  </table>
  <div class="panel-heading"><a id="gg" href="javascript:cardAdd(<%=BLIST_NO.get(i) %>)" >+ 새 카드 추가하기</a></div>
</div>

<%}%>
 <div id=min class="panel panel-default col-sm-2" style="background-color: #F6F6F6; margin-left:15px;">
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
</div>
    </div>
<!--=====================리스트 끝 ================================ -->
<!--  ======================= 모달 ============================= -->
<div class="modal fade" id="cardmodal" tabindex="-1" role="dialog" aria-labelledby="cardmodal" aria-hidden="true" >
</div>
<!--  ======================= 모달 ============================= -->

<!-- 은수 -->
<!-- ================commentDleteModal==================== -->

<div class="modal fade"  id="commentDeleteModal" role="dialog" >
    <div class="modal-dialog modal-sm" >
      <div class="modal-content" style='position:fixed-center'>
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">삭제</h4>
        </div>
        <div class="modal-body">
          <p>댓글을 삭제하시겠습니까?</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" id="deleteButton" data-dismiss="modal">Yes</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
        </div>
      </div>
    </div>
  </div>
<!-- =================commentDleteModal================= -->
<!-- 은수 -->



</body>
</html>