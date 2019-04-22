<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.Map, java.util.List" %>
<%
	String mem_id = (String)session.getAttribute("MEM_ID");
	List<Map<String, Object>> reCalList = (List<Map<String, Object>>)request.getAttribute("reCalList");
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
		String[] starts = new String[reCalList.size()];
	for(int i =0; i<reCalList.size(); i++){
		starts[i] =(String)reCalList.get(i).get("RE_HOPEDATE")+"T"+(String)reCalList.get(i).get("RE_STARTTIME");
		
	}
%>
<!DOCTYPE html> 
<html> 
<meta charset="UTF-8">
	<jsp:include page="../include/top.jsp"  flush="false">
			<jsp:param value="" name="top" />
	</jsp:include>
<head> 
    <title>Calendarㅁㅁㅁ</title> 
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
			timeFormat: {
				'':'HH:mm',//월간
				agenda:'HH:mm{ - HH:mm}'//주간, 일간
					},
			header: { 
				left: 'prev,next', 
				center: 'title', 
				right: 'month,basicWeek,basicDay' 
			} 
			,selectable: true 
			,selectHelper: true 
			,select: function(start, end, allDay) { 
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
			,eventAfterRender: function(event, $el, view) {
			    var formattedTime = $.fullCalendar.formatDates(event.start, event.end, "HH:mm { - HH:mm}");
			    // If FullCalendar has removed the title div, then add the title to the time div like FullCalendar would do
			    if($el.find(".fc-event-title").length === 0) {
			        $el.find(".fc-event-time").text(formattedTime + " - " + event.title);
			    }
			    else {
			        $el.find(".fc-event-time").text(formattedTime);
			    }
			}
			,editable: true 
			// US Holidays 
			,eventSources:[
				{events: [//내일정
					<% for(int i =0; i<reCalList.size(); i++){%>
					{<%-- mr_no : '<%=reCalList.get(i).get("MR_NO")%>', --%>
					title:'<%=reCalList.get(i).get("MR_TEAMNAME")%>'
					,start:'<%=reCalList.get(i).get("RE_HOPEDATE2")%>'
		  			,end :'<%=reCalList.get(i).get("RE_HOPEDATE3")%>'
					,allDay:false
					,color :'#FFFFFF'
					,textColor: '#000000'
<%-- 					,start:'<%=reCalList.get(i).get("RE_HOPEDATE")%>'
 			  			,allDay:'<%=reCalList.get(i).get("RE_STARTTIME")%>'--%>
					},
		  		<%}%>
		  				{title:'바보', start:'2006-03-28', color: '#378006'}
		  		]}
			]
			/* 'http://www.google.com/calendar/feeds/usa__en%40holiday.calendar.google.com/public/basic' */ 
      		,eventClick: function(info) {
//       	    		alert('title'+ info.title
//       	      	    	 +'Start :' +info.start
//       	      	    	 +'End :'+info.end
//       	      	    	 );
      	 	}
      	 	,eventDragStop: function(event, jsEvent, ui, view) {
      	 	    calendar.fullCalendar('removeEvents', event.mr_no);
//           	 	alert('삭제'+event.mr_no);
                deleteEvent(event.mr_no);
      	 	}
		}); 
             calendar.fullCalendar('renderEvent',event,true);
        var startdate = this.start;
        var enddate = this.end;       
    }); 
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
  </body> 
 </html> 