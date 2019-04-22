<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.Map, java.util.List" %>
<%
	String mem_id = (String)session.getAttribute("MEM_ID");
	List<Map<String, Object>> calList = (List<Map<String, Object>>)request.getAttribute("calList");
	List<Map<String, Object>> calTeamList = (List<Map<String, Object>>)request.getAttribute("calTeamList");
	List<Map<String, Object>> calTeamCount = (List<Map<String, Object>>)request.getAttribute("calTeamCount");
	int teamCount = calTeamCount.size();
	 
	String[] colors = new String[15];
	colors[0] = "#980000";//검붉은색
	colors[1] = "#DB3A00";//어두운 주황색
	colors[2] = "#997000";//황색
	colors[3] = "#476600";//녹색
	colors[4] = "#002266";//남색
	colors[5] = "#008299";//어두운 하늘색
	colors[6] = "#050099";//청색
	colors[7] = "#2A0066";//보라색
	colors[8] = "#990085";//자주색
	colors[9] = "#D9418C";//분홍색
	colors[10] = "#212121";//회색
	colors[11] = "#FF007F";//핫핑크색
	colors[12] = "#0054FF";//맑은 파란색
	colors[13] = "#6B9900";//밀림녹색
	colors[14] = "#4641D9";//청보라색
	//out.print(calList.get(0).get("CAL_TITLE"));
%>
<!DOCTYPE html> 
<html> 
<meta charset="UTF-8">
	<jsp:include page="../include/top.jsp"  flush="false">
			<jsp:param value="" name="top" />
	</jsp:include>
<head> 
    <title>Calendar</title> 
    <!-- Bootstrap --> 
	<!-- <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">  -->
    <link href="vendors/fullcalendar/fullcalendar.css" rel="stylesheet" media="screen"> 
    <link href="assets/styles.css" rel="stylesheet" media="screen"> 
    <!-- HTML5 shim, for IE6-8 support of HTML5 elements --> 
    <!--[if lt IE 9]> 
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script> 
    <![endif]--> 
    <script src="vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
<script type="text/javascript">
var g_start;
var g_end;
var color0 = "#FFB2D9";
var color1 = "#A566FF";
var color2 = "#FF5E00";
	function clickEvent(start, end){
// 		alert("clickEvent호출");
		 this.g_start = start;
		 this.g_end = end;
		}
	function sendEvent(){
		var title = $('#ins_title').val();
		var start = this.g_start;
		var end = this.g_end;
// 		alert("전송"+mem_id);
// 		alert("title :"+title+", startdate :"+start+", enddate :"+end);
		location.href="./calINS?cal_title="
				+title+"&mem_id="+mem_id
				+"&cal_startdate="+start.getFullYear()+"/"+(start.getMonth()+1)+"/"+start.getDate()
				+"&cal_enddate="+end.getFullYear()+"/"+(end.getMonth()+1)+"/"+end.getDate();
	}
	function deleteEvent(cal_no){
// 		alert(cal_no);
		location.href="./calDEL?cal_no="+cal_no;
	}
	function updateEvent(cal_no){
// 		alert(cal_no);
		location.href="./calUPD?cal_no="+cal_no;
	}

</script>
</head> 
<body> 

	<div class="container-fluid" style="float:right">
		<div class="row-fluid">         
            <!--/span--> 
			<div class="span9" id="content"> 
				<div class="row-fluid"> 
                    <!-- block --> 
					<div class="block"> 
						<br>
						<br>
                            <div class="block-content collapse in"> 
                                 <div class="span2"> 
                                     <!--  <div id='external-events'> 
                                     <h4>Draggable Events</h4> 
                                     <div class='external-event'>My Event 1</div> 
                                     <div class='external-event'>My Event 2</div> 
                                     <div class='external-event'>My Event 3</div> 
                                     <div class='external-event'>My Event 4</div> 
                                     <div class='external-event'>My Event 5</div> 
                                     <p> 
                                     <input type='checkbox' id='drop-remove' /> <label for='drop-remove'>remove after drop</label> 
                                     </p> 
                                     </div> -->
                                 </div> 
							<div class="span10"> 							
							<div id='calendar'>				
							</div> 
							</div> 
							</div> 
						</div> 
                      <!-- /block 이 아래는 캘린더 밑--> 
					</div> 
				</div> 
			</div> 
          <hr> 
