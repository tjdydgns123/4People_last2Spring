<%@page import="java.text.DateFormat"%>
<%@page import="java.util.*" %>
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
//검색결과
List<Map<String,Object>> roomSearch = (List<Map<String,Object>>)request.getAttribute("roomSearch");

//날짜관련 변수
String searchDate=(String)request.getAttribute("searchDate");
String dateStr[] = searchDate.split("\\-");
String month = dateStr[1];
String day = dateStr[2];
String week = getDateDay(searchDate,"yyyy-MM-DD");

//회원변수
String searchInwon = (String)request.getAttribute("searchInwon");
String name = (String)session.getAttribute("MEM_NAME"); 
String dept = (String)session.getAttribute("MEM_COMPANYNAME");
String position = (String)session.getAttribute("MEM_POSITION");
String id = (String)session.getAttribute("MEM_ID");
//
String mr_starttime="";
String mr_endtime="";
String mr_loc="";
String mr_capacity="";
String mr_no ="";
String mr_facility="";
String mr_name="";
String mr_detaileloc="";
String mr_memo="";
String mr_image="";
String ok = "";
List<Map<String,Object>> timeResult =null;

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
.footer {
  position: fixed;
  left: 0;
  bottom: 0;
  font-size:12px;
  font-color:gray;
  width: 100%;
  text-align: center;
}

</style>
<script type="text/javascript">
var searchDate = '<%=searchDate%>'
var clickAddress;
var mr_no;
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
		nextDate();
	
		}
	function leftDate(){
		searchDate=dateAddDel(searchDate,-1);
		var week = getInputDayLabel(searchDate);
		var dateStr = searchDate.split('-');
		var dateAppend = dateStr[1]+'.'+dateStr[2];
		$('#s_date').text(dateAppend);
		$('#s_week').text(week);
		nextDate();

		}
	function reservationOk(){
		var mr_teamname = $('#dropdownMenu1').text();
		$('#mr_teamname').val(mr_teamname);
		var re_purpose=$('#re_purpose').val();
		var re_participant=$('#re_participant').val();
		var re_hopedate=$('#re_hopedate').val();
		var re_teamname=$('#dropdownMenu1').text();
		if(re_purpose!=''&&re_participant!=''&&re_teamname!='팀명'){
	 		 $('#f_reservation').submit();
			}
		else{
			alert('정보를 모두 기입해주세요.');
			}

		}
	function nextDate(){
		var searchInwon = '<%=searchInwon%>'
// 		var param = 'searchDate='+searchDate+"&searchInwon="+searchInwon;
		$('#nextDate_searchDate').val(searchDate);
		$('#nextDate_searchInwon').val(searchInwon);
		$('#f_nextDate').submit();
// 		$.ajax({
// 			type:"POST"
// 		   ,url:"./nextDate"
// 		   ,data:param
// 		   ,dataType:"html"
// 		   ,success:function(data){
// 			   $('#body').empty();
// 			   $('#body').html(data);
			   
// 		   }
// 		  ,error:function(e){
// 			 console.log(e.printstack);
// 		  }
// 		});
		}
			
	
</script>
</head>
<body>
<div id='body'>
<div class='col-sm-9' style='margin-top:70px;'>
<div class='col-sm-3 text-center'>
	<button class='btn-circle'onclick='leftDate()' style='border:0;background-color:#FFF;'><img src='../images/left-arrow.png'></button>
	<span style='font-size:30px; margin-left:10px; font-weight:bold;' id='s_date'><%=month+"."+day %></span>
	<span style='font-size:30px; margin-left:10px; margin-right:10px; color:#747474; font-weight:bold;'id='s_week'><%=week%></span>
	<button class='btn-circle' onclick='rightDate()' style='border:0;background-color:#FFF;'><img src='../images/right-arrow.png'></button>
