<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<%
	List<Map<String,Object>> myMeetingRoomNames = (List<Map<String,Object>>)request.getAttribute("myMeetingRoomNames");
	int size = myMeetingRoomNames.size();
	
	String mr_name = "";
	String mr_no = "";
	

	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/pretty-checkbox@3.0/dist/pretty-checkbox.min.css" rel="stylesheet"/>
<jsp:include page="../include/top.jsp" flush="false">
	<jsp:param value="" name="top" />
</jsp:include>
<script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js"
	type="text/javascript"></script>
<link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css"
	rel="stylesheet" type="text/css" />
<title>Insert title here</title>
<style type="text/css">
.where {
  display: block;
  margin: 25px 15px;
  font-size: 11px;
  color: #000;
  text-decoration: none;
  font-family: verdana;
  font-style: italic;
} 




.filebox input[type="file"] {
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip:rect(0,0,0,0);
    border: 0;
}

.filebox label {
    display: inline-block;
    padding: .5em .75em;
    color: #999;
    font-size: inherit;
    line-height: normal;
    vertical-align: middle;
    background-color: #fdfdfd;
    cursor: pointer;
    border: 1px solid #ebebeb;
    border-bottom-color: #e2e2e2;
    border-radius: .25em;
}

/* named upload */
.filebox .upload-name {
    display: inline-block;
    padding: .5em .75em;
    font-size: inherit;
    font-family: inherit;
    line-height: normal;
    vertical-align: middle;
    background-color: #f5f5f5;
  border: 1px solid #ebebeb;
  border-bottom-color: #e2e2e2;
  border-radius: .25em;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
}

.filebox.bs3-primary label {
  color: #fff;
    background-color: #337ab7;
    border-color: #2e6da4;
}
</style>
<script type="text/javascript">
	var mr_no;
		$(document).ready(function (){
			var sBtn = $("#roomName").find("a");    //  ul > li 이를 sBtn으로 칭한다. (클릭이벤트는 li에 적용 된다.)
			  sBtn.click(function(){   // sBtn에 속해 있는  a 찾아 클릭 하면.
			   sBtn.removeClass("active");     // sBtn 속에 (active) 클래스를 삭제 한다.
			   $(this).addClass("active"); // 클릭한 a에 (active)클래스를 넣는다.
				  })
				  
			   $('#roomFile').on('change',handleImgFileSelect);

			//x버튼 눌럿을떄
				
// 	$('.teamDelete').click(function(){
// 				$(this).parent().remove();
// 		});

	//로드시 화면호출
	set_mr_no();
	
// 	$(function(){
// 		 $("#btn_submit").click(function(){
// 		    $.post("경로", $(".sform").serialzie(), function(data){

// 		   });
// 		 });
// 		});
			});
		function handleImgFileSelect(e){
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);
				filesArr.forEach(function (f){
						if(!f.type.match('image.*')){
								alert('확장자는 이미지 확장자만 가능합니다.');
								return;
								}
						sel_file =f;

						var reader = new FileReader();
						reader.onload = function(e){
								$('#roomImage').attr('src',e.target.result);
							}
						reader.readAsDataURL(f);
					});
			}
		function teamInsert(){
			var param = 'mr_no='+mr_no
					
			$.ajax({
				type:"POST"
			   ,url:"./roomTeamInsert"
			   ,data:param
			   ,dataType:"html"
			   ,success:function(data){
				    $('#temaList').html(data);
				    $('#teamInsert').modal('show');
				   }
				});
			}
		function set_mr_no(){
			code = '<%="side"+myMeetingRoomNames.get(0).get("MR_NO")%>'
			changeRoom(code);
			}
		function changeRoom(id){
			str = id.split('e');
			mr_no = str[1];
			var param = "mr_no="+mr_no;
				$.ajax({
							type:"POST"
						   ,url:"./changeRoom"
						   ,data:param
						   ,dataType:"html"
						   ,success:function(data){
							    $('#teamButton').html(data);
							   }
					});
			}
	
	function roomUpd(){
		var append = "<input type='hidden'name='mr_no'value="+mr_no+">";
		$('#f_roomUpd').append(append);
		$('#f_roomUpd').attr('onsubmit','return true');
		$('#f_roomUpd').submit();
		}	

	function teamDelete(id){
		var team_code = id;
		$('#team_code'+id).remove();
		var param = "team_code="+team_code+"&mr_no="+mr_no;
		
		$.ajax({
					type:"POST"
				   ,url:"./teamDelete"
				   ,data:param
				   ,dataType:"html"
				   ,success:function(data){
					   
					    alert('삭제되었습니다');
					   }
		   			,error:function(){
							alert('실패');
			   			}
			});
		}
	function insertTeamRoom(){
		
		$.ajax({
		    type:"POST"
	               ,url:"./teamAuthorityIns"
	               ,processData: false
	                ,data: formData
	               , contentType: false
	               ,dataType: "json"
	               ,success:function(data){
	            	   $.each(data , function( key, val){
		            	   var team_code = val.TEAM_CODE;
		            	   var team_name = val.TEAM_NAME;
		            	   var append ="<button id='team_code"+team_code+"' class='btn btn-default btn-lg'>"
		            	   				+team_name+"&nbsp;&nbsp;"
		            	   				+"<a id='"+team_code+"'onclick='teamDelete(id)' href='javascript:void(0)'>"
		            	   				+"<img src='../images/buttonClose.png' width='15%' height='10px'></a></button>";
       	   					$('#teamButton').append(append);
						 });
	               }
			});
			$('#checkData').attr('method','POST');
			$('#checkData').attr('action','./teamAuthority');
			
				
		}
