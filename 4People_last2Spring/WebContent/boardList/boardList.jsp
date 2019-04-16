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
	
 List<Map<String,Object>> board_List =(List<Map<String,Object>>)request.getAttribute("b_boardList");
		List<String> BLIST_NO =new ArrayList<String>();
		List<String> BLIST_TITLE = new ArrayList<String>();
		List<String> BL_team_code = new ArrayList<String>();
		List<String> C_BLIST_NO =new ArrayList<String>();
		List<String> CARD_CODE =new ArrayList<String>();
		List<String> CARD_NAME =new ArrayList<String>();
		List<String> profile_image =new ArrayList<String>();
	    String t_team_code= null;  
	    String t_team_name = null;
	    String top_board_name = null;
		List<String> BLISTMap = null;
		List<String> CARDLISTMAP = null;
		List<String> profileMap = null;
		if(board_List!=null){
	    		t_team_code=board_List.get(0).get("r_team_code").toString();
	    		t_team_name=board_List.get(0).get("team_name").toString();
	    		top_board_name=board_List.get(0).get("board_name").toString();
	    		profileMap =(List<String>) board_List.get(0).get("porfileMap");
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
		if(profileMap!=null){
		Iterator porfiletr = profileMap.iterator();
		while(porfiletr.hasNext()){
			Map<String,Object> pMap = (Map<String,Object>)porfiletr.next();
			Object keys[] = pMap.keySet().toArray();
			for(int j=0;j<keys.length;j++){
				if(keys[j].equals("mem_image")){
					profile_image.add(pMap.get(keys[j]).toString());
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

 body{
 background-color:rgb(51, 181, 229);
}


/* #sidebar { font-size: 14px; z-index: 100;  */
/* -webkit-transform: translate3d(-300px,0,0); */
/* -moz-transform: translate3d(-300px,0,0); */
/* transform: translate3d(-300px,0,0); */
/* -webkit-transition: all 0.2s; */
/* -moz-transition: all 0.2s; */
/* -ms-transition: all 0.2s; */
/* -o-transition: all 0.2s; */
/* transition: all 0.2s; */
/* } */

/* html.open #sidebar { overflow-y: auto; */
/* -webkit-transform: translate3d(0,0,0); */
/* -moz-transform: translate3d(0,0,0); */
/* transform: translate3d(0,0,0); */
/* -webkit-transition: all 0.2s; */
/* -moz-transition: all 0.2s; */
/* -ms-transition: all 0.2s; */
/* -o-transition: all 0.2s; */
/* transition: all 0.2s; */
/* } */

/* #sidebar-toggle { display: block; position: fixed; left: 10px; bottom: 10px;  */
/*                   width: 50px; height: 50px; line-height: 55px; text-align: center;  */
/*                   color: #555; background-color: #f1f1f1; border-radius: 10px; opacity: 0.9; box-shadow: 0 0 10px #aaa; z-index: 101; } */


/* Decorations */
/* .col-sm-2 { color: #fff; font-size: 48px; padding-bottom: 20px; padding-top: 18px; } */
/* .col-sm-2:nth-child(3n+1) { background: #c69; } */
/* .col-sm-2:nth-child(3n+2) { background: #9c6; } */
/* .col-sm-2:nth-child(3n+3) { background: #69c; } */
  #page-wrappervv {
    padding-left: 250px;
  }
  
  #sidebar-wrappervv {
    position: fixed;
    width: 310px;
    height: 100%;
    margin-left: 72%;
    background: #FFFFFF;
    overflow-x: hidden;
    overflow-y: auto;
  }
  
  #page-content-wrappervv {
    width: 100%;
    padding: 20px;
  }
  /* 사이드바 스타일 */
  
  .sidebar-navvv {
    width: 250px;
    margin: 0;
    padding: 0;
    list-style: none;
  }
  
  .sidebar-navvv li {
    text-indent: 1.5em;
    line-height: 2.8em;
  }
  
  .sidebar-navvv li a {
    display: block;
    text-decoration: none;
    color: #999;
  }
  
  .sidebar-navvv li a:hover {
    color: #fff;
    background: rgba(255, 255, 255, 0.2);
  }
  
  .sidebar-navvv > .sidebar-brand {
    font-size: 1.3em;
    line-height: 3em;
  }

</style>
<script type="text/javascript">
<%-- 	//alert("<%=BLISTMap%>"); --%>
<%-- 	//alert("<%=CARDLISTMAP%>"); --%>
<%-- 	//alert("<%=CARD_CODE.size()%>"); --%>
var color ="btn-default";
var temp = new Array();
var label_code='';
var card_code=''; 
var team_code = '<%=t_team_code%>';
var des_code = '';
var parti_code ='';
var check_code = '';

function mo_close(){
	$('#label_modal2').modal('hide');
}
function mo_close2(){
	$('#label_modal').modal('hide');
}
function mo_close3(){
	$('#label_modal3').modal('hide');
}
function mo_close4(){
	$('#checkModal').modal('hide');
}
function mo_close5(){
	$('#label_modal4').modal('hide');
}
function label_codee(id){
	label_code= id;
	
}


/* 첨부파일 */
	function akakl(e){
		e.preventDefault();
		
		$('#fname').click();



		}

	function fileINS(){
// 		  var form = $('#fileBoxform')[0];
// 		  var formData = new FormData(form);
		var uploadFile = $('.fileBox .uploadBtn');
		uploadFile.on('change', function(){
			if(window.FileReader){
				var filename = $(this)[0].files[0].name;
			} else {
				var filename = $(this).val().split('/').pop().split('\\').pop();
			}
			$(this).siblings('.fileName').val(filename);
			 $(this).siblings('.upload-name').val(filename);
			 var formData = new FormData();
 		formData.append("fname", $("input[name=fname]")[0].files[0]);
 		formData.append("card_code", card_code);
 		formData.append("f_team_code", team_code);
 		formData.append("f_maker", "<%=mem_id%>");
 		
//  		$('#f_card_code').attr('value',card_code);
// 		$('#f_team_code').attr('value',team_code);
<%-- 		$('#f_maker').attr('value',"<%=mem_id%>"); --%>
			 $.ajax({
					type:"POST"
				   ,url:"../card/fileINS"
				   ,data:formData
					,processData: false
					, contentType: false
				   ,success:function(result){
//						   $("#membergood").html(result);
					   $("#card_c_file").append(result);
// 					   parent.opener.location.reload();
// 					   window.open('', '_self', '').close();
					   
				   }
				  ,error:function(request,status,error){
					  
						  //alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				  }
				});

			   $("#fname").val("");

// 			   $("#fileBoxform").attr("method","post");
// 	           $("#fileBoxform").attr("action","../card/fileINS");
// 	           window.open('about:blank','hoho','width=400,height=300');
// 	           $("#fileBoxform").submit();
// 	           $('#cardmodal').modal('show');
			
	       	           
		});

		
		}
	function filedown(p_fname){
		location.href="../card/downLoad.jsp?fname="+p_fname;
		}
	 function file_del(id){
		$('#'+id+'').remove();
		var param = "att_no="+id;
		$.ajax({
			type:"POST"
		   ,url:"../card/fileDEL"
		   ,data:param
		   ,dataType:"html"
		   ,success:function(result){
			   
		   }
		  ,error:function(request,status,error){
//				  //alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
		  }
		});
		 }
/* 첨부파일 */

/* 기한설정 */
	function gihan(e){ 
  $("#datepicker").datepicker({ 
        autoclose: true, 
        todayHighlight: true
  });
//   .datepicker('update', new Date());
$('#gihanz').on('change',function () {
 //alert($('#gihanz').val());
 var card_duedate = $('#gihanz').val();
 var param = "card_duedate="+card_duedate+"&card_code="+card_code; 
	$.ajax({
		type:"POST"
	   ,url:"../card/cardDueDateUPD"
	   ,data:param
	   ,dataType:"html"
	   ,success:function(result){
		   $('#myModalLabel').empty();
		   $('#myModalLabel').append(result);
	   }
	});

//  $('#gihanz').val("");
e.preventDefault();

});
}
/* 기한설정 */

/* 체크리스트 */

// var count = 0;
function checkAdd(){
	var check_text = $('#check_text').val();
	//alert(check_text);
	var param = "check_title="+check_text+"&team_code="+team_code+"&card_code="+card_code+"&check_maker=<%=mem_id%>";
	$.ajax({
		type:"POST"
	   ,url:"../card/checkINS"
	   ,data:param
	   ,dataType:"html"
	   ,success:function(result){
//			   $("#membergood").html(result);
		   $("#check_list").empty();
		   $("#check_list").append(result);
		   
	   }
	  ,error:function(request,status,error){
			  //alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
	  }
	});
	
}
function checklistadd(id){
	check_code = id;
	//alert("checklistadd");
	//alert($('#check_list').children("#cklist_title").length);
// 	//alert($('#check_list').children("input[name=text]").length);
	if($('#check_list').children("#cklist_title").length==0){
		//alert("hnhn");
	var $div = "<div id='cklist_title'><input type='text' name='text' id='ckli_text'><button onClick='cklistINS()'>생성</button><button onClick='ck_cancle()'>취소</button></div>"
	$("#check_addhaja").after($div);
		}
}
 function ck_cancle(){
// 	 //alert("취소");
		$('#cklist_title').remove();
	 }
function cklistINS(){
	var text = $('#ckli_text').val();
	//alert(text);
	$('#cklist_title').empty();
	var param = "check_con_name="+text+"&check_con_maker=<%=mem_id%>&check_code="+check_code+"&card_code="+card_code;
	$.ajax({
		type:"POST"
	   ,url:"../card/checklistINS"
	   ,data:param
	   ,dataType:"html"
	   ,success:function(result){
//			   $("#membergood").html(result);
		$("#check_list").empty();
// 		 //alert(result);
		   $("#check_list").append(result);
		   
	   }
	  ,error:function(request,status,error){
		  //alert("에러");
//			  //alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
	  }
	});
	
}

 function checkDEL(id){
	//alert("checkDEL");

	var param = "check_code="+id;
	$.ajax({
		type:"POST"
	   ,url:"../card/checkDEL"
	   ,data:param
	   ,dataType:"html"
	   ,success:function(result){
		   $("#check_list").remove();
	   }
	  ,error:function(request,status,error){
			  //alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
	  }
	});
	 }
 function ck_con_del(id){
// 	 $('#'+id+'').remove();
	 var param = "card_code="+card_code+"&check_con_code="+id;
		$.ajax({
			type:"POST"
		   ,url:"../card/checklistDEL"
		   ,data:param
		   ,dataType:"html"
		   ,success:function(result){
//				   $("#membergood").html(result);
			$("#check_list").empty();
			   $("#check_list").append(result);
			   
		   }
		  ,error:function(request,status,error){
			  //alert("에러");
//				  //alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
		  }
		});
	 }

/* 체크리스트 */
 function mouse(id){

$('#'+id+'').on('mousedown', function() {
	if (event.button == 2) {
		//alert(parti_code);
	}	  
	});
 
	 }
 function drag(event) {
	   event.dataTransfer.setData("Text", event.target.id);
// 	   event.target.style.color = 'green';
	}
function allowDrop(event) {  
	    event.preventDefault();
	}
function drop(event) {
	    event.preventDefault();
	    parti_code = event.dataTransfer.getData("text");
	    //alert(parti_code);
// 	    //alert($('parti_code').attr('name'));
// 		//alert("parit_code: "+parti_code);
// 		//alert("event: "+event.dataTransfer.getData("text"));


		$('#'+parti_code+'').remove();
		var param ="parti_code="+parti_code;

		$.ajax({
			type:"POST"
		   ,url:"../card/partiDEL"
		   ,data:param
		   ,dataType:"html"
		});
	}
	
	/* 카드 참여자 초대  */
	function mem_name_ajax(){
// 		//alert($("#label_text5").val());
// 	//alert("dd");
	$('#label_text5').keyup(function (){
// 	//alert("df");
		$("#membergood").empty();

		var mem_name =$("#label_text5").val();
		var param ="mem_name="+mem_name+"&team_code="+team_code+"&card_code="+card_code;

			$.ajax({
				type:"POST"
			   ,url:"../team/member2"
			   ,data:param
			   ,dataType:"html"
			   ,success:function(result){
				   $("#membergood34").html(result);
				   
			   }
			  ,error:function(request,status,error){
				  //alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			  }
			});
			});
		
		}
		
	
	
	function memberinvate(id){
		var param = "mem_id=<%=mem_id%>&team_code="+team_code+"&card_code="+card_code+"&parti_id="+id;
// 		//alert(id);
// 		$('#membersja').append("<button style='background-color:#FFFFFF;height:33px;margin-right:5px'>"+id+"</button>");
		$.ajax({
			type:"POST"
		   ,url:"../card/memberINS"
		   ,data:param
		   ,dataType:"html"
		   ,success:function(result){
			   $('#membersja').append(result);
		   } ,error:function(){
			   //alert("실패에염")
				  $("#membersja").text(e.responseText);
			  }
		});
			   $('#label_text5').val("-");
		var mem_name =$("#label_text5").val();
		var param ="mem_name="+mem_name+"&team_code="+team_code+"&card_code="+card_code;

			$.ajax({
				type:"POST"
			   ,url:"../team/member2"
			   ,data:param
			   ,dataType:"html"
			   ,success:function(result){
				   $("#membergood34").html(result);
				   
			   }
			  ,error:function(request,status,error){
				  //alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			  }
			});
			   $('#label_text5').val("");
		var mem_name =$("#label_text5").val();
		var param ="mem_name="+mem_name+"&team_code="+team_code+"&card_code="+card_code;

			$.ajax({
				type:"POST"
			   ,url:"../team/member2"
			   ,data:param
			   ,dataType:"html"
			   ,success:function(result){
				   $("#membergood34").html(result);
				   
			   }
			  ,error:function(request,status,error){
				  //alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			  }
			});
		
	}


  function commentDeletModal(){
	  $ ( '#commentDeleteModal' ). modal({
		    target : '#checkList' 
		});
		  
	 $('#commentDeleteModal').modal('show');
	 
  }
 
 	function label_del(){
 		var param = "label_code="+label_code;
			   $('#'+label_code+'').remove();
		$.ajax({
			type:"POST"
		   ,url:"../card/labelDEL"
		   ,data:param
		   ,dataType:"html"
		   ,success:function(data){
// 			   $('#cardmodal').modal('show');
		   }
		  ,error:function(jqXHR, exception){
			


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
 	/*   코멘트   */
		function comment(){
			var comment = $('#input_comment').val();
// 			//alert(comment);
			var param = "comment="+comment+"&card_code="+card_code+"&team_code="+team_code+"&comm_maker=<%=mem_id%>";
			$.ajax({
				type:"POST"
			   ,url:"../card/commentIns"
			   ,data:param
			   ,dataType:"text"
			   ,success:function(result){
				   //alert(result);
				  	$('#comments').empty();
				  	$('#input_comment').val("");
				   	$('#comments').append(result);			
				   
			   }
			  ,error:function(jqXHR, exception){
				  if (jqXHR.status === 0) {
			            //alert('Not connect.\n Verify Network.');
			        }
			        else if (jqXHR.status == 400) {
			            //alert('Server understood the request, but request content was invalid. [400]');
			        }
			        else if (jqXHR.status == 401) {
			            //alert('Unauthorized access. [401]');
			        }
			        else if (jqXHR.status == 403) {
			            //alert('Forbidden resource can not be accessed. [403]');
			        }
			        else if (jqXHR.status == 404) {
			            //alert('Requested page not found. [404]');
			        }
			        else if (jqXHR.status == 500) {
			            //alert('Internal server error. [500]');
			        }
			        else if (jqXHR.status == 503) {
			            //alert('Service unavailable. [503]');
			        }
			        else if (exception === 'parsererror') {
			            //alert('Requested JSON parse failed. [Failed]');
			        }
			        else if (exception === 'timeout') {
			            //alert('Time out error. [Timeout]');
			        }
			        else if (exception === 'abort') {
			            //alert('Ajax request aborted. [Aborted]');
			        }
			        else {
			            //alert('Uncaught Error.n' + jqXHR.responseText);
			        }


			  }
	});
		}

	function commDEL(id){
		var param = "comm_no="+id+"&card_code="+card_code;
		$.ajax({
			type:"POST"
		   ,url:"../card/commentDEL"
		   ,data:param
		   ,dataType:"text"
		   ,success:function(result){
// 			   //alert(result);
			  	$('#comments').empty();
			  	$('#input_comment').val("");
			   	$('#comments').append(result);			
			   
		   }
		});
	}
 	/*   코멘트   */
	function cardAdd(id){
// 		//alert(id);
// 		//alert($('#'+id+'tt').children('input[type=text]').length);
		if($('#'+id+'tt').children('input[type=text]').length==0){
		document.getElementById(id+'tt').innerHTML+="<input type='text' id='"+id+"textval'>";
		if(id=="gg"){
		document.getElementById(id+'bb').innerHTML+="<input type='button' class='btn btn-success' value='생성' onClick='boardlistAdd("+id+")'><input type='button' class='btn btn-danger' value='취소' onClick='boardlist_cancle("+id+")'>";
		}
		else{
		document.getElementById(id+'bb').innerHTML+="<input type='button' class='btn btn-success' value='생성' onClick='cardlist("+id+")'><input type='button' class='btn btn-danger' value='취소' onClick='cardlist_cancle("+id+")'>   ";
		}
			}
	}
	function boardlist_cancle(id){
	 $('#ggtt').empty();
	 $('#ggbb').empty();
		}
	function cardlist_cancle(id){
	 $('#'+id+'tt').empty();
	 $('#'+id+'bb').empty();
		}
	function boardlistAdd(id){
// 		//alert(id);
		//alert("<%=board_no%>");
		var r_BL_team_code = "<%=t_team_code%>";
		//alert(r_BL_team_code);
		//alert(r_BL_team_code.substring(1,2));
		var str_team_code = r_BL_team_code.substring(1,2);
		var input2 = document.getElementById('ggtextval').value;
// 		var param = "bd_title="+input2;
		var param = "?team_code="+r_BL_team_code+"&mem_id=<%=mem_id%>&board_no=<%=board_no%>&BLIST_TITLE="+input2;
		//alert(param);
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
		//alert(card_code);
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
			            //alert('Not connect.\n Verify Network.');
			        }
			        else if (jqXHR.status == 400) {
			            //alert('Server understood the request, but request content was invalid. [400]');
			        }
			        else if (jqXHR.status == 401) {
			            //alert('Unauthorized access. [401]');
			        }
			        else if (jqXHR.status == 403) {
			            //alert('Forbidden resource can not be accessed. [403]');
			        }
			        else if (jqXHR.status == 404) {
			            //alert('Requested page not found. [404]');
			        }
			        else if (jqXHR.status == 500) {
			            //alert('Internal server error. [500]');
			        }
			        else if (jqXHR.status == 503) {
			            //alert('Service unavailable. [503]');
			        }
			        else if (exception === 'parsererror') {
			            //alert('Requested JSON parse failed. [Failed]');
			        }
			        else if (exception === 'timeout') {
			            //alert('Time out error. [Timeout]');
			        }
			        else if (exception === 'abort') {
			            //alert('Ajax request aborted. [Aborted]');
			        }
			        else {
			            //alert('Uncaught Error.n' + jqXHR.responseText);
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
					$('#label_text').val("");
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
					            //alert('Not connect.\n Verify Network.');
					        }
					        else if (jqXHR.status == 400) {
					            //alert('Server understood the request, but request content was invalid. [400]');
					        }
					        else if (jqXHR.status == 401) {
					            //alert('Unauthorized access. [401]');
					        }
					        else if (jqXHR.status == 403) {
					            //alert('Forbidden resource can not be accessed. [403]');
					        }
					        else if (jqXHR.status == 404) {
					            //alert('Requested page not found. [404]');
					        }
					        else if (jqXHR.status == 500) {
					            //alert('Internal server error. [500]');
					        }
					        else if (jqXHR.status == 503) {
					            //alert('Service unavailable. [503]');
					        }
					        else if (exception === 'parsererror') {
					            //alert('Requested JSON parse failed. [Failed]');
					        }
					        else if (exception === 'timeout') {
					            //alert('Time out error. [Timeout]');
					        }
					        else if (exception === 'abort') {
					            //alert('Ajax request aborted. [Aborted]');
					        }
					        else {
					            //alert('Uncaught Error.n' + jqXHR.responseText);
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
				//alert(id);
				des_code = id;
				var text = '';
					text = $('#des_text').val();
					 var param = "des_content="+text+"&des_maker=<%=mem_id%>&team_code=<%=t_team_code%>&card_code="+card_code;
				//alert(text);
// 				$('#des_con').empty();
// 				$('#des_bt').empty();
				$('#card_description').empty();
// 				document.getElementById('des_con').innerHTML+="<span><h5>"+text+"</h5></span>";
// 				document.getElementById('hth').innerHTML+="<a href='#' onclick='desUPD(id)' style='margin-left:20px'>edit</a>";
				
				$.ajax({
					type:"POST"
				,url:"../card/desINS"
					,data:param
						   ,dataType:"html"
						   ,success:function(result){
// 							   //alert(result);
// 						    $('#des_con').append(result);
						    $('#card_description').append(result);
						   }
							});
				}
			function desUPD(id){
				des_code = id;
				//alert(id);
				document.getElementById('des_conss').innerHTML+= "<textarea  id='des_text' style='margin-left:50px; width:500px; height:150px; border-radius: 8px 8px 8px 10px; border:0; '/>";
				document.getElementById('des_bt').innerHTML+=  "<input type='button' style='margin-left:50px; margin-top:10px' class='btn btn-success col-sm-2 col-sm-offset-5' value='저장' onClick='descriptionUPD()'>";
					
			}
				function descriptionUPD(){
					
				var text = '';
				text = $('#des_text').val();
				var param = "des_content="+text+"&des_no="+des_code;
				//alert(text);
				if(text.length==0){
					//alert('빈'+text.length);
				$('#des_conss').empty();
				$('#des_bt').empty();
					}
				else{
					//alert('찬'+text.length)
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

				function vison(){
// 					//alert("vison");
					$('#ccmmdy').attr('style','background-image:url("../images/vison.gif")');
					}
				function topMemberAdd(){
				location.href="../team/member3?team_code=<%=t_team_code%>";
					}

				function mem_name_ajax2(){
					$('#label_text6').keyup(function (){
						$("#membergood").empty();

						var mem_name =$("#label_text6").val();
						var param ="mem_name="+mem_name+"&team_code="+team_code+"&card_code="+card_code;

							$.ajax({
								type:"POST"
							   ,url:"../team/member3"
							   ,data:param
							   ,dataType:"html"
							   ,success:function(result){
								   $("#membergood").html(result);
								   
							   }
							  ,error:function(request,status,error){
//				 				  //alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
							  }
							});
							});

					}
				function memberinvate2(id){
// 				//alert(id);

				var param = "mem_id="+id+"&team_code="+team_code+"&board_no=<%=board_no%>";
//		 		//alert(id);
//		 		$('#membersja').append("<button style='background-color:#FFFFFF;height:33px;margin-right:5px'>"+id+"</button>");
				$.ajax({
					type:"POST"
				   ,url:"./team_memberINS"
				   ,data:param
				   ,dataType:"html"
				   ,success:function(result){
					   $('#top_panel').empty();
					   $('#top_panel').append(result);
				   } ,error:function(jqXHR, exception){
					   if (jqXHR.status === 0) {
				            //alert('Not connect.\n Verify Network.');
				        }
				        else if (jqXHR.status == 400) {
				            //alert('Server understood the request, but request content was invalid. [400]');
				        }
				        else if (jqXHR.status == 401) {
				            //alert('Unauthorized access. [401]');
				        }
				        else if (jqXHR.status == 403) {
				            //alert('Forbidden resource can not be accessed. [403]');
				        }
				        else if (jqXHR.status == 404) {
				            //alert('Requested page not found. [404]');
				        }
				        else if (jqXHR.status == 500) {
				            //alert('Internal server error. [500]');
				        }
				        else if (jqXHR.status == 503) {
				            //alert('Service unavailable. [503]');
				        }
				        else if (exception === 'parsererror') {
				            //alert('Requested JSON parse failed. [Failed]');
				        }
				        else if (exception === 'timeout') {
				            //alert('Time out error. [Timeout]');
				        }
				        else if (exception === 'abort') {
				            //alert('Ajax request aborted. [Aborted]');
				        }
				        else {
				            //alert('Uncaught Error.n' + jqXHR.responseText);
				        }
// 					   //alert("실패에염")
					  }
				});
					   $('#label_text6').val("-");
				var mem_name =$("#label_text6").val();
				var param ="mem_name="+mem_name+"&team_code="+team_code+"&card_code="+card_code;

					$.ajax({
						type:"POST"
					   ,url:"../team/member3"
					   ,data:param
					   ,dataType:"html"
					   ,success:function(result){
						   $("#membergood").html(result);
						   
					   }
					  ,error:function(request,status,error){
						  //alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
					  }
					});
					   $('#label_text6').val("");
				var mem_name =$("#label_text6").val();
				var param ="mem_name="+mem_name+"&team_code="+team_code+"&card_code="+card_code;

					$.ajax({
						type:"POST"
					   ,url:"../team/member3"
					   ,data:param
					   ,dataType:"html"
					   ,success:function(result){
						   $("#membergood").html(result);
						   
					   }
					  ,error:function(request,status,error){
						  //alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
					  }
					});
					}

				$("#sidebar-toggle").click(function(){
					  $("html").toggleClass("open");
					});
				 var cc = 0;
				function showhity(){
// 					alert(cc);
				 if(cc==0){
					$('#page-wrappervv').attr("style","");
						cc=1;
					 }
				 else{
					$('#page-wrappervv').attr("style","visibility:hidden");
						cc=0;

					 }
					}
</script>
</head>
<body >


	<div id="haha" class="panel panel-primary"  >
    <div class="panel-heading" id="top_panel">
        <h3 class="panel-title"><img src="../images/meeting.png">&nbsp;&nbsp;<%=t_team_name %>&nbsp;&nbsp;|&nbsp;&nbsp;<%=top_board_name %>&nbsp;&nbsp;|&nbsp;&nbsp;
        <%if(profileMap!=null){
        	for(int i=0;i<profile_image.size();i++){%>
        <img src="http://192.168.0.6:9000/4People_last2Spring/pds/<%=profile_image.get(i)%>" style="width:40px;height:40px">&nbsp;
        <%}} %>
        <button style="background-color:#FFFFFF; color:#000000;height:40px; border-radius: 8px 8px 8px 10px; border:0;" onClick="mem_name_ajax2()" data-target="#label_modal4" data-toggle="modal">+추가</button>
        <a style="margin-left:60%" href="#" onClick="showhity()" >Show History</a>
        </h3>
		</div>

        </div>
<div id="page-wrappervv">
		 <div id="sidebar-wrappervv">
    <ul class="sidebar-navvv">
      <li class="sidebar-brand">
        <a href="#">Activity</a>
      </li>
      <li><a href="#">메뉴 1</a></li>
      <li><a href="#">메뉴 2</a></li>
      <li><a href="#">메뉴 3</a></li>
      <li><a href="#">메뉴 4</a></li>
      <li><a href="#">메뉴 5</a></li>
      <li><a href="#">메뉴 6</a></li>
      <li><a href="#">메뉴 7</a></li>
      <li><a href="#">메뉴 8</a></li>
      <li><a href="#">메뉴 9</a></li>
    </ul>
  </div>
		</div>

    <div id="label_modal4" class="modal" role="dialog" style="width:400px;margin-left:350px;margin-top:130px">
  		<div class="modal-dialogg" id="label_dialogg4">
    <div class="modal-content" style="position:relative;">
      <div class="modal-header">
        <button type="button" class="close" onClick="mo_close5()">&times;</button>
        <h4 class="modal-title">초대하기</h4>
      </div>
      <div class="modal-body">
        <input type="text" id="label_text6">
      </div>
      <div class="modal-footer">
      <div id="membergood">
      </div>
      	</div>
    	</div>
    	   </div>
    </div>
    <!-- Modal content-->
    
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