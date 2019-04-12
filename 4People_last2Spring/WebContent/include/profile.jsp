<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String image = (String)session.getAttribute("MEM_IMAGE");
String imagePath ="http://icons.iconarchive.com/icons/papirus-team/papirus-status/48/avatar-default-icon.png";
if(image!=null){
	 imagePath="http://192.168.0.6:9000/4People_last2Spring/pds/"+image;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../include/top.jsp" flush="false">
	<jsp:param value="" name="top" />
</jsp:include>
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
.footer {
  position: fixed;
  left: 0;
  bottom: 0;
  font-size:12px;
  font-color:gray;
  width: 100%;
  text-align: center;
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
.es_shadow{
		background-color:#F6F6F6;
		box-shadow: 0 3px 6px rgba(0,0,0,.25);
       word-break:break-all;
/*     -webkit-box-shadow: 0 3px 6px rgba(0,0,0,.25); */
/*     -moz-box-shadow: 0 3px 6px rgba(0,0,0,.25); */
}

</style>

<script type="text/javascript">
$(document).ready(function (){

$('#profileFile').on('change',handleImgFileSelect);
profile()
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
						$('#profile_img').attr('src',e.target.result);
					}
				reader.readAsDataURL(f);
			});
	}
function profile(){
	$('#a_password').removeClass('active');
	$('#a_profile').addClass('active');
	 $('#profileInfo').empty();
	$.ajax({
		type:"POST"
	   ,url:"./profile"
	   ,dataType:"html"
	   ,success:function(data){
		   $('#profileInfo').html(data);
	   }
	  ,error:function(jqXHR, exception){

	  }
});
}

function password(){
	$('#a_profile').removeClass('active');
	$('#a_password').addClass('active');
	$('#f_profile').attr('onsubmit','return false');
	$('#profileInfo').empty();
	var append = "<h3>비밀번호 수정</h3> <div class='form-inline' style='margin-top:100px;'><label class='col-md-3 control-label'>비밀번호</label>"
		   			+"<div class='col-md-8'><input class='form-control'id='passwordOk'onkeydown='if(keyCode == 13){passwordOk2()}' type='password'><button style='margin-left:15px;' class='btn btn-info' onclick='passwordOk2()'>확인</button></div></div>"
		   			+"<input type='hidden' id='command' value='password'>";
	$('#profileInfo').append(append);	
}
function memberDelete(){
	$('#a_profile').removeClass('active');
	$('#a_password').addClass('active');
	$('#f_profile').attr('onsubmit','return false');
	$('#profileInfo').empty();
	var append = "<h3>회원탈퇴</h3> <div class='form-inline' style='margin-top:100px;'><label class='col-md-3 control-label'>비밀번호</label>"
		   			+"<div class='col-md-8'><input class='form-control'id='passwordOk'onkeydown='if(keyCode == 13){passwordOk2()}' type='password'><button style='margin-left:15px;' class='btn btn-info' onclick='passwordOk2()'>확인</button></div></div>"
					+"<input type='hidden' id='command' value='memberDelete'>";
	$('#profileInfo').append(append);	
}
function memberDeleteOk(){
	loaction.href='./memberDelete';
}
function passwordOk2(){
	var passwordOk=$('#passwordOk').val();
	var command = $('#command').val();
// 	alert(command);
	var param = 'mem_pw='+passwordOk+"&command="+command;
	 $('#profileInfo').empty();
	$.ajax({
		type:"POST"
	   ,url:"./passwordOk"
       ,data:param
	   ,dataType:"html"
	   ,success:function(data){
		   $('#profileInfo').html(data);
	   }
	  ,error:function(jqXHR, exception){
		
	  }
});
}

</script>

</head>
<body>
<form class="form-horizontal" role="form" id='f_profile' method='POST'  enctype="multipart/form-data">
<div class="container">
    <h1>프로필 수정</h1>
  	<hr>
	<div class="row">
      <!-- left column -->
      <div class="col-md-3">
        <div class="text-center">
          <img id='profile_img'src=<%=imagePath %> width='100px;' height=' 100px;'alt="avatar">
          <div class="filebox bs3-primary" style='margin-top:10px;'>
                            <input class="upload-name" id='fileName' type='hidden' value="파일선택" disabled="disabled">
                            <label for="profileFile">프로필사진을 선택하세요.</label> 
                          <input type="file" id="profileFile" name='mem_img' class="upload-hidden"> 
                        </div>
        </div>
        <ul class="nav nav-pills nav-stacked" style='margin-top:20px;'>
  <li ><a href="javascript:profile()" id='a_profile'><span style='font-size:15px; font-weight:bold;'>프로필수정</span></a></li>
  <li><a href="javascript:password()" id='a_password'><span style='font-size:15px; font-weight:bold;'>비밀번호 변경</span></a></li>
  <li><a href="javascript:memberDelete()" id='a_password'><span style='font-size:15px; font-weight:bold;'>회원 탈퇴</span></a></li>
</ul>
      </div>
      
      <!-- edit form column -->
      <div class="col-md-9 personal-info" id='profileInfo'>
      </div>
  </div>
</div>
</form>
<div class="modal fade" id="loadingModal" role="dialog" style="backdrop:static; ketboard: false; " >
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      
      <div class="modal-body text-center">
      <h2>로딩중입니다.</h2>
         <div id="loading"><img id="loading-image" src="../images/loading2.gif" alt="Loading..." /></div>
      </div>
    </div>
  </div>
</div>
</body>
</html>