</div>
<table style='width:100%; margin-left:20px; margin:80px;'>
<%if(roomSearch.size()>0&&roomSearch!=null) {
	for(int i=0; i<roomSearch.size();i++){
		mr_starttime = (String)roomSearch.get(i).get("MR_STARTTIME");
		mr_endtime = (String)roomSearch.get(i).get("MR_ENDTIME");
		mr_loc = (String)roomSearch.get(i).get("MR_LOC");
		mr_capacity = (String)roomSearch.get(i).get("MR_CAPACITY");
		mr_facility = (String)roomSearch.get(i).get("MR_FACILITY");
		mr_no = (String)roomSearch.get(i).get("MR_NO");
		mr_name = (String)roomSearch.get(i).get("MR_NAME");
		mr_detaileloc = (String)roomSearch.get(i).get("MR_DETAILELOC");
		mr_memo = (String)roomSearch.get(i).get("MR_MEMO");
		mr_image = (String)roomSearch.get(i).get("MR_IMAGE");
		timeResult= (List<Map<String,Object>>)roomSearch.get(i).get("timeResult");
		%>
	
	<tr  style='border-top: 1px solid #444444; overflow-x:auto;' class='col-sm-10'>
	<td ><img src='<%="http://192.168.0.6:9000/4People_last2Spring/pds/"+mr_image%>' width='200px' height='200px;' style='margin:10px;'></td>
	<td align="center" style='padding:20px; width:200px; height:200px;'><span style='font-size:25px; font-wighet:bold; '><%=mr_name %></span></td>
	<input type="hidden"value='<%=mr_loc%>' id='h_address'>
	<input type="hidden"value='<%=mr_no%>' id='h_mrNo'>
	<input type="hidden"value='<%=mr_facility%>' id='h_facility'>
	<input type="hidden"value='<%=mr_memo%>' id='h_memo'>
	<%
	
	DateFormat df = new SimpleDateFormat("HH:mm");
	Date start_date = df.parse(mr_starttime);
	Date end_date = df.parse(mr_endtime);
	Calendar cal = Calendar.getInstance();
    cal.setTime(end_date);
    cal.add(Calendar.HOUR, -4);
    String endTimeResult = df.format(cal.getTime());
    Date r_date = df.parse(df.format(cal.getTime()));
    int compard =-1;
    int index=0;
	while(compard<0){
		
		Date s_date = df.parse(mr_starttime);
		Calendar cal2 = Calendar.getInstance();
        cal2.setTime(s_date);
        cal2.add(Calendar.HOUR, 2);
        
     if(timeResult!=null&&timeResult.size()>0){
    	 
    	 String equals ="";
    	 for(Map<String,Object> tMap:timeResult){
    		 equals = (String)tMap.get("RE_STARTTIME");
    		 System.out.println(mr_no+".........."+mr_starttime+"="+equals);
    		 if(mr_starttime.equals(equals)){
    			 ok="(예약이 불가능 합니다)";
    			 break;
    		 }
    		 else{
    			 ok="(예약가능)";
    		 }
    	 }
     }
     else{
    	 ok="(예약가능)"; 
     }
        %>
          <td class='es_td' style='padding:20px;width:150px;font-size:20px;'>
       <span><%=mr_starttime%></span>
       <div style='font-size:14px;'><%=ok%></div>
       <br><div style='font-size:14px;'><%=mr_capacity+"명"%></div>
       <input type="hidden" value='<%=df.format(cal2.getTime())%>'>
       </td>
       
       
        <% mr_starttime=df.format(cal2.getTime());
        compard = s_date.compareTo(r_date);
        
	}
	%>
	 <td class='es_td' style='padding:20px;width:150px;font-size:20px;'>
       <span><%=mr_starttime%></span>
       <div style='font-size:14px;'><%=ok%></div>
       <br><div style='font-size:14px;'><%=mr_capacity+"명"%></div>
       <input type="hidden" value='<%=mr_endtime%>'>
       </td>
	<%}}%>
