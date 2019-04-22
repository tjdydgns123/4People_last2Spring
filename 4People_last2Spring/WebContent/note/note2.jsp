<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.util.*" %>    
<% String mem_id = "";
	mem_id=(String)session.getAttribute("MEM_ID");
	List<Map<String,Object>> noteList = (List<Map<String,Object>>)request.getAttribute("noteList");
	String	mb_code="";
	String	mb_content="";
	String	mTime="";
	String	mb_sender="";
	String	mb_check="";
	String	color="";
	String str ="";
	String result = "0";
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../include/top.jsp" flush="false">
		<jsp:param value="" name="top" />
</jsp:include>
<!-- <link href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.2/css/bootstrap.css" rel="stylesheet"/> -->
<link href="https://cdn.jsdelivr.net/npm/pretty-checkbox@3.0/dist/pretty-checkbox.min.css" rel="stylesheet"/>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.2/jquery-ui.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.2/js/bootstrap.js"></script>

<title>Insert title here</title>
<style type="text/css">


.es_message{
		margin-bottom:20px;
		background-color:#F6F6F6;
		box-shadow: 0 3px 6px rgba(0,0,0,.25);
       width: 350px; 
       height:70px;
       word-break:break-all;
/*     -webkit-box-shadow: 0 3px 6px rgba(0,0,0,.25); */
/*     -moz-box-shadow: 0 3px 6px rgba(0,0,0,.25); */
}
div#frame {
/*     width: 800px; */
/*     height: 600px; */
    padding-top: 25px;
     padding-right: 35px; 
}
.note {
    width: 220px;
    height: 220px;
    box-shadow: 0 3px 6px rgba(0,0,0,.25);
    -webkit-box-shadow: 0 3px 6px rgba(0,0,0,.25);
    -moz-box-shadow: 0 3px 6px rgba(0,0,0,.25);
    float: left;
    margin: 5px;
    border: 1px solid rgba(0,0,0,.25);
    
}
 
.sticky1 {
    transform: rotate(-3.5deg);
    -webkit-transform: rotate(-3.5deg);
    -moz-transform: rotate(-3.5deg);
    background-color: #FAED7D;
    word-wrap:break-word;
    
}
.sticky2 {
    background-color: #FAED7D;
}
.es_pin {
  background-color: #aaa;
  display: block;
  height: 32px;
  width: 2px;
  position: absolute;
  left: 50%;
  top: -16px;
  z-index: 1;
}
.es_pin:after {
  background-color: #A31;
  background-image: radial-gradient(25% 25%, circle, hsla(0,0%,100%,.3), hsla(0,0%,0%,.3));
  border-radius: 50%;
  box-shadow: inset 0 0 0 1px hsla(0,0%,0%,.1),
              inset 3px 3px 3px hsla(0,0%,100%,.2),
              inset -3px -3px 3px hsla(0,0%,0%,.2),
              23px 20px 3px hsla(0,0%,0%,.15);
  content: '';
  height: 12px;
  left: -5px;
  position: absolute;
  top: -10px;
  width: 12px;
}
.es_pin:before {
  background-color: hsla(0,0%,0%,0.1);
  box-shadow: 0 0 .25em hsla(0,0%,0%,.1);
  content: '';

  height: 24px;
  width: 2px;
  left: 0;
  position: absolute;
  top: 8px;

  transform: rotate(57.5deg);
  -moz-transform: rotate(57.5deg);
  -webkit-transform: rotate(57.5deg);
  -o-transform: rotate(57.5deg);
  -ms-transform: rotate(57.5deg);

  transform-origin: 50% 100%;
  -moz-transform-origin: 50% 100%;
  -webkit-transform-origin: 50% 100%;
  -ms-transform-origin: 50% 100%;
  -o-transform-origin: 50% 100%;
}

div#frame a:hover.note {
    border: 1px solid rgba(0,0,0,.75);
    -webkit-transform: scale(1.1);
    -moz-transform: scale(1.1);
    transform: scale(1.1);
}
.text {
    margin: 10px;
    margin-top:17px;
    font-family: 'The Girl Next Door', cursive;
}
/*  */

