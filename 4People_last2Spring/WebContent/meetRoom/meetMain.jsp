<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	%>
	<%String mem_id = (String)session.getAttribute("MEM_ID"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회의실</title>
<jsp:include page="../include/top.jsp" flush="false">
	<jsp:param value="" name="top" />
</jsp:include>
<link href="https://fonts.googleapis.com/css?family=Kosugi+Maru"
	rel="stylesheet">
<script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js"
	type="text/javascript"></script>
<link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css"
	rel="stylesheet" type="text/css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.12.0/moment.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/eonasdan-bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/eonasdan-bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/eonasdan-bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
<style type="text/css">
/*  .image-upload>input { */
/*   display: none; */
/* } */
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
</style>
<script type="text/javascript">
var sel_file;
	$(document).ready(function (){
		var tag = "<span><img  src='../images/nav_meetingRoom.png' width='50px' height='50px' ></span><span style='font-size:30px; color:white; font-weight:bold;margin-left:10px;'>회의실</span>";
		 $('#navChat').append(tag);
			$('#ex_filename').on('change',handleImgFileSelect);
			
			var date = new Date(); 
			var year = date.getFullYear(); 
			var month = new String(date.getMonth()+1); 
			var day = new String(date.getDate()); 

			// 한자리수일 경우 0을 채워준다. 
			if(month.length == 1){ 
			  month = "0" + month; 
			} 
			if(day.length == 1){ 
			  day = "0" + day; 
			} 
			$("#input_date").val(year + "-" + month + "-" + day);
			$('#search_inwon').val('1');
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
							$('#img').attr('src',e.target.result);
							$('#d_img').css('opacity',1.0);
						}
					reader.readAsDataURL(f);
				});
		}
	function roomSearch(){
			$("#f_roomSearch").attr("action","./roomSearch");
     		$("#f_roomSearch").submit();
		}
	function newMeetroomModal(){
		$('#newMeetroomModal').modal('show');
	}
	function meettingIns(){
		$("#f_meettingIns").attr("action","./meetRoomIns");
 		$("#f_meettingIns").submit();
 		$('#loadingModal2').modal('show');
		}
	function fileOpen(){
// 			alert('클릭');
				$('#imgFile').click();
		}
</script>
</head>

