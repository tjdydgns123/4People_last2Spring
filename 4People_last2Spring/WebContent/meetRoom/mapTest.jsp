<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../common/common.jsp" %>
<style type="text/css">
 .image-upload>input {
  display: none;
}
.image-upload {
  transform: scale(1);
  -webkit-transform: scale(1);
  -moz-transform: scale(1);
  -ms-transform: scale(1);
  -o-transform: scale(1);
  transition: all 0.3s ease-in-out;   /* 부드러운 모션을 위해 추가*/
}
.image-upload:hover {
  transform: scale(1.2);
  -webkit-transform: scale(1.2);
  -moz-transform: scale(1.2);
  -ms-transform: scale(1.2);
  -o-transform: scale(1.2);
}
.img {width:150px; height:150px; overflow:hidden } 
</style>
<script type="text/javascript">
function newMeetroomModal(){
	$('#newMeetroomModal').modal('show');
}
</script>
</head>
<body>

<button onclick='newMeetroomModal()'></button>

<div class="modal fade" id="newMeetroomModal" role="dialog" >
  <div class="modal-dialog modal-md" >
    <div class="modal-content">
      <div class="modal-header">
        <div class="modal-title text-center" style='font-size:20px; font-weight:bold;'>회의실 등록하기</div>
      </div>
      <!-- modal body -->
      <div class="modal-body" style='overflow-x:hidden; height:700px; width:100%;margin:0; padding:0;' id='messageModalBody2'>
 <!-- 회의실 이미지 -->     
<div class='col-sm-12'style="position: absolute; width:100%; padding:0;">
<div style="position: relative;  opacity: 0.3;" ><img src="../images/meetModal.png" width='100%' height='250px;'></img>
</div>
</div>
<div class='col-sm-7 col-sm-offset-5'style="position: absolute; top:80px;">
<div style="position: relative;">
<div class="image-upload">
		  <label for="file-input">
		    <img src="../images/imgPlus.png"/>
		  </label>
		  <input id="file-input" type="file"  style="display:none;"/>
		  <div><span style='font-size:15px;color:#050099;font-weight:bold;'>회의실 이미지를 등록해주세요</span></div>
</div>
</div>
</div>
<!-- /회의실 이미지 -->
	<div class='col-sm-8 col-sm-offfset-4'>
	<div class='form-group' style='margin-top:250px; padding:20px; padding-bottom:5px;'>
                    <label for="company">회의실 이름</label><br>
                    <input type="text" class="form-control" id='company' name='mem_companyname' placeholder='insert here'>
                    </div>
	</div>
	
	<div class='col-sm-8 col-sm-offfset-4'>
	<div class="form-inline">
	<div class='form-group' style=' padding:20px; padding-top:0px;'>
                    <label for="company">회의실 위치</label><br>
                    <input type="text" class="form-control" id="sample5_address" placeholder="주소" readonly >
                    <input type="button" class='form-control'onclick="sample5_execDaumPostcode()" value="주소 검색">
                    </div>
	</div>
	</div>
	<div class='col-sm-8 col-sm-offfset-4'>
	<div class='form-group' style='padding:20px; padding-top:0px; padding-bottom:0;'>
                    <label for="company">상세주소</label><br>
                    <input type="text" class="form-control" id='company' name='mem_companyname' placeholder='상세주소'>
                    </div>
	</div>
	
	<div class='col-sm-8 col-sm-offfset-4'>
	<div id="map" style="width:100%;height:200px;padding:40px; left:10px; padding-top:0;display:none">
	</div>
	</div>
	
	<div class='col-sm-12 '>
	<div class="form-inline">
	<div class='form-group' style='padding:20px;'>
                    <label for="company">담당자</label>
                    <label for="inwon" style='margin-left:180px;'>수용인원</label><br>
                    <input type="text" class="form-control" id='company' name='mem_companyname' placeholder='insert'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="text" class="form-control" id='inwon' name='mem_companyname' placeholder='insert'>
                    </div>
                    </div>
	</div>
	
	<div class='col-sm-12 '>
	<div class="form-inline">
	<div class='form-group' style='padding:20px; padding-top:0;'>
                    <label for="company">이용가능 시간</label><br>
                    <input type="text" class="form-control" id='company' name='mem_companyname' placeholder='ex) 08:30'>&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp;&nbsp;
                    <input type="text" class="form-control" id='inwon' name='mem_companyname' placeholder='ex) 18:30'>
                    </div>
                    </div>
	</div>
	<div class='col-sm-8 col-sm-offfset-4'>
		<div class='form-group' style='padding:20px; padding-top:0px; padding-bottom:0;'>
                    <label for="company">이용 가능 시설</label><br>
                    <input type="text" class="form-control" id='company' name='mem_companyname' placeholder='ex)빔 프로젝트,pc,WI-FI,프레젠터'>
	</div>
	
	</div>
	<div class='col-sm-8 col-sm-offfset-4'>
		<div class='form-group' style='padding:20px; padding-top:0px; padding-bottom:0;'>
                    <label for="company">설명</label><br>
                    <input type="text" class="form-control" id='company' name='mem_companyname' placeholder='ex) 창문있음'>
	</div>
	
	</div>
 <!-- /modal body -->
</div>

    	<form id='checkDatas'>
      <div class="modal-footer">
      	<button type="button" class="btn btn-default" id="insertMessage" data-dismiss="modal" style='border:0; color:#47C83E;'><i class="fas fa-check"></i>&nbsp;등록</button>
        <button type="button" class="btn btn-default" id='deleteMessage' data-dismiss="modal" style='border:0; color:#FF0000;'><i class="fas fa-times"></i>&nbsp;취소</button>
      </div>
      	</form>
  </div>
</div>
</div>




<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0a85ec870a80d618bb1ff2bf13843f75&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script>
</body>
</html>