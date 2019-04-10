<%@page import="java.util.Locale"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
public static String getDateDay(String date, String dateType) throws Exception {
    String day = "";
    SimpleDateFormat dateFormat = new SimpleDateFormat(dateType);
    Date nDate = dateFormat.parse(date);
    Calendar cal = Calendar.getInstance();
    cal.setTime(nDate);
    int dayNum = cal.get(Calendar.DAY_OF_WEEK)-1;
    switch (dayNum) {
    case 1:
        day = "일요일";
        break;
    case 2:
        day = "월요일";
        break;
    case 3:
        day = "화요일";
        break;
    case 4:
        day = "수요일";
        break;
    case 5:
        day = "목요일";
        break;
    case 6:
        day = "금요일";
        break;
    case 7:
        day = "토요일";
        break;
    }
    return day;
}

%>    
<%
String name = (String)session.getAttribute("MEM_NAME"); 
String dept = (String)session.getAttribute("MEM_COMPANYNAME");
String position = (String)session.getAttribute("MEM_POSITION");
String id = (String)session.getAttribute("MEM_ID");
String searchInwon=(String)request.getAttribute("searchInwon");
String searchDate=(String)request.getAttribute("searchDate");
String dateStr[] = searchDate.split("\\-");
System.out.print("=========="+dateStr.toString());
String month = dateStr[1];
String day = dateStr[2];
String week = getDateDay(searchDate,"yyyy-MM-DD");
System.out.println("==================================="+week);
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
.es_td:hover{background:#8041D9; color:#050099} 
.btn-circle {
    width: 30px;
    height: 30px;
    padding: 6px 0px;
    border-radius: 15px;
    text-align: center;
    font-size: 12px;
    line-height: 1.42857;
}

</style>
<script type="text/javascript">
var searchDate = '<%=searchDate%>'
var clickAddress;
	$(document).ready(function (){

		
		});
	function dateAddDel(sDate,nNum){
		var yy = parseInt(sDate.substr(0, 4), 10);
	    var mm = parseInt(sDate.substr(5, 2), 10);
	    var dd = parseInt(sDate.substr(8), 10);
	    d = new Date(yy, mm - 1, dd + nNum);
	    yy = d.getFullYear();
	    mm = d.getMonth() + 1; mm = (mm < 10) ? '0' + mm : mm;
	    dd = d.getDate(); dd = (dd < 10) ? '0' + dd : dd;
	    return '' + yy + '-' +  mm  + '-' + dd;
		}
	
	function getInputDayLabel(date) {
	    var week = new Array('일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일');
	    var today = new Date(date).getDay();
	    var todayLabel = week[today];
	    return todayLabel;
	}

	

	
	function rightDate(){
		searchDate=dateAddDel(searchDate,+1);
		var week = getInputDayLabel(searchDate);
		var dateStr = searchDate.split('-');
		var dateAppend = dateStr[1]+'.'+dateStr[2];
		$('#s_date').text(dateAppend);
		$('#s_week').text(week);
		var param = 'date='+searchDate;
		$.ajax({
			type:"POST"
		   ,url:"./nextDateRoom"
		   ,data:param
		   ,dataType:"html"
		   ,success:function(data){
			   $(function (){
				  var value =[];
					 $.each(data , function( key, val){
						value.push(val.MEM_NAME+" ["+val.MEM_ID+"]");
					 });
				  });
		   }
		  ,error:function(e){
			 console.log(e.printstack);
		  }
		});
		}
	function leftDate(){
		searchDate=dateAddDel(searchDate,-1);
		var week = getInputDayLabel(searchDate);
		var dateStr = searchDate.split('-');
		var dateAppend = dateStr[1]+'.'+dateStr[2];
		$('#s_date').text(dateAppend);
		$('#s_week').text(week);
		$.ajax({
			type:"POST"
		   ,url:"./nextDateRoom"
		   ,data:param
		   ,dataType:"json"
		   ,success:function(data){
			   $(function (){
				  var value =[];
					 $.each(data , function( key, val){
						value.push(val.MEM_NAME+" ["+val.MEM_ID+"]");
					 });
				  });
		   }
		  ,error:function(e){
			 console.log(e.printstack);
		  }
		});
		}
			
	
</script>
</head>
<body>

<div class='col-sm-9' style='margin-top:70px;'>
<div class='col-sm-3 text-center'>
	<button class='btn-circle'onclick='leftDate()' style='border:0;background-color:#FFF;'><img src='../images/left-arrow.png'></button>
	<span style='font-size:30px; margin-left:10px; font-weight:bold;' id='s_date'><%=month+"."+day %></span>
	<span style='font-size:30px; margin-left:10px; margin-right:10px; color:#747474; font-weight:bold;'id='s_week'><%=week%></span>
	<button class='btn-circle' onclick='rightDate()' style='border:0;background-color:#FFF;'><img src='../images/right-arrow.png'></button>
</div>
<table style='width:100%; margin-left:20px; margin:80px;'>
<tr  style='border-top: 1px solid #444444; overflow-x:auto;' class='col-sm-10'>
<td ><img src='../images/meetmain2.jpg'  width='200px' height='200px;' style='margin:10px;'></td>
<td align="center" style='padding:20px; width:200px; height:200px;'><span style='font-size:25px; font-wighet:bold; '>재민관1</span></td>
<input type="hidden" id='h_address'value='서울 금천구 벚꽃로 298'>
<td class='es_td' style='padding:20px;width:150px;font-size:20px;'><span>8:00</span><div style='font-size:14px;'>(예약가능)</div><br><div style='font-size:14px;'>10명</div></td>
<td class='es_td' style='padding:20px;width:150px;font-size:20px;'><span>10:00</span><div style='font-size:14px;'>(예약가능)</div><br><div style='font-size:14px;'>10명</div></td>
<td class='es_td' style='padding:20px;width:150px;font-size:20px;'><span>12:00</span><div style='font-size:14px;'>(예약가능)</div><br><div style='font-size:14px;'>10명</div></td>
<td class='es_td' style='padding:20px;width:150px;font-size:20px;'><span>14:00</span><div style='font-size:14px;'>(예약가능)</div><br><div style='font-size:14px;'>10명</div></td>
<td class='es_td' style='padding:20px;width:150px;font-size:20px;'><span>16:00</span><div style='font-size:14px;'>(예약가능)</div><br><div style='font-size:14px;'>10명</div></td>
<td class='es_td' style='padding:20px;width:150px;font-size:20px;'><span>18:00</span><div style='font-size:14px;'>(예약가능)</div><br><div style='font-size:14px;'>10명</div></td>

</tr>

<tr  style='border-top: 1px solid #444444; overflow-x:auto;' class='col-sm-10'>
<td ><img src='../images/meetmain2.jpg'   width='200px' height='200px;' style='margin:10px;'></td>
<td align="center" style='padding:20px; width:200px; height:200px;'><span style='font-size:25px; font-wighet:bold; '>재민관1</span></td>
<input type="hidden" id='h_address'value='서울 강동구 고덕로14가길 6'>
<td class='es_td' style='padding:20px;width:150px;font-size:20px;'><span>8:00</span><div style='font-size:14px;'>(예약가능)</div><br><div style='font-size:14px;'>10명</div></td>
<td class='es_td' style='padding:20px;width:150px;font-size:20px;'><span>10:00</span><div style='font-size:14px;'>(예약가능)</div><br><div style='font-size:14px;'>10명</div></td>
<td class='es_td' style='padding:20px;width:150px;font-size:20px;'><span>12:00</span><div style='font-size:14px;'>(예약가능)</div><br><div style='font-size:14px;'>10명</div></td>
<td class='es_td' style='padding:20px;width:150px;font-size:20px;'><span>14:00</span><div style='font-size:14px;'>(예약가능)</div><br><div style='font-size:14px;'>10명</div></td>
<td class='es_td' style='padding:20px;width:150px;font-size:20px;'><span>16:00</span><div style='font-size:14px;'>(예약가능)</div><br><div style='font-size:14px;'>10명</div></td>
<td class='es_td' style='padding:20px;width:150px;font-size:20px;'><span>18:00</span><div style='font-size:14px;'>(예약가능)</div><br><div style='font-size:14px;'>10명</div></td>
</tr>
</table>
</div>

<div class='col-sm-3' style='margin-top:70px; height:800px; box-shadow: 0 3px 6px rgba(0,0,0,.25);'>
<div class="page-header text-center" style=" margin-top:20px; height:60px; border-bottom: 1px solid #BDBDBD;'">
<h2>회의실 예약하기</h2>
</div>
<div class="container" style='width:100%; height:100%;  overflow-y: auto; '>
<div class='form-group'>
<label for='roomAddress'>회의장소</label>
<input id='roomAddress' type="text" class='form-control'>
</div>
<div id="r_address"style="width: 100%; height: 200px; padding: 40px; left: 10px; padding-top: 0; display:none;">
</div>
<div class='form-group' style='margin-bottom:40px'>
<label for='re_purpose'>회의목적</label>
<input id='re_purpose' type="text" class='form-control'>
</div>
<div class='form-inline' style='margin-bottom:40px'>
<input id='re_masterName' type="text" style='width:30%' class='form-control'placeholder='예약자'>
<input id='re_position' type="text" style='width:30%' class='form-control'placeholder='팀명'>
<input id='re_howmany' type="text" style='width:30%' class='form-control'placeholder='인원'>
</div>
<div class='form-group' style='margin-top:15px; margin-bottom:40px'>
<label for='re_participant'>참여자</label>
<input id='re_participant' type="text" class='form-control'placeholder='ex)이순신,강감찬,김유신'>
</div>
<div class='form-inline' style='margin-top:15px; margin-bottom:40px'>
<label for='re_hopedate'>예약일자</label>
<input id='re_hopedate' type="date" class='form-control' style='margin-left:5px;'>
</div>
<div class='form-inline' style='margin-top:15px; margin-bottom:40px'>
<label for='re_hopedate'>예약시간</label>
<input id='re_startTime' type="text" class='form-control' style='width:30%;margin-left:5px;' placeholder='ex) 08:30'>&nbsp;&nbsp;~&nbsp;&nbsp;
<input id='re_endTime' type="text" class='form-control' style='width:30%;margin-left:5px;' placeholder='ex) 10:30'>
</div>
</div>
</div>
<script type="text/javascript">
$('.es_td').click(function() {
//     alert($(this).children().eq(0).text());
    var clickTime = $(this).children().eq(0).text();
    var clickOk = $(this).children().eq(1).text();
    var clickName = $(this).parent().children().eq(1).text();
    var clickInwon = $(this).children().eq(3).text();
    clickAddress = $(this).parent().children().eq(2).val();
//     alert(clickName+clickTime+clickOk+clickInwon);
if(clickOk=='(예약가능)'){
	viewMap();
	$('#re_howmany').val(clickInwon);
	$('#re_startTime').val(clickTime);
	$('#roomAddress').val(clickName+' ('+clickAddress+')');
	$('#re_masterName').val('<%=name%>');
}
else{
	alert('예약이 불가능합니다.');
}
	
});
</script>

	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0a85ec870a80d618bb1ff2bf13843f75&libraries=services"></script>
	<script>
	var mapContainer = document.getElementById('r_address'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 
// 주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();
// 주소로 좌표를 검색합니다
function viewMap(){
	geocoder.addressSearch(clickAddress, function(result, status) {
	    // 정상적으로 검색이 완료됐으면 
	     if (status === daum.maps.services.Status.OK) {
	        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new daum.maps.Marker({
	            map: map,
	            position: coords
	        });
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new daum.maps.InfoWindow({
	            content: '<div style="width:200px;text-align:center;padding:6px 0;">'+clickAddress+'</div>'
	        });
	     // 지도를 보여준다.
	        r_address.style.display = "block";
	        map.relayout();
	        marker.setPosition(coords)
	        infowindow.open(map, marker);
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});  
}
 
</script>
</body>
</html>