/* .es_info-color { */
/*     background-color: rgb(51, 181, 229) !important; */
/* } */
.navbar-default .navbar-nav>li>a {
    color: #FFF;
    margin-bottom:5px;
}
h2{
	color:#EAEAEA;
}
body.bggrey {
  background-color: white;
  padding-right:0 !important;
}

.footer {
  position: fixed;
  left: 0;
  bottom: 0;
  font-size:12px;
  font-color:gray;
  width: 100%;
  text-align: center;
}
.ui-autocomplete {
    position: absolute;
    z-index: 1040;
    cursor: default;
    padding: 0;
    margin-top: 2px;
    list-style: none;
    background-color: #ffffff;
    border: 1px solid #ccc
    -webkit-border-radius: 5px;
       -moz-border-radius: 5px;
            border-radius: 5px;
    -webkit-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
       -moz-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
}
.ui-autocomplete > li {
  padding: 3px 20px;
}
.ui-autocomplete > li.ui-state-focus {
  background-color: #DDD;
}
.ui-helper-hidden-accessible {
  display: none;
}

</style>

<script type="text/javascript">
var color ="#FAED7D";
var mem_id = "<%=mem_id%>";
var note_id  = "";

$(document).ready(function () {
	var send_contents ="";
	var receive_id ="";
	var tag = "<nav class='navbar navbar-default es_info-color' style='border:0; position:relative; margin-bottom:0; '>"
			 +"<div class='container-fluid'><div class='navbar-header'><button type='button' class='navbar-toggle collapsed' data-toggle='collapse' data-target='#bs-example-navbar-collapse-1'>"
			 +"<span class='sr-only'>Toggle navigation</span><span class='icon-bar'></span><span class='icon-bar'></span><span class='icon-bar'></span></button></div>"
			 +" <div class='collapse navbar-collapse' id='bs-example-navbar-collapse-1'><ul class='nav navbar-nav'>"
			 +"<li><a href='javascript:newNoteModal()''><i class='fas fa-plus-circle fa-2x'></i><span style='font-size:20px; magin-bottom:10px;'>&nbsp;새 메모</span></a></li>"
			 +"<li><a href='javascript:messageModal()''><i class='fas fa-envelope-open fa-2x'></i><span style='font-size:20px; magin-bottom:10px;'>&nbsp;내 우편함</span></a></li>"
			 +"<li><a href='javascript:sendModal()''><i class='fas fa-paper-plane fa-2x'></i><span style='font-size:20px; magin-bottom:10px;'>&nbsp;메모 보내기</span></a></li>"
	  		 +"<li><a href='javascript:deleteModal()'><i class='fa fa-trash fa-2x' aria-hidden='true'></i><span style='font-size:20px; magin-bottom:10px;'>&nbsp;삭제</span></a></li></ul></div></div></nav>";
	    
	  $('#nav_top').append(tag);    
	
	//메모보내기 회원 검색 ajax
	$('#receive_id').keyup(function (){
		var searchName =$("#receive_id").val();
		var param = "searchName="+searchName;
			$.ajax({
				type:"POST"
			   ,url:"./sendSearch"
			   ,data:param
			   ,dataType:"json"
			   ,success:function(data){
				   $(function (){
					  var value =[];
						 $.each(data , function( key, val){
							value.push(val.MEM_NAME+" ["+val.MEM_ID+"]");
						 });
				   $(".autocomplete").autocomplete({
					    source: value
					  });
					  });
			   }
			  ,error:function(e){
				 console.log(e.printstack);
			  }
			});
	});

	//메모 보내기 버튼을 눌럿을경우
	document.getElementById("sendButton").onclick = function () {
		 send_contents =$('#send_contents').val();
		 receive_id = $("#receive_id").val();
			
			$('#sendModal').modal('hide');  
		    var str = receive_id.split("["); 
		    var receive_name = str[0];
			//trigger next modal
			$("#receive_id_ok").text(receive_name+'님에게...');
			$('#send_contents_ok').val(send_contents);
		    $('#sendModalOk').modal('show');  
		    
	        
	}
	//내용확인후 확인버튼 눌럿을떄
	document.getElementById("sendButtonOk").onclick = function (){
		var param = "mb_content="+send_contents+"&receive_id="+receive_id+"&note_code="+color;
		var str = receive_id.split('[');
		var str2 = str[1].split(']');
		var mem_id = str2[0];
		
		$.ajax({
			type:"POST"
			,url:"./sendNote"
			,data:param
			,dataType:"html"
			,success:function(data){
				alert("전송성공");
				var obj={
						gubun : 'sendNote'
					    ,id : mem_id
				}
				var json = JSON.stringify(obj);
				socket.send(json);
			}
		,error:function(e){
			alert("전송실패");
		}
		});
		
		
	}
	
	//메모 저장 버튼 눌럿을때
	document.getElementById("editButton").onclick = function () {
		var contents = $("#editcontent").val();
		$("#editcontent").val("");	
		var param ="mb_content="+contents+"&note_code="+color+"&mem_id="+mem_id+"&mb_sender="+mem_id;
	
				$.ajax({
					type:"POST"
				   ,url:"./newNote"
				   ,data:param
				   ,dataType:"text"
				   ,success:function(data){
					   	var notes=$('#notes').html();
					   	var datas = data+notes;
					   	$('#notes').empty();
						$('#notes').append(datas);
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
		
	};
	
	$('#deleteButton').click(function(){
		var param = "mb_code="+note_id;
		$.ajax({
					type:"POST"
				   ,url:"./noteDelete"
				   ,data:param
				   ,dataType:"html"
				   ,success:function(data){
					   $("#"+note_id+'note').remove();
						note_id="";
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
		
	});
	
	//메모를 클릭했을때
	$('.mymemo').click(function(){
	    note_id = $(this).attr("id");
	    var node =$(this).children('.check');
	    $('#'+note_id).append(check);
	});
	//우편함 등록버튼눌럿을시
	$('#insertMessage').click(function() {
		$('#checkDatas').attr("method","POST");
		$('#checkDatas').attr("action","./insertMessage");
		$('#checkDatas').submit();
		
		
	});
	//우편함 삭제버튼 클릭시
	$('#deleteMessage').click(function() {
		$('#checkDatas').attr("method","POST");
		$('#checkDatas').attr("action","./deleteMessage");
		$('#checkDatas').submit();
	});
	
});
	
	//색 저장
		 
	function yellow(){
		color ="#FAED7D";
	}	 
	function blue(){
		color ="#00D8FF";
	}	 
	function green(){
		color ="#B7F0B1";
		
	}	 
	function orange(){
		color ="#FFC19E";
	}	 
	function red(){
		color ="#FFA7A7";
	}
	function purple(){
		color ="#A566FF";
	}
	
	
	//우편함 클릭시 
	function messageModal(){
		var param ="#";
		$.ajax({
			type:"POST"
				   ,url:"./noteMessage"
				   ,data:param
				   ,dataType:"json"
				   ,success:function(data){
// 					   $('#messageModal').modal('show');
						$('#messageModalBody2').empty();		
					   $.each(data , function( key, val){
							var name = val.MB_SENDER;
							var content = val.MB_CONTENT;
							var mb_code =	val.MB_CODE;
							var tag = "<div class='container noteMessage' id='msg"+mb_code+"'><div class='row'><div class='col-sm-3'><div class='es_message'><div class='form-inline'>"
										+"<label  style='font-size:20px; font-weight:bold;'>"+name
										+"</label></div><label>"
										+content+"</label></div></div><div class='col-sm-1'><div class='pretty p-svg p-curve pull-right'  style='margin-top:10px;'>"
										+"<input type='checkbox' class='min' id='check"+mb_code+"'/><div class='state p-success'><svg class='svg svg-icon' viewBox='0 0 20 20'>"
										+"<path d='M7.629,14.566c0.125,0.125,0.291,0.188,0.456,0.188c0.164,0,0.329-0.062,0.456-0.188l8.219-8.221c0.252-0.252,0.252-0.659,0-0.911c-0.252-0.252-0.659-0.252-0.911,0l-7.764,7.763L4.152,9.267c-0.252-0.251-0.66-0.251-0.911,0c-0.252,0.252-0.252,0.66,0,0.911L7.629,14.566z' style='stroke: white;fill:white;'></path>"
						    			+"</svg><label></label></div></div> </div> </div></div>";
						    $('#messageModalBody2').append(tag);	
						 });
					 //우편함 메모를 클릭햇을때
						$('.min').click(function() {
							var checkid=$(this).attr('id');
							var str = checkid.split("k");
							var id = str[1];
							if($("input:checkbox[id="+checkid+"]").is(":checked") == true){ 
								var append = "<input  type='hidden' name='"+id+"' value='"+id+"'  id='"+id+"'/>"
								$('#checkDatas').append(append);
							}
							else{
								var el = $("#"+id);
								el.remove();
								$('#checkDatas').removeChild(el);
							}

							
//					 	     p-success
						});
					   $('#messageModal').modal('show');
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
		        	$('#messageModal').modal('show');
		        	
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
	//새 메모눌럿을떄 모달띄우기
	function newNoteModal(){
		$('#editModal').modal('show');
	}
	//노트 삭제버튼 모달띄우기
	function deleteModal(){
		if(note_id==''){
			alert("삭제할 메모를 선택해주세요");
		}
		else{
		$('#deleteModal').modal('show');
		}
	}
	//메모 보내기 모달
	function sendModal(){
		$('#send_contents').val("");
		$('#sendModal').modal('show');
	}
	
	

</script>

</head>
<body class='bggrey'>

<!-- 상단 -->


<!-- body -->
<div class="container-fluid" style="height: 95vh; margin-top:150px; ">
    <div class="row content" style="height: 100%">
      <div class="col-sm-12"  style="height: 100%">
        <h1>메모</h1>
        <div class="row" style="height: 50%;" id='notes'>
        <% if(noteList.size()>0&&noteList!=null){
        	for(int i=0; i<noteList.size(); i++){
        	mb_code=(String)noteList.get(i).get("MB_CODE");
        	mb_content=(String)noteList.get(i).get("MB_CONTENT");
        	str=(String)noteList.get(i).get("MB_TIME");
        	mTime=str.substring(0,10);
        	mb_sender=(String)noteList.get(i).get("MB_SENDER");
        	mb_check=(String)noteList.get(i).get("MB_CHECK");
        	color=(String)noteList.get(i).get("NOTE_CODE");
        	
         %>
         <div id='<%=mb_code+"note"%>'>
		<div class='col-sm-2'>
		<div id='frame'><a class='note sticky1 mymemo'id="<%=mb_code%>" style='background-color:<%=color%>;'>
		<div class='es_pin'></div><div class='text' ><%=mb_content%></div>
		<div class='footer'><%=mTime+"  "+mb_sender%></div></a></div></div></div>
		<%	}
        }%>	
        </div>
        
<!--         <div class="row" style="height: 50%;"> -->
<!--           <div class="col-sm-12"> -->
<!--             <h1>쪽지</h1> -->
<!--             <div class="row" id="deletedContainer"> -->

<!--             </div> -->
<!--           </div> -->
<!--         </div> -->
      </div>
      </div>
      </div>
<!-- body -->








<!-- modal -->
<!-- new Note -->
<div class="modal fade" id="editModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Memo</h4>
        </div>
        <div class="modal-body">
          <form role="form" name="editNote" id="editSticky">
            <div class="control-group form-group">
            </div>
            <div class="control-group form-group">
              <div class="controls">
                <label for="content">내용</label>
                <textarea id="editcontent" class="form-control" maxlength="999" rows="10" cols="100" required style="resize: none;">서대리 아이디:dydgns11@naver.com</textarea>
              </div>
            </div>
            <div class="modal-footer" id="create">
            <input type="button" style="float:left; background-color:#FAED7D;" class='btn' onClick="yellow()"/>
            <input type="button" style="float:left; background-color:#00D8FF;" class='btn' onClick="blue()"/>
            <input type="button" style="float:left; background-color:#B7F0B1;" class='btn' onClick="green()"/>
            <input type="button" style="float:left; background-color:#FFC19E;" class='btn' onClick="orange()"/>
            <input type="button" style="float:left; background-color:#FFA7A7;" class='btn' onClick="red()"/>
            <input type="button" style="float:left; background-color:#A566FF;" class='btn' onClick="purple()"/>
            </div>
            <div id="success"></div>
            <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
            <button type="button" class="btn btn-primary pull-right" id="editButton" style="margin-bottom:10px" data-dismiss="modal">저장</button>
          </form>
        </div>
      </div>
    </div>
  </div>
<!-- new Note -->
<!-- Delete Note -->
<div class="modal fade" id="deleteModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">삭제</h4>
        </div>
        <div class="modal-body">
          <p>노트를 삭제하시겠습니까?</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" id="deleteButton" data-dismiss="modal">Yes</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
        </div>
      </div>
    </div>
  </div>
<!-- Delete Note -->
<!-- send Note -->
<div class="modal fade" id="sendModal" role="dialog" >
    <div class="modal-dialog modal-sm">
      <div class="modal-content" style='background-color:#EAEAEA;'>
        <div class="modal-header text-center">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">메모보내기</h4>
        </div>
        <div class="modal-body">
         	<div class="form-group ui-widget">
			    <label>수신자</label>
			    <input class="form-control autocomplete" placeholder="이름을 입력하세요" id='receive_id' />
			  </div>
         	<div class='form-group'>
         		<label for="send_contents">내용(50자 이하 입력)</label>
         		<textarea  class='form-control'id='send_contents' style='height:100px;'>뭐해....같이 밥먹을까....?</textarea>
         	</div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" id="sendButton" data-dismiss="modal">Yes</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
        </div>
      </div>
    </div>
  </div>
<!-- send Note -->
<!-- send Note OK -->
<div class="modal fade" id="sendModalOk" role="dialog" >
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
       
        <h4 class="modal-title text-center" id="myModalLabel">내용확인</h4>
      </div>
      
      <div class="modal-body">
         <p id="receive_id_ok" class="font-weight-bold"></p>
         <label for="send_contents">보내는 내용</label>
      	<textarea  class='form-control' readonly="readonly" id='send_contents_ok' style='height:100px;'></textarea>
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-default" id="sendButtonOk" data-dismiss="modal">Yes</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<!-- send Note OK -->
<!-- 우편함 modal -->
<div class="modal fade" id="messageModal" role="dialog" >
  <div class="modal-dialog modal-md" style='width:420px;'>
    <div class="modal-content">
      <div class="modal-header">
        <img width="50px" height="50px"src="data:image/png;base64,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">
        <span class="modal-title text-center" style='font-size:20px; font-weight:bold; margin-left:20px;padding:10px;'>내 우편함</span>
         <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      
      <div class="modal-body" style='overflow-x:hidden; height:300px;' id='messageModalBody2'>
      		<br><br><br><br><span class='text-center'><h2>아무것도없어.....</h2></span>
    	</div>
    	<form id='checkDatas'>
      <div class="modal-footer">
      	<button type="button" class="btn btn-default" id="insertMessage" data-dismiss="modal" style='border:0; color:#47C83E;'><i class="fas fa-check"></i>&nbsp;등록</button>
        <button type="button" class="btn btn-default" id='deleteMessage' data-dismiss="modal" style='border:0; color:#FF0000;'><i class="fas fa-times"></i>&nbsp;삭제</button>
      </div>
      	</form>
  </div>
</div>
</div>
<!-- 우편함 modal -->
<!-- modal -->

</body>
</html>