</script>
</head>
<body>

<div class='row' style='padding:30px'>
	<div class='col-sm-12'>
		 <!-- Page Content -->
  <div class="container">

    <div class="row">

      <div class="col-sm-3">
        <h1 class="my-4">회의실 이름</h1>
        <div class="list-group" id='roomName'>
        <%for(int i =0; i<size;i++){
        		Map<String,Object> rMap = myMeetingRoomNames.get(i);
				mr_no = (String)rMap.get("MR_NO");
				mr_name = (String)rMap.get("MR_NAME");
	        	if(i==0){
				%>
        	<a id=<%="side"+mr_no%> href="javascript:void(0)" onclick='changeRoom(id)' class="list-group-item active"><%=mr_name %></a>
        <%}else{%>
		  <a id=<%="side"+mr_no%> href="javascript:void(0)" onclick='changeRoom(id)' class="list-group-item"><%=mr_name %></a>
        <%}} %>
         
        </div>
      </div>
      <!-- /.col-lg-3 -->

		<form id='f_roomUpd'method="POST" action="./roomUpd"onsubmit="return false"enctype="multipart/form-data">
      <div class="col-sm-9">
        <div class="card mt-4">
          <img class="card-img-top img-fluid" id='roomImage'  width='100%' height='500px;'>
          <div class="filebox bs3-primary pull-right" style='margin-top:10px;'>
                            <input class="upload-name"  type='hidden' value="파일선택" disabled="disabled">
                            <label for="roomFile">회의실 사진변경</label> 
                          <input type="file" id="roomFile" name='mr_image' class="upload-hidden"> 
                        </div>
          <div class="card-body">
          </div>
        </div>
        <!-- /.card -->

        <div class="card card-outline-secondary my-4" style='margin-top:80px;border: 1px solid #ccc;'>
          <div class="card-header">
             <div class="alert alert-info alert-dismissable">
          <a class="panel-close close" data-dismiss="alert">×</a> 
          <i class="fa fa-coffee"></i>
		          회의실 <strong>정보</strong>수정.
		        </div>
          </div>
          <div class="card-body" style='width:60%;'>
          
          	<div class='form-group' style=' padding: 20px; padding-bottom: 5px;'>
			<label for="mr_name">회의실 이름</label><br> 
			<input type="text" class="form-control" id='mr_name' name='mr_name' readonly>
			</div>
			
           	<div class='form-group' style='padding: 20px; padding-top: 0px;'>
			<label for="mr_loc">회의실 위치</label><br> <input type="text" class="form-control" id="mr_loc" name='mr_loc' readonly> 
			</div>
			
			<div class='form-group'style='padding: 20px; padding-top: 0px; padding-bottom: 0;'>
				<label for="mr_detaileloc">상세주소</label><br> 
				<input type="text" class="form-control" id='mr_detaileloc' name='mr_detaileloc'>
							</div>
			
           	<div class="form-inline">
			 <div class='form-group' style='padding: 20px; padding-top: 0px;'>
				<label for="mr_master">담당자</label> <label for="mr_capacity" style='margin-left:140px;'>수용인원</label><br>
				<input type="text" class="form-control" style='width:45%;' id='mr_master' name='mr_master' readonly>&nbsp;&nbsp;&nbsp;
				<input type="text" class="form-control" style='width:45%;' id='mr_capacity'name='mr_capacity' >
				</div>
				</div>
			
				<div class='form-group' style='padding: 20px; padding-top: 0;'>
				<label for="mr_starttime">이용가능 시간</label><br>
				<input id="mr_starttime" class="form-control"  name='mr_starttime'/><span style='font-size:20px;'>~</span> 
				<input class="form-control"  id='mr_endtime' name='mr_endtime'>
				</div>
				
					<div class='form-group' style='padding: 20px; padding-top: 0px; padding-bottom: 0;'>
						<label for="mr_facility">이용 가능 시설</label><br> 
						<input type="text" class="form-control" id='mr_facility' name='mr_facility'>
					</div>
					
				<div class='form-group' style='padding: 20px; padding-top: 0px; padding-bottom: 0;'>
						<label for="mr_memo">설명</label><br> <input type="text" class="form-control" id='mr_memo' name='mr_memo'>
				</div>	
				<button class="btn btn-success " onclick ="roomUpd()"style='width:30%; margin-left:30%; margin-bottom:10px;'>수정</button>
          </div>
        </div>
        <div class='row' style='margin-top:60px;'>
			<label for="mr_facility" style='font-size:17px; margin-right:20px;'>이용가능 팀</label>
			<button class='btn btn-info btn-sm' onclick='teamInsert()' style='margin-bottom:7px;'>추가</button>
			<br> 	
			<div class="well well-lg" id='teamButton'>
			</div>	
		</div>	
				
            
        <!-- /.card -->
		
      </div>
      <!-- /.col-lg-9 -->
        </form>

    </div>

  </div>
  <!-- /.container -->

  <!-- Footer -->
	</div>