<!--      <footer> 
             <p>&copy; Vincent Gabriel 2013</p> 
          </footer> -->
<!----------------- 체크박스 시작 -------------------->
<div class="panel panel-default" style="margin-right:80px">
	<div class="panel-body">
	<label style="text-align:center">참여중인 팀</label>
	<hr>
<% for(int k=0; k<teamCount;k++){ %>
		<p>
		  <input  type="checkbox" class="swingBar" id="cb1" onChange="scheduleChoice('<%=k %>','<%=calTeamCount.get(k).get("MAX(TEAM_NAME)") %>');" checked/> 
		  <label for="cb1" style="color:<%=colors[k]%>">
		    <%=calTeamCount.get(k).get("MAX(TEAM_NAME)") %>
		   <!--  <span class="checkmark"></span> -->
		  </label>
		</p>
<%} %>
</div>
</div>
<!----------------- 체크박스 끝 -------------------->
	</div> 
<style> 
	.input[id="cb1"] + label{
		display : inline-block;
		width: 20px;
		height: 20px;
		border: 2px solid #bcbcbc;
		cursor: pointer;
	}
	.input[id="cb1"]:checked + label{
		/* background-color: #666666; */
	}
	.input[id="cb1"]{
		display: none;
	}
	.container{
		display: inline-block;
		horizontal-align:right;
		position: relative;
		padding-left: 35px;
		margin-bottom: 12px;
		cursor: pointer;
		font-size: 12px;
		-webkit-user-select: none;
		-moz-user-select: none;
		-ms-user-select: none;
		user-select: none;
	}
	.container input{
		position: absolute;
		opacity: 0;
		cursor: pointer;
	}
	.checkmark{
		position: absolute;
		top: 0;
		left: 0;
		height: 25px;
		width: 25px;
		background-color: #eee;
	}
	.container:hover input ~ .checkmark{
		background-color: #ccc;
	}
	.container input:checked ~ .checkmark{
		background-color: #2196F3;
	}
	.container input:disabled ~ .checkmark{
		display: block;
		background-color : red;
	}
	.checkmark:after {
		content: "";
		position: absolute;
		display: none;
	}
	.container input:checked ~ .checkmark:after{
		display: block;
	}
	.container .checkmark:after{
		left: 9px;
		top: 5px;
		width: 5px;
		height: 10px;
		border: solid white;
		border-width: 0 3px 3px 0;
		-webkit-transform: rotate(45deg);
		-ms-transform: rotate(45deg);
		transform: rotate(45deg);
	}
    .btn-red {
	  color: #fff;
	  background-color: #f15f5f;
	  border-color: #f15f5f;
	}
    .btn-purple {
	  color: #fff;
	  background-color: #8041D9;
	  border-color: #8041D9;
	}
    .btn-orange {
	  color: #fff;
	  background-color: #F29661;
	  border-color: #F29661;
	}
    .btn-blue {
	  color: #fff;
	  background-color: #4374D9;
	  border-color: #4374D9;
	}
    .btn-green {
	  color: #fff;
	  background-color: #2F9D27;
	  border-color: #2F9D27;
	}
    #external-events { 
        float: left; 
        width: 150px; 
        padding: 0 10px; 
        border: 1px solid #ccc; 
        background: #eee; 
        text-align: left; 
        } 
    #external-events h4 { 
        font-size: 16px; 
        margin-top: 0; 
        padding-top: 1em; 
        } 
    .external-event { /* try to mimick the look of a real event */ 
        margin: 10px 0; 
        padding: 2px 4px; 
        background: #3366CC; 
        color: #fff; 
        font-size: .85em; 
        cursor: pointer; 
        z-index: 99999999; 
        } 
    #external-events p { 
        margin: 1.5em 0; 
        font-size: 11px; 
        color: #666; 
        } 
    #external-events p input { 
        margin: 0; 
        vertical-align: middle; 
        } 
