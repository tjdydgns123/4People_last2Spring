<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
 <%@ include file="../common/common.jsp" %>

<!-- 부트스트랩css -->
 <link href="../csss/bootstrap.css" rel="stylesheet">
<link href="../csss/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<!-- JS -->


 
 <!-- Custom styles for this template -->
 <link href="../csss/style.css" rel="stylesheet">
 <link href="../csss/timepicki.css" rel="stylesheet">
 <link href="../csss/jiyun.css" rel="stylesheet">
<script type="text/javascript">
function roomIns_save(){
	var mr_image;
    alert("저장-폼전송");
    //폼전송 처리함.
   mr_image=$('#mr_image').val();
    alert(mr_image);
    alert($('#input_file').val());
    
    $('#f_meetRoomIns').attr("method","GET");
    $('#f_meetRoomIns').attr("action","./meetRoom.for?");
    $('#f_meetRoomIns').submit();
 }


</script>
</head>
<body>
	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript">
$(document).ready(function(){ 
	var fileTarget = $('.filebox .upload-hidden');
	fileTarget.on('change', function(){ 
		// 값이 변경되면 
		if(window.FileReader){ // modern browser 
			var filename = $(this)[0].files[0].name;
		} else { // old IE
			var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
			} // 추출한 파일명 삽입 
			$(this).siblings('.upload-name').val(filename);
			});
	
	//preview image
	var imgTarget = $('.preview-image .upload-hidden');
	
	imgTarget.on('change', function(){ 
		var parent = $(this).parent();
		parent.children('.upload-display').remove();
		if(window.FileReader){ //image 파일만 
			if (!$(this)[0].files[0].type.match(/image\//)) return; 
		var reader = new FileReader(); 
		reader.onload = function(e){
			var src = e.target.result;
			parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>'); 
			} 
		reader.readAsDataURL($(this)[0].files[0]);
		} 
		else { 
			$(this)[0].select();
			$(this)[0].blur();
			var imgSrc = document.selection.createRange().text; 
			parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>'); 
			var img = $(this).siblings('.upload-display').find('img'); img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")"; 
			} 
		});

	}); 

</script>

	<br>
	<br>
	<br>
	<h2 align="center">
		안내페이지입니다.
		<div class="container">

			<!-- Trigger the modal with a button -->
			<button type="button" class="btn btn-info btn-lg" id="add"
				data-toggle="modal" data-target="#myModal">추가하기</button>

			<!-- Modal -->
		   <form id="f_meetRoomIns">
		  <input type="hidden" id="crud" name="crud" value="ins"/>
			<div class="modal fade modal-dialog-lg" id="myModal" role="dialog">
				<div class="modal-dialog modal-lg">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h3 class="modal-title">회의실 추가</h3>
						</div>
						<div class="modal-body">
							<div class="filebox preview-image" align="left">
								<br>
								<input  type ="text" id="mr_image" name="mr_image" class="upload-name" value="파일선택" disabled="disabled">
								<label class="labeltext" for="input-file">업로드</label>
								<input type="file"  name="mr_image" id="input-file" class="upload-hidden"> 
							</div>
							<div class="inputbox form-group">
							<label for="meetname" class="inputlabel">회의실 이름</label>
    						<input type="email" id="mr_name" name="mr_name" class="form-control inputlabel meetname" id="meetname" placeholder="입력하세요">
							</div>
							<div class="inputbox form-group">
							<label for="meetplace" class="inputlabel">회의실 위치</label>
    						<input type="email" id="mr_loc" name="mr_loc" class="form-control inputlabel" id="meetplace" placeholder="입력하세요">
							</div>
							<div class="inputbox form-group">
							<label for="person" class="inputlabel">담당자</label>
    						<input type="text" id="mr_master" name="mr_master" class="form-control inputlabel meetperson" placeholder="입력하세요">
							<label for="useperson" class="inputlabel useperson">수용인원</label>
    						<input type="text" id="mr_capacity" name="mr_capacity" class="form-control inputlabel useperson" placeholder="입력하세요">
							</div>
							<div class="inputbox form-group">
							<label for="mr_starttime" class="inputlabel usetime ">이용시간 시작</label>
							<input  id="mr_starttime" name="mr_starttime" class="form-control  usetime" type='text'name='timepicker' placeholder="00:00 AM"/>
							</div>
							<div  class="inputbox form-group">
							<label for="mr_endtime" class="inputlabel usetime ">이용시간 끝</label>
							<input  id="mr_endtime" name="mr_endtime" class="form-control  usetime" type='text'name='timepicker' placeholder="00:00 AM"/></div>
							</div>
							
							<div class="inputbox form-group">
							<label for="facility"  class="inputlabel facility">부가시설</label>
    						<input type="text" id="mr_facility" name="mr_facility" class="form-control inputlabel " id="facility" placeholder="입력하세요">
							</div>
						
							<div class="inputbox form-group container">
								<label for="facility" class="inputlabel facility">내용</label>
								<textarea id="mr_memo" name="mr_memo" class="form-control col-sm" rows="5"></textarea>
							</div>
														
							
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
							<button type="button" id="save" onClick="roomIns_save()" class="btn btn-primary">저장</button>
						</div>
					</div>

				</div>
			</div>

		</div>
		</div>
	 <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="../jss/jquery.min.js"></script>
    <script src="../jss/timepicki.js"></script>
    <script>
	$('#mr_starttime').timepicki();
	$('#mr_endtime').timepicki();
    </script>
    <script src="../jss/bootstrap.min.js"></script>	
</body>
</html>