</div>
<!-- 팀 등록 모달 -->
<div class="modal fade" id="teamInsert" role="dialog" >
  <div class="modal-dialog modal-md" style='width:420px;'>
    <div class="modal-content">
      <div class="modal-header">
        <span class="modal-title text-center" style='font-size:20px; font-weight:bold; margin-left:20px;padding:10px;'>팀 추가</span>
         <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      
      <div class="modal-body" id='temaList' style='overflow-x:hidden; height:300px; width:95%; margin-left:10px;'>
      
    	</div>
<!--     <form id='checkData'> -->
      <div class="modal-footer">
      	<button type="button" class="btn btn-default" onclick='insertTeamRoom();'data-dismiss="modal" style='border:0; color:#47C83E;'><i class="fas fa-check"></i>&nbsp;등록</button>
        <button type="button" class="btn btn-default"  data-dismiss="modal" style='border:0; color:#FF0000;'><i class="fas fa-times"></i>&nbsp;나가기</button>
      </div>
<!--       	</form>	 -->
  </div>
</div>
</div>

<!-- 팀 등록 모달 -->
<script>
        $('#mr_starttime').timepicker({
            uiLibrary: 'bootstrap'
        });
        $('#mr_endtime').timepicker({
            uiLibrary: 'bootstrap'
        });
    </script>

</body>
</html>