<!-- <tr  style='border-top: 1px solid #444444; overflow-x:auto;' class='col-sm-10'> -->
<!-- <td ><img src='../images/meetmain2.jpg'  width='200px' height='200px;' style='margin:10px;'></td> -->
<!-- <td align="center" style='padding:20px; width:200px; height:200px;'><span style='font-size:25px; font-wighet:bold; '>재민관1</span></td> -->
<!-- <input type="hidden" id='h_address'value='서울 금천구 벚꽃로 298'> -->
<!-- <td class='es_td' style='padding:20px;width:150px;font-size:20px;'><span>8:00</span><div style='font-size:14px;'>(예약가능)</div><br><div style='font-size:14px;'>10명</div></td> -->
<!-- <td class='es_td' style='padding:20px;width:150px;font-size:20px;'><span>10:00</span><div style='font-size:14px;'>(예약가능)</div><br><div style='font-size:14px;'>10명</div></td> -->
<!-- <td class='es_td' style='padding:20px;width:150px;font-size:20px;'><span>12:00</span><div style='font-size:14px;'>(예약가능)</div><br><div style='font-size:14px;'>10명</div></td> -->
<!-- <td class='es_td' style='padding:20px;width:150px;font-size:20px;'><span>14:00</span><div style='font-size:14px;'>(예약가능)</div><br><div style='font-size:14px;'>10명</div></td> -->
<!-- <td class='es_td' style='padding:20px;width:150px;font-size:20px;'><span>16:00</span><div style='font-size:14px;'>(예약가능)</div><br><div style='font-size:14px;'>10명</div></td> -->
<!-- <td class='es_td' style='padding:20px;width:150px;font-size:20px;'><span>18:00</span><div style='font-size:14px;'>(예약가능)</div><br><div style='font-size:14px;'>10명</div></td> -->
</tr>

</table>
</div>

<div class='col-sm-3' style='margin-top:70px; height:1100px; box-shadow: 0 3px 6px rgba(0,0,0,.25);'>
<div class="page-header text-center" style=" margin-top:20px; height:60px; border-bottom: 1px solid #BDBDBD;'">
<h2>회의실 예약하기</h2>
</div>
<div class="container" style='width:100%; height:100%;  overflow-y: auto; '>
<form id='f_reservation' method="GET" action='./reservationOk' >
<div class='form-group'>
<label for='roomAddress'>회의장소</label>
<input id='roomAddress' type="text"   class='form-control'>
</div>
<div id="r_address"style="width: 100%; height: 200px; padding: 40px; left: 10px; padding-top: 0; display:none;">
</div>
<div class='form-group' style='margin-top:15px; margin-bottom:20px'>
<label for='mr_facility'>이용가능 시설</label>
<input id='mr_facility' type="text" readonly class='form-control'>
</div>
<div class='form-group' style='margin-top:15px; margin-bottom:20px'>
<label for='mr_memo'>설명</label>
<input id='mr_memo' type="text" readonly class='form-control'>
</div>
<div class='form-group' style='margin-bottom:40px'>
<label for='re_purpose'>회의목적</label>
<input id='re_purpose' type="text" name='re_purpose' class='form-control'>
</div>
<div class='form-inline' style='margin-bottom:40px'>
<input id='re_masterName' type="text" style='width:30%' class='form-control'placeholder='예약자'>
<button class="btn btn-default dropdown-toggle form-control"  style='wdith:50px;'  id="dropdownMenu1" data-toggle="dropdown">
              	팀명
              <span class="caret"></span>
            </button>
            <ul class="dropdown-menu"  aria-labelledby="dropdownMenu1"  id="mydd" >
              
            </ul>