</style> 
<!--/.fluid-container--> 
<script src="vendors/jquery-1.9.1.min.js"></script> 
<script src="vendors/jquery-ui-1.10.3.js"></script> 
<script src="bootstrap/js/bootstrap.min.js"></script> 
<script src="vendors/fullcalendar/fullcalendar.js"></script> 
<script src="vendors/fullcalendar/gcal.js"></script> 
<script src="assets/scripts.js"></script> 
<script> 
     $(function() { 
    	var title;
        var start;
        var end;
         // Easy pie charts 
		var calendar = $('#calendar').fullCalendar({
			header: { 
				left: 'prev,next', 
				center: 'title', 
				right: 'month,basicWeek,basicDay' 
			} 
			,selectable: true 
			,selectHelper: true 
			,select: function(start, end, allDay) { 
				clickEvent(start, end);
				$("#dlg_calIns").modal('show');
             	 //title = prompt('제목:'); 
             	 //title = $("#dlg_calIns.ins_title").val();
	            // this.title = title;
	             //this.start = start;
	             //this.end = end;
	             if (title) { 
	                 calendar.fullCalendar('renderEvent', 
	                     { 
	                         title: title, 
	                         start: start, 
	                         end: end, 
	                         allDay: allDay 
	                     }, 
	                     true // make the event "stick" 
	                 ); 
	                 //sendEvent(title, start,end);//calINS호출
	             } 
	             calendar.fullCalendar('unselect'); 
	         } 
	         ,droppable: true//드래그해서 삭제할 수 있는지
	         ,drop: function(date, allDay) { //삭제가 발생하면 호출되는 함수
// 		         alert('drop');
	        	 //$('#calendar').fullCalendar('removeEvent', date.title); 
	             // retrieve the dropped element's stored Event Object 
	             var originalEventObject = $(this).data('eventObject'); 
	             // we need to copy it, so that multiple events don't have a reference to the same object 
	             var copiedEventObject = $.extend({}, originalEventObject); 
	             // assign it the date that was reported 
	             copiedEventObject.start = date; 
	             copiedEventObject.allDay = allDay; 
	             // render the event on the calendar 
	             // the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/) 
             	 $('#calendar').fullCalendar('renderEvent', copiedEventObject, true); 
	             // is the "remove after drop" checkbox checked? 
	             if ($('#drop-remove').is(':checked')) { 
	                 // if so, remove the element from the "Draggable Events" list 
	                 $(this).remove(); 
	             	} 
			} 
			,editable: true 
			,eventSources:[
				{events: [//내일정
			 			<% for(int i =0; i<calList.size(); i++){%>
							{seq_no : '<%=calList.get(i).get("CAL_NO")%>'
							,title:'<%=calList.get(i).get("CAL_TITLE")%>'
				  			,start:'<%=calList.get(i).get("CAL_STARTDATE")%>'
				  			,end :'<%=calList.get(i).get("CAL_ENDDATE")%>'
							},
				  		<%}%>
		  				{title:'바보', start:'2006-03-28', color: '#378006'}
		  		]}
		  		//팀일정
		  		<%
		  		if(teamCount!=0){
		  		%>
		  			<%for(int j=0; j<teamCount; j++){%>
						   ,{id : '<%=calTeamCount.get(j).get("MAX(TEAM_NAME)")%>',
							   events: [
						 			<% for(int i =0; i<calTeamList.size(); i++){%>
				  						<%if(calTeamCount.get(j).get("TEAM_CODE").equals(calTeamList.get(i).get("TEAM_CODE"))) {%>
										{card_code : '<%=calTeamList.get(i).get("CARD_CODE")%>'
										,title:'<%=calTeamList.get(i).get("CARD_NAME")%>'
							  			,start:'<%=calTeamList.get(i).get("CARD_DATE")%>'
										},
										<%}%>
							  		<%}%>
					  				{title:'바보', start:'2006-03-28', color: '#378006'}
					  			 	]
						   			,color : '<%=colors[j]%>'
							}
					<%}%>
				<%}%>//end of if
			]
			/* 'http://www.google.com/calendar/feeds/usa__en%40holiday.calendar.google.com/public/basic' */ 
      		,eventClick: function(info) {
//       	    		alert('Event:title'+ info.title
//       	      	    	 +'Event Start date :' +info.start.getDate()
//       	      	    	 +'cal_no :'+info.seq_no
//       	      	    	 +'calendarId :'+info.id);
      	 	}
      	 	,eventDragStop: function(event, jsEvent, ui, view) {
      	 	    calendar.fullCalendar('removeEvents', event.seq_no);
//           	 	alert('삭제'+event.seq_no);
                deleteEvent(event.seq_no);
      	 	}
		}); 
             calendar.fullCalendar('renderEvent',event,true);
        var startdate = this.start;
        var enddate = this.end;       
    }); 
 	function scheduleChoice(num, id){
//  	 	alert('캘린더 선택 호출 :'+id+ ', num: '+num);
		if($(".swingBar").eq(num).is(":checked")){
				$("#calendar").fullCalendar('addEventSource',id);  
				$('#calendar').fullCalendar( 'refetchEvents' );
			}
		else {
				$("#calendar").fullCalendar('removeEventSource',id);
				$('#calendar').fullCalendar( 'refetchEvents' );
			}
		} 
    $('#external-events div.external-event').each(function() { 
        // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/) 
        // it doesn't need to have a start or end 
        var eventObject = { 
            title: $.trim($(this).text()) // use the element's text as the event title 
        	}; 
        // store the Event Object in the DOM element so we can get to it later 
        $(this).data('eventObject', eventObject); 
        // make the event draggable using jQuery UI 
        $(this).draggable({ 
            zIndex: 999999999, 
            revert: true,      // will cause the event to go back to its 
            revertDuration: 0  //  original position after the drag 
        });
    }); 