<body>



	<div class='row' style=' margin-bottom:10px;'>
		<div class='col-sm-2' style='padding: 30px;'>
			<a href='javascript:newMeetroomModal()'> <img
				src="../images/meetingCheck.png" width='70px' height='70px'> <span
				class='es_font'
				style='font-size: 25px; font-weight: bold;'>회의실
					등록하기</span>
			</a>
		</div>
		<div class='col-sm-2' style='padding: 30px; padding-right:0;'>
		<a href='./myMeetingRoom' >
			<img src='../images/myMeetingRoom.png'width='70px' height='70px'><span class='es_font' style='font-size: 25px; font-weight: bold;'>내가 등록한 회의실</span>
			</a>
	</div>	
		<div class='col-sm-2' style='padding: 30px;'>
			<a href='./myReserVation' >
			<img src='../images/myReservation.png'width='70px' height='70px'><span class='es_font' style='font-size: 25px; font-weight: bold;'>내 예약 목록</span>
			</a>
		</div>
	</div>

	<div class='row'>
	
		<div class='col-sm-6 col-sm-offset-3'>
			<div class="panel panel-info">
				<div class="panel-heading">회의실 검색하기</div>
				<div class="panel-body">
				<form id='f_roomSearch' method="GET">
					<div class='col-sm-4'>
						<div>
							<label>사용일자</label>
						</div>
						<div class='input-group date' id='datetimepicker1' >
							<input type='text' id='input_date' class="form-control"name='searchDate' /> <span
								class="input-group-addon"><span
								class="glyphicon glyphicon-calendar" style='height: 10px;'></span></span>
						</div>
					</div>
					<div class='col-sm-4'>
						<label for='search_inwon'>인원&nbsp;&nbsp;</label>
						 <input id='search_inwon' type='text' class='form-control' name='searchInwon' onKeypress="if(event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"style='ime-mode:disabled'>
					</div>
				</form>	
					<div class='col-sm-4'>
						<button class='btn btn-info' onclick='roomSearch()'
							style='margin-top: 24px; width: 150px;'>search</button>
					</div>
				</div>
			</div>
		</div>
		<div class='col-sm-3'></div>
	</div>




	<div class='row' style='margin-top: 50px;'>
		<div class='col-sm-8 col-sm-offset-4'>
			<span style='font-size: 40px; font-weight: bold; color: #2489EE;'>육토피아</span>
			<span style='font-size: 20px; color: #003399;'>&nbsp;&nbsp;회의실
				커스텀 마이징 서비스를 이용해보세요!!!</span>
		</div>
	</div>
	<article class="container"
		style='margin-top: 20px; background-color: #FFF;'>
		<div class='row text-center'>
			<span style='color: black; font-size: 20px; font-weight: bold;'>회의실
				예약기능</span>
			<div>
				<h4>육토피아에서는 회의실 예약기능을 제공하고 있습니다. 회의실을 등록해주세요.</h4>
			</div>
		</div>
		<div class='row'>
			<div class='col-sm-4'>
				<img src='../images/meetmain2.jpg' width='100%' height='350px;'>
				<div class='text-center' style='margin-top: 20px;'>
					<span style='font-size: 25px; font-weight: bold;'>회의실</span>
				</div>
				<div>
					<h5 style='color: #8C8C8C;'>회의실 정보를 등록할 수 있습니다.등록을 시작하세요!!!</h5>
				</div>
			</div>
			<div class='col-sm-4'>
				<img src='../images/meetmain1.png' width='100%' height='350px;'>
				<div class='text-center' style='margin-top: 20px;'>
					<span style='font-size: 25px; font-weight: bold;'>위치정보</span>
				</div>
				<div class='text-center'>
					<h5 style='color: #8C8C8C;'>회의실의 위치정보도 표시할수 있습니다.</h5>
				</div>
			</div>
			<div class='col-sm-4'>
				<img src='../images/meetmain4.PNG' width='100%' height='350px;'>
				<div class='text-center' style='margin-top: 20px;'>
					<span style='font-size: 25px; font-weight: bold;'>예약기능</span>
				</div>
				<div class='text-center'>
					<h5 style='color: #8C8C8C;'>회의실 예약정보를 확인할 수 있습니다.</h5>
				</div>
			</div>
		</div>

	</article>

	<div class="modal fade" id="newMeetroomModal" role="dialog">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-header">
					<div class="modal-title text-center"
						style='font-size: 20px; font-weight: bold;'>회의실 등록하기</div>
				</div>
				<!-- modal body -->
				<div class="modal-body"
					style='overflow-x: hidden; height: 700px; width: 100%; margin: 0; padding: 0;'
					id='messageModalBody2'>
					<!-- 회의실 이미지 -->
					<div class='col-sm-12'
						style="position: absolute; width: 100%; padding: 0;">
						<div id='d_img' style="position: relative; opacity: 0.3;">
							<img id='img' src="../images/meetModal.png" width='100%' height='250px;'></img>
						</div>
					</div>
					<form id="f_meettingIns" role="form" method="POST" enctype="multipart/form-data">
						<div class='footer' style="position: relative; margin-left:20px;margin-top:210px;">
							<div class="filebox bs3-primary">
                            <input class="upload-name" id='fileName' type='hidden' value="파일선택" disabled="disabled">
                            <label for="ex_filename">회의실 이미지를 등록해주세요</label> 
                          <input type="file" id="ex_filename" name='mr_image' class="upload-hidden"> 
                        </div>
						</div>
					<!-- /회의실 이미지 -->
						<div class='col-sm-8 col-sm-offfset-4'>
							<div class='form-group'
								style='margin-top: 20px; padding: 20px; padding-bottom: 5px;'>
								<label for="mr_name">회의실 이름</label><br> <input type="text" value='육토피아 회의실'
									class="form-control" id='mr_name' name='mr_name'
									placeholder='insert here'>
							</div>
						</div>

						<div class='col-sm-8 col-sm-offfset-4'>
							<div class="form-inline">
								<div class='form-group' style='padding: 20px; padding-top: 0px;'>
									<label for="mr_loc">회의실 위치</label><br> <input type="text"
										class="form-control" id="mr_loc" name='mr_loc'
										placeholder="주소" readonly> <input type="button"
										class='form-control' onclick="sample5_execDaumPostcode()"
										value="주소 검색">
								</div>
							</div>
						</div>
						<div class='col-sm-8 col-sm-offfset-4'>
							<div class='form-group'
								style='padding: 20px; padding-top: 0px; padding-bottom: 0;'>
								<label for="mr_detaileloc">상세주소</label><br> <input
									type="text" class="form-control" id='mr_detaileloc'
									name='mr_detaileloc' placeholder='ex) 102호' value='102호'>
							</div>
						</div>

						<div class='col-sm-8 col-sm-offfset-4'>
							<div id="map"
								style="width: 100%; height: 200px; padding: 40px; left: 10px; padding-top: 0; display: none">
							</div>
						</div>

						<div class='col-sm-12 '>
							<div class="form-inline">
								<div class='form-group' style='padding: 20px;'>
									<label for="mr_master">담당자</label> <label for="mr_capacity"
										style='margin-left: 180px;'>수용인원</label><br>
										 <input type="text" class="form-control" id='mr_master' name='mr_master' readonly value=<%=mem_id %> placeholder='insert'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="text" value='10' class="form-control" id='mr_capacity' onKeypress="if(event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"
										name='mr_capacity' placeholder='insert'>
								</div>
							</div>
						</div>

						<div class='col-sm-12 '>
							<div class="form-inline">
								<div class='form-group' style='padding: 20px; padding-top: 0;'>
									<label for="mr_starttime">이용가능 시간</label><br>
									<!--                     <input type="text" class="form-control" id='mr_starttime' name='mr_starttime'> -->
									<input id="mr_starttime" readonly width="220" placeholder='클릭--->' value='08:00'
										name='mr_starttime' />&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp;&nbsp; 
										<input class="form-control" value='18:00' width="220" id='mr_endtime'readonly name='mr_endtime' placeholder='클릭--->'>
								</div>
							</div>
						</div>
						<div class='col-sm-8 col-sm-offfset-4'>
							<div class='form-group'
								style='padding: 20px; padding-top: 0px; padding-bottom: 0;'>
								<label for="mr_facility">이용 가능 시설</label><br> <input
									type="text" class="form-control" id='mr_facility' value='빔 프로젝트,pc,WI-FI,프레젠터'
									name='mr_facility' placeholder='ex)빔 프로젝트,pc,WI-FI,프레젠터'>
							</div>

						</div>
						<div class='col-sm-8 col-sm-offfset-4'>
							<div class='form-group'
								style='padding: 20px; padding-top: 0px; padding-bottom: 0;'>
								<label for="mr_memo">설명</label><br> <input type="text" value='창문있음'
									class="form-control" id='mr_memo' name='mr_memo'
									placeholder='ex) 창문있음'>
							</div>

						</div>
					</form>
					<!-- /modal body -->
				</div>

				<form id='checkDatas'>
					<div class="modal-footer">
						<button type="button" class="btn btn-default"
							onclick='meettingIns()' data-dismiss="modal"
							style='border: 0; color: #47C83E;'>
							<i class="fas fa-check"></i>&nbsp;등록
						</button>
						<button type="button" class="btn btn-default" data-dismiss="modal"
							style='border: 0; color: #FF0000;'>
							<i class="fas fa-times"></i>&nbsp;취소
						</button>
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
	<script>
        $('#mr_starttime').timepicker({
            uiLibrary: 'bootstrap'
        });
        $('#mr_endtime').timepicker({
            uiLibrary: 'bootstrap'
        });
    </script>
	<script type="text/javascript">
