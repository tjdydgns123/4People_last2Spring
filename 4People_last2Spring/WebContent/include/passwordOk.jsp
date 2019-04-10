<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int result = (Integer)request.getAttribute("result");
	String command = (String)request.getAttribute("command");
%>
  
<%if(command.equals("password")){
if(result == 1){%>
		<div class="alert alert-info alert-dismissable">
          <a class="panel-close close" data-dismiss="alert">×</a> 
          <i class="fa fa-coffee"></i>
          이 페이지는 <strong>개인정보</strong>페이지 입니다.
        </div>
        <h3>비밀번호 수정</h3>	
          <div class="form-group" style='margin-top:100px;'>
            <label class="col-md-3 control-label">비밀번호:</label>
            <div class="col-md-8">
              <input class="form-control" id='passwordCheck' onchange="passwordChecked()" type="password">
            	&nbsp;&nbsp;<span id="newCheck"></span>
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label">비밀번호 확인:</label>
            <div class="col-md-8">
              <input class="form-control" id='newPasswordCheck' name= 'mem_pw' onchange="passwordChecked()" type="password">
            	&nbsp;&nbsp;<span id="newSame"></span>
            </div>
          </div>
          <button class='btn btn-danger pull-right' onclick='newPasswordUpd()'>변경</button>
	<script type="text/javascript">
	var result=0;
	function newPasswordUpd(){
		$("body").css("background-color", "#D5D5D5");
		$('#loadingModal').modal({backdrop: 'static'});
		$('#loadingModal').modal('show');
		$('#f_profile').attr('onsubmit','return true');
		$('#f_profile').attr('action','./newPasswordUpd');
		$('#f_profile').submit();
		}
	function passwordChecked(){
		var pass = $("#passwordCheck").val();
		var pass_check= $("#newPasswordCheck").val();
		if(pass.length<8||pass.length>16){
			$('#newCheck').text('암호를 8자이상 16자 이하로 설정해주세요');
			document.getElementById('newCheck').style.color='red';
			result=0;
		}
		else{
			$('#newCheck').text('');
			document.getElementById('newCheck').style.color='blue';
			result=1;
		}
		if(pass!=pass_check){
			$('#newSame').text('비밀번호가 일치하지 않습니다.');
			document.getElementById('newSame').style.color='red';
			result=0;
		}
		else if(pass==pass_check){
			$('#newSame').text('비밀번호가 일치 합니다');
			document.getElementById('newSame').style.color='blue';
			result=1;
		}
	}
	</script>
	
<%} else{%>
      	<h3>비밀번호 확인</h3> <div class='form-inline' style='margin-top:100px;'><label class='col-md-3 control-label'>비밀번호</label>
		 <div class='col-md-8'><input class='form-control'id='passwordOk'onkeydown='if(key.keyCode == 13){passwordOk2()}' type='password'><button style='margin-left:15px;'class='btn btn-info' onclick='passwordOk2()'>확인</button></div></div>
		<input type='hidden' id='command' value='password'>
	<script>
	$(function(){
		alert("비밀번호가 틀립니다.");
	});
	</script>

<%}}else{if(result == 1){%>
		<div class="modal fade" id="memberDeleteModal" role="dialog">
  <div class="modal-dialog modal-sm" >
    <div class="modal-content">
      <div class="modal-header">
        <span class="modal-title text-center" style='font-size:20px; font-weight:bold; margin-left:20px;padding:10px;color:#BDBDBD;'>회원탈퇴</span>
         <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      
      <div class="modal-body" style='overflow-x:hidden; height:100px;'>
      		<div style='padding:10px; color:#BDBDBD; font-szie:15px; margin-top:20px;'>정말 탈퇴 하시겠습니까?</div>
    	</div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-default" id="memberDeleteOk" onclick='memberDeleteOk()' data-dismiss="modal" style='border:0; color:#47C83E;'><i class="fas fa-check"></i>&nbsp;탈퇴</button>
        <button type="button" class="btn btn-default" data-dismiss="modal" style='border:0; color:#FF0000;'><i class="fas fa-times"></i>&nbsp;취소</button>
      </div>
  </div>
</div>
</div>
<script>
$(function(){
$('#memberDeleteModal').modal('show');
});
</script>
<%}else{ %>
	<h3>비밀번호 확인</h3> <div class='form-inline' style='margin-top:100px;'><label class='col-md-3 control-label'>비밀번호</label>
		 <div class='col-md-8'><input class='form-control'id='passwordOk'onkeydown='if(key.keyCode == 13){passwordOk2()}' type='password'><button style='margin-left:15px;'class='btn btn-info' onclick='passwordOk2()'>확인</button></div></div>
		<input type='hidden' id='command' value='memberDelete'>
	<script>
	$(function(){
		alert("비밀번호가 틀립니다.");
	});
	</script>

<%}} %>