</script>
<div  id="dlg_calIns" class="modal fade">
  <div  class="modal-dialog" >
    <div class="modal-content" style="width:500px">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">일정만들기</h4>
      </div>
      <div class="modal-body">
		    <div style="margin-bottom:10px">
		    <p>제목</p>
		    	<input id="ins_title" value='제주도 워크샵' type="text" class="form-control" placeholder="일정을 입력해주세요." style="width:250px;height:30px;">
			</div>
			<p>시간</p>
			<!-- timepicker 시작//cal_starttime xx시 -->
			<div class="dropdown" style="float:left; margin-right:1px">
			  	<button id="dropdownMenu1" class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="true">
			    HOUR
			    <span class="caret"></span>
			 	</button>
			  	<ul id="dd_starthour" class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
 				<li><a href="#">08</a></li>
 				<li><a href="#">09</a></li>
 				<li><a href="#">10</a></li>
 				<li><a href="#">11</a></li>
 				<li><a href="#">12</a></li>
 				<li><a href="#">13</a></li>
 				<li><a href="#">14</a></li>
 				<li><a href="#">15</a></li>
 				<li><a href="#">16</a></li>
 				<li><a href="#">17</a></li>
			  	</ul>
			</div>
			<p style="float:left; margin-right:1px">
			시
			</p>
			<!-- timepicker 끝//cal_starttime xx시 -->
			<!-- timepicker 시작//cal_starttime xx분 -->
			<div class="dropdown" style="float:left; margin-right:1px">
			  	<button id="dropdownMenu2" class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="true">
			    MINUTE
			    <span class="caret"></span>
			 	</button>
			  	<ul id="dd_startmin" class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu2">
			    <li><a href="#">00</a></li>
			    <li><a href="#">10</a></li>
			    <li><a href="#">20</a></li>
			    <li><a href="#">30</a></li>
			    <li><a href="#">40</a></li>
			    <li><a href="#">50</a></li>
			  	</ul>
			</div>
			<p style="float:left; margin-right:1px"> 
			분&nbsp;~&nbsp;
			</p>
			<!-- timepicker 끝//cal_starttime xx분 -->
			<!-- timepicker 시작//cal_endtime xx시 -->
			<div class="dropdown" style="float:left; margin-right:1px">
			  	<button id="dropdownMenu3" class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="true">
			    HOUR
			    <span class="caret"></span>
			 	</button>
			  	<ul id="dd_endhour" class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu3">
 				<li><a href="#">08</a></li>
 				<li><a href="#">09</a></li>
 				<li><a href="#">10</a></li>
 				<li><a href="#">11</a></li>
 				<li><a href="#">12</a></li>
 				<li><a href="#">13</a></li>
 				<li><a href="#">14</a></li>
 				<li><a href="#">15</a></li>
 				<li><a href="#">16</a></li>
 				<li><a href="#">17</a></li>
			  	</ul>
			</div>
			<p style="float:left; margin-right:1px">
			시
			</p>
			<!-- timepicker 끝//cal_endtime xx시 -->
			<!-- timepicker 시작//cal_endtime xx분  -->
			<div class="dropdown" style="float:left; margin-right:1px">
			  	<button id = dropdownMenu4 class="btn btn-default dropdown-toggle form-control"  type="button" data-toggle="dropdown" aria-expanded="true">
			    MINUTE
			    <span class="caret"></span>
			 	</button>
			  	<ul id="dd_endmin" class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu4">
			    <li><a href="#">00</a></li>
			    <li><a href="#">10</a></li>
			    <li><a href="#">20</a></li>
			    <li><a href="#">30</a></li>
			    <li><a href="#">40</a></li>
			    <li><a href="#">50</a></li>
			  	</ul>
			</div>
			<p>
			분
			</p>
			<!-- timepicker 끝//cal_endtime xx분  -->
      </div>
      <div class="modal-footer">
        <input type="button" class="btn btn-primary" onClick="sendEvent()" value="Save">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
 <%--    
      <div id="dlg_calIns" title="일정 만들기" 
    data-options="modal:true,closed:true,
<!--         	 buttons:[{
    	 	text:'저장',
    	 	iconCls:'icon-save',
    	 	handler:function(){boardUpdate();}
    	 	},{
    	 	text:'닫기',
    	 	iconCls : 'icon-help',
    	 	handler:function(){$('#dlg_boardUpd').dialog('close');}
    	 }] -->
    " 
    style="width:600px;height:450px;padding:10px">
    </div> --%>
<script type="text/javascript">
//dropdown 메뉴에서 선택한 값 dropdown box에 찍어주기
$(function (){
	$('#dd_starthour a').click(function () {
   	 		$('#dropdownMenu1').html($(this).html() + ' <span class="caret"></span>');
	});
	$('#dd_startmin a').click(function () {
   	 		$('#dropdownMenu2').html($(this).html() + ' <span class="caret"></span>');
	});
	$('#dd_endhour a').click(function () {
	 		$('#dropdownMenu3').html($(this).html() + ' <span class="caret"></span>');
	});
	$('#dd_endmin a').click(function () {
		 	$('#dropdownMenu4').html($(this).html() + ' <span class="caret"></span>');
	});
});
</script>
  </body> 
 </html> 