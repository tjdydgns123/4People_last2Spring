<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회의실</title>
<jsp:include page="../include/top.jsp" flush="false">
		<jsp:param value="" name="top" />
</jsp:include>
<link href="https://fonts.googleapis.com/css?family=Kosugi+Maru" rel="stylesheet">
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
	$(document).ready(function (){
		var tag = "<span><img  src='../images/nav_meetingRoom.png' width='50px' height='50px' ></span><span style='font-size:30px; color:white; font-weight:bold;margin-left:10px;'>회의실</span>";
		 $('#navChat').append(tag);
		});
	function newMeetroomModal(){
		$('#newMeetroomModal').modal('show');
	}
	function meettingIns(){
		$("#f_meettingIns").attr("action","./meetRoomIns");
 		$("#f_meettingIns").submit();
		}
</script>
</head>

<body>
<div class='row'>
	<div class='col-sm-4' style='padding:30px;'>
	<a href='javascript:newMeetroomModal()'>
		<img src="../images/meetingCheck.png" width='80px' height='80px'>
		<span class='es_font' style='font-size:25px; font-weight:bold; color:#99004C;' >회의실 등록하기</span>
	</a>	
	</div>
</div>

<div class='row' style='margin-top:50px;'>
	<div class='col-sm-8 col-sm-offset-4'>
		<span style='font-size:40px; font-weight:bold; color:#2489EE;'>4People</span>
		<span style='font-size:20px; color:#003399;'>&nbsp;&nbsp;회의실 커스텀 마이징 서비스를 이용해보세요!!!</span>
	</div>
</div>
	<article class="container" style='margin-top:20px; background-color:#FFF;'>
	  <div class='row text-center'>
	  	<span style='color:black; font-size:20px; font-weight:bold;'>회의실 예약기능</span>
	  	<div>
	  		<h4>4people에서는 회의실 예약기능을 제공하고 있습니다. 회의실을 등록해주세요.</h4>
	  	</div>
	  </div>
	  <div class='row'>
	  	<div class='col-sm-4'>
	  		<img src='../images/meetmain2.jpg' width='100%' height='350px;'>
	  		<div class='text-center' style='margin-top:20px;'>
	  		<span style='font-size:25px; font-weight:bold;'>회의실</span>
	  		</div>
	  		<div>
	  			<h5 style='color:#8C8C8C;'>회의실 정보를 등록할 수 있습니다.등록을 시작하세요!!!</h5>
	  		</div>
	  	</div>
	  	<div class='col-sm-4'>
	  		<img src='../images/meetmain1.png' width='100%' height='350px;'>
	  		<div class='text-center' style='margin-top:20px;'>
	  		<span style='font-size:25px; font-weight:bold;'>위치정보</span>
	  		</div>
	  		<div class='text-center'>
	  			<h5 style='color:#8C8C8C;'>회의실의 위치정보도 표시할수 있습니다.</h5>
	  		</div>
	  	</div>
	  	<div class='col-sm-4'>
	  		<img src='../images/meetmain4.PNG' width='100%' height='350px;'>
	  		<div class='text-center' style='margin-top:20px;'>
	  		<span style='font-size:25px; font-weight:bold;'>예약기능</span>
	  		</div>
	  		<div class='text-center'>
	  			<h5 style='color:#8C8C8C;'>회의실 예약정보를 확인할 수 있습니다.</h5>
	  		</div>
	  	</div>
	  </div>
	
</article>

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
<form id="f_meettingIns" role="form" method="POST">
	<div class='col-sm-8 col-sm-offfset-4'>
	<div class='form-group' style='margin-top:250px; padding:20px; padding-bottom:5px;'>
                    <label for="mr_name">회의실 이름</label><br>
                    <input type="text" class="form-control" id='mr_name' name='mr_name' placeholder='insert here'>
                    </div>
	</div>
	
	<div class='col-sm-8 col-sm-offfset-4'>
	<div class="form-inline">
	<div class='form-group' style=' padding:20px; padding-top:0px;'>
                    <label for="mr_loc">회의실 위치</label><br>
                    <input type="text" class="form-control" id="mr_loc" name='mr_loc' placeholder="주소" readonly >
                    <input type="button" class='form-control'onclick="sample5_execDaumPostcode()" value="주소 검색">
                    </div>
	</div>
	</div>
	<div class='col-sm-8 col-sm-offfset-4'>
	<div class='form-group' style='padding:20px; padding-top:0px; padding-bottom:0;'>
                    <label for="mr_detaileloc">상세주소</label><br>
                    <input type="text" class="form-control" id='mr_detaileloc' name='mr_detaileloc' placeholder='상세주소'>
                    </div>
	</div>
	
	<div class='col-sm-8 col-sm-offfset-4'>
	<div id="map" style="width:100%;height:200px;padding:40px; left:10px; padding-top:0;display:none">
	</div>
	</div>
	
	<div class='col-sm-12 '>
	<div class="form-inline">
	<div class='form-group' style='padding:20px;'>
                    <label for="mr_master">담당자</label>
                    <label for="mr_capacity" style='margin-left:180px;'>수용인원</label><br>
                    <input type="text" class="form-control" id='mr_master' name='mr_master' placeholder='insert'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="text" class="form-control" id='mr_capacity' name='mr_capacity' placeholder='insert'>
                    </div>
                    </div>
	</div>
	
	<div class='col-sm-12 '>
	<div class="form-inline">
	<div class='form-group' style='padding:20px; padding-top:0;'>
                    <label for="mr_starttime">이용가능 시간</label><br>
                    <input type="text" class="form-control" id='mr_starttime' name='mr_starttime' placeholder='ex) 08:30'>&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp;&nbsp;
                    <input type="text" class="form-control" id='mr_endtime' name='mr_endtime' placeholder='ex) 18:30'>
                    </div>
                    </div>
	</div>
	<div class='col-sm-8 col-sm-offfset-4'>
		<div class='form-group' style='padding:20px; padding-top:0px; padding-bottom:0;'>
                    <label for="mr_facility">이용 가능 시설</label><br>
                    <input type="text" class="form-control" id='mr_facility' name='mr_facility' placeholder='ex)빔 프로젝트,pc,WI-FI,프레젠터'>
	</div>
	
	</div>
	<div class='col-sm-8 col-sm-offfset-4'>
		<div class='form-group' style='padding:20px; padding-top:0px; padding-bottom:0;'>
                    <label for="mr_memo">설명</label><br>
                    <input type="text" class="form-control" id='mr_memo' name='mr_memo' placeholder='ex) 창문있음'>
	</div>
	
	</div>
	</form>
 <!-- /modal body -->
</div>

    	<form id='checkDatas'>
      <div class="modal-footer">
      	<button type="button" class="btn btn-default" onclick='meettingIns()' data-dismiss="modal" style='border:0; color:#47C83E;'><i class="fas fa-check"></i>&nbsp;등록</button>
        <button type="button" class="btn btn-default" data-dismiss="modal" style='border:0; color:#FF0000;'><i class="fas fa-times"></i>&nbsp;취소</button>
      </div>
      	</form>
  </div>
</div>
</div>
<!-- 다음 api -->
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
                document.getElementById("mr_loc").value = addr;
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
<!-- 다음 api -->
</body>
</html>