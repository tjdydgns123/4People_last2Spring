<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.Map, java.util.List" %>
<%
	List<Map<String, Object>> calList = (List<Map<String, Object>>)request.getAttribute("calList");
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
<script type="text/javascript">
	function sendEvent(title, start,end){
		alert("전송");
		alert("title :"+title+", startdate :"+start+", enddate :"+end);
		location.href="./calendar.for?crud=ins&cal_title="
				+title+"&mem_id="+"warm_eng@naver.com"
				+"&cal_startdate="+start+"&cal_enddate="+end;
	}
</script>
</head> 
      
<body> 
	<div class="container-fluid">
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
									<div id='calendar'></div> 
								</div> 
							</div> 
						</div> 
                      <!-- /block --> 
					</div> 
				</div> 
			</div> 
          <hr> 
<!--      <footer> 
             <p>&copy; Vincent Gabriel 2013</p> 
          </footer> -->
	</div> 
    <style> 
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
				$("#dlg_calIns").modal('show');
             	 title = prompt('제목:'); 
	             this.title=title;
	             this.start = start;
	             this.end = end;
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
	                 sendEvent(title, start,end);
	             } 
	             calendar.fullCalendar('unselect'); 
	         } 
	         ,droppable: true //드래그해서 삭제할 수 있는지
	         ,drop: function(date, allDay) { //삭제가 발생하면 호출되는 함수
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
			// US Holidays 
			,events: [
			 			<% for(int i =0; i<calList.size(); i++){%>
							{title:'<%=calList.get(i).get("CAL_TITLE")%>'
				  			,start:'<%=calList.get(i).get("CAL_STARTDATE")%>'
				  			,end :'<%=calList.get(i).get("CAL_ENDDATE")%>'
							},
				  		<%}%>
		  				{title:'바보', start:'2006-03-28', color: '#378006'}
		  			 ]
			/* 'http://www.google.com/calendar/feeds/usa__en%40holiday.calendar.google.com/public/basic' */ 
      		,eventClick: function(info) {
      	    		alert('Event:title'+ info.title+'Event Start date :' +info.start.getDate());
      	 	}
		}); 
				<%--var event = {
             			<% for(int i =0; i<calList.size(); i++){%>
             				{title:'<%=calList.get(i).get("CAL_TITLE")%>'
            		  	 , start:'<%=calList.get(i).get("CAL_STARTDATE")%>'},
            		  	 <%}%>
            		  	{title:'바보'
               		  	 , start:'2006-03-28' }
             }; --%>
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
    
<div  id="dlg_calIns" class="modal fade">
  <div  class="modal-dialog" >
    <div class="modal-content" style="width:400px">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">일정만들기</h4>
      </div>
      <div class="modal-body">
		    <div style="margin-bottom:10px">
		    	<input type="text" class="form-control" id="exampleInputName2" placeholder="일정을 입력해주세요." style="width:250px;height:30px;">
			</div>
<!-- timepicker 시작 -->
<div class="dropdown">
  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
    Dropdown
    <span class="caret"></span>
  </button>
  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Action</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Another action</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Something else here</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Separated link</a></li>
  </ul>
</div>
<!-- timepicker 끝 -->

			<div class="btn-group" role="group" aria-label="...">
			  <button type="button" class="btn btn-red" id="btn_red" value="#f15f5f" style="width:30px;height:30px;"></button>
			  <button type="button" class="btn btn-orange" id="btn_orange" value="#F29661" style="width:30px;height:30px;"></button>
			  <button type="button" class="btn btn-green" id="btn_green" value="#2F9D27" style="width:30px;height:30px;"></button>
			  <button type="button" class="btn btn-blue" id="btn_blue" value="#4374D9" style="width:30px;height:30px;"></button>
			  <button type="button" class="btn btn-default" style="width:30px;height:30px;"></button>
			  <button type="button" class="btn btn-purple" id="btn_purple" value="#8041D9" style="width:30px;height:30px;"></button>
			</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save</button>
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
    
  </body> 
 </html> 