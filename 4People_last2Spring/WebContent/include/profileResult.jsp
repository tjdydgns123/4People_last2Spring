<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
List<Map<String,Object>> profileList =(List<Map<String,Object>>)request.getAttribute("profileList");
String profile_id ="";
String profile_name ="";
String profile_phone ="";
String profile_comapnyName = "";
String profile_position ="";
if(profileList!=null){
	for(int i =0; i<profileList.size();i++){
		Map<String,Object> pMap = profileList.get(i);
		profile_id = (String)pMap.get("MEM_ID");
		profile_name = (String)pMap.get("MEM_NAME");
		profile_phone = (String)pMap.get("MEM_PHONE");
		profile_comapnyName = (String)pMap.get("MEM_COMPANYNAME");
		profile_position = (String)pMap.get("MEM_POSITION");
		if(profile_position==null){
			profile_position="";
		}
		if(profile_comapnyName==null){
			profile_comapnyName="";
		}
	}
	
}
%>



 <div class="alert alert-info alert-dismissable">
          <a class="panel-close close" data-dismiss="alert">×</a> 
          <i class="fa fa-coffee"></i>
          이 페이지는 <strong>개인정보</strong>페이지 입니다.
        </div>
        <h3>프로필 정보</h3>
          <div class="form-group">
            <label class="col-sm-3 control-label">ID:</label>
            <div class="col-sm-8">
              <input class="form-control" type="text" id='profile_id' name='profile_id'  readonly>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-3 control-label">이름:</label>
            <div class="col-sm-8">
              <input class="form-control" id='profile_name' name='profile_name' type="text">
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-3 control-label">회사명:</label>
            <div class="col-sm-8">
              <input class="form-control" id='profile_companyName' name='profile_companyName' type="text" >
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-3 control-label">직급:</label>
            <div class="col-sm-8">
              <input class="form-control" type="text" id='profile_position' name='profile_position'>
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label">hp:</label>
            <div class="col-md-8">
              <input class="form-control"  id='profile_hp' name='profile_hp' type="text">
            </div>
          </div>

		
          <div class="form-group">
            <label class="col-md-3 control-label"></label>
            <div class="col-md-8">
              <input type="button" class="btn btn-primary" onclick='profileUpd()' value="Save Changes">
              <span></span>
              <input type="reset" class="btn btn-default" value="Cancel">
            </div>
          </div>
          
          
          
<script type="text/javascript">
	$(document).ready(function (){
		var profile_id = '<%=profile_id%>';
		var profile_name = '<%=profile_name%>';
		var profile_comapnyName = '<%=profile_comapnyName%>';
		var profile_phone = '<%=profile_phone%>';
		var profile_position = '<%=profile_position%>';
			$('#profile_id').val(profile_id);
			$('#profile_name').val(profile_name);
			$('#profile_companyName').val(profile_comapnyName);
			$('#profile_hp').val(profile_phone);
			$('#profile_position').val(profile_position);
		});
	function profileUpd(){
		$("body").css("background-color", "#D5D5D5");
		$('#loadingModal').modal({backdrop: 'static'});
		$('#loadingModal').modal('show');
		$('#f_profile').attr('onsubmit','return true');
		$('#f_profile').attr('action','./profileUpd');
		$('#f_profile').submit();
		}
</script>          