<input id='re_howmany' type="text" style='width:30%' name='re_howmany' class='form-control'placeholder='인원'>
</div>
<div class='form-group' style='margin-top:15px; margin-bottom:40px'>
<label for='re_participant'>참여자</label>
<input id='re_participant' type="text" class='form-control'name ='re_participant'placeholder='ex)이순신,강감찬,김유신'>
</div>
<div class='form-inline' style='margin-top:15px; margin-bottom:40px'>
<label for='re_hopedate'>예약일자</label>
<input id='re_hopedate' type="text" class='form-control' readonly name='re_hopedate' style='margin-left:5px;'>
</div>
<div class='form-inline' style='margin-top:15px; margin-bottom:40px'>
<label for='re_hopedate'>예약시간</label>
<input id='re_startTime' type="text" class='form-control' name='re_starttime' style='width:30%;margin-left:5px;' readonly >&nbsp;&nbsp;~&nbsp;&nbsp;
<input id='re_endTime' type="text" class='form-control' name='re_endtime' style='width:30%;margin-left:5px;' readonly>
</div>

<input type='hidden' id='re_mr_no' name='mr_no'>
<input type='hidden' id='mr_teamname' name='mr_teamname'>
<button class='btn btn-success' onclick='reservationOk()' style='width:45%; margin-left:30%;'>예약</button>
</form>
</div>
</div>

<form id='f_nextDate' method='GET' action='./roomSearch'>
	<input type="hidden" id='nextDate_searchDate' name='searchDate'>
	<input type="hidden" id='nextDate_searchInwon' name='searchInwon'>
</form>
<script type="text/javascript">
$('.es_td').click(function() {
//     alert($(this).children().eq(0).text());
    var clickTime = $(this).children().eq(0).text();
    var clickOk = $(this).children().eq(1).text();
    var clickName = $(this).parent().children().eq(1).text();
    var clickInwon = $(this).children().eq(3).text();
    var clickEndtime = $(this).children().eq(4).val();
     clickAddress = $(this).parent().children().eq(2).val();
    var clickFacility = $(this).parent().children().eq(4).val();
    var clickMemo = $(this).parent().children().eq(5).val();
    if(clickMemo=='null'){
			clickMemo='-';
        }
    
//     alert(clickName+clickTime+clickOk+clickInwon);
if(clickOk=='(예약가능)'){
	viewMap();
	mr_no = $(this).parent().children().eq(3).val();
	
	
	$('#dropdownMenu1').text('팀명');
	$("#dropdownMenu1").html('팀명' + ' <span class="caret"></span>');
	var param = 'mr_no='+mr_no
	$.ajax({
		type:"POST"
	   ,url:"./availableTeams"
	   ,data:param
	   ,dataType:"json"
	   ,success:function(data){
		   $.each(data , function( key, val){
        	   var team_name = val.TEAM_NAME;
        	   var append = "<li><a href='#'><span style='font-size:16px;'>"+team_name+"</span></a></li>"
        	  		$('#mydd').empty();
        	  		$('#mydd').append(append);
        	  		$("#mydd a").click(function () {
        	       	    $("#dropdownMenu1").html($(this).html() + ' <span class="caret"></span>');
        	       	  });
			 });
		   }
		});
	$('#re_howmany').val(clickInwon);
	$('#re_startTime').val(clickTime);
	$('#roomAddress').val(clickName+' ('+clickAddress+')');
	$('#re_masterName').val('<%=name%>');
	$('#re_endTime').val(clickEndtime);
	$('#mr_facility').val(clickFacility);
	$('#mr_memo').val(clickMemo);
	$('#re_mr_no').val(mr_no);
	$('#re_hopedate').val(searchDate);
	$('#re_participant').val('김은수,서재민,김영성');
	$('#re_purpose').val('DB설계 검토회의');
}
else{
	alert('예약이 불가능합니다.');
}
	
});
</script>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=51c68eeb3c6b373573decd80bf6d6980&libraries=services"></script>
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
		var y = result[0].y;
		var x = result[0].x;
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
	            content: '<div style="width:200px;text-align:center;padding:6px 0;"><a href="http://map.daum.net/link/search/'+clickAddress+'">'+clickAddress+'</div>'
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
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>

</body>
</html>