$(function () {
	   var bindDatePicker = function() {
			$(".date").datetimepicker({
	        format:'YYYY-MM-DD',
				icons: {
					time: "fa fa-clock-o",
					date: "fa fa-calendar",
					up: "fa fa-arrow-up",
					down: "fa fa-arrow-down"
				}
			}).find('input:first').on("blur",function () {
				// check if the date is correct. We can accept dd-mm-yyyy and yyyy-mm-dd.
				// update the format if it's yyyy-mm-dd
				var date = parseDate($(this).val());
				if (! isValidDate(date)) {
					//create date based on momentjs (we have that)
					date = moment().format('YYYY-MM-DD');
				}
				$(this).val(date);
			});
		}
	   var isValidDate = function(value, format) {
			format = format || false;
			// lets parse the date to the best of our knowledge
			if (format) {
				value = parseDate(value);
			}
			var timestamp = Date.parse(value);
			return isNaN(timestamp) == false;
	   }
	   var parseDate = function(value) {
			var m = value.match(/^(\d{1,2})(\/|-)?(\d{1,2})(\/|-)?(\d{4})$/);
			if (m)
				value = m[5] + '-' + ("00" + m[3]).slice(-2) + '-' + ("00" + m[1]).slice(-2);
			return value;
	   }
	   bindDatePicker();
	 });

</script>
<div class="modal fade" id="loadingModal2" role="dialog" style="backdrop:static; ketboard: false; " >
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