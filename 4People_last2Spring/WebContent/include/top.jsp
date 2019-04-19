<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 String name = (String)session.getAttribute("MEM_NAME"); 
 String dept = (String)session.getAttribute("MEM_COMPANYNAME");
 String position = (String)session.getAttribute("MEM_POSITION");
 String id = (String)session.getAttribute("MEM_ID");
 String image = (String)session.getAttribute("MEM_IMAGE");
 String imagePath ="http://icons.iconarchive.com/icons/papirus-team/papirus-status/48/avatar-default-icon.png";
 if(image!=null){
	 imagePath="http://192.168.0.6:9000/4People_last2Spring/pds/"+image;
// 	 imagePath="http://localhost:9000/4People_last2Spring/pds/"+image;
 }
 
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../csss/es_radio.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Cute+Font" rel="stylesheet">
 <%@ include file="../common/common.jsp" %>
<title>Insert title here</title>
<script type="text/javascript">
	var noteCount;
	function newTeamModal(){
		$('#teamName').val('');
		$('#radio3').prop('checked',false);
		$('#radio4').prop('checked',false);
		$('#newTeamModal').modal('show');
		}

$(document).ready(function () {
	$('#memberInfo').on('click',function(e){
			e.preventDefault();
		});

	$('#radio3').click(function(){
		$('#radio4').prop('checked',false);
		});
	$('#radio4').click(function(){
		$('#radio3').prop('checked',false);
	});
	$('#createTeam').click(function(){
		var check;
		var teamState;
		var success;
		var team_code;
		var teamName = $('#teamName').val();
		check= $("input:radio[name='private']").is(":checked");
		if(check){
			teamState = 'private';
			}
		else{
			teamState = 'public';
			}
		location.href="../team/newTeam?team_name="+teamName+"&team_state="+teamState;
					
			
		});
	count();
	function count(){
		$.ajax({
			type:"POST"
			,url:"../include/messageCount"
			,dataType:"json"
			,success:function(data){
// 				alert(data);
				noteCount=data;
				noteCount *= 1;
				$('#messageCount').append(data);
			}
		});
	}
	$('#sidebarToggle').click(function(){
		
// 		<a href="../meetRoom/meetMain.jsp" id="meeting" style="font-size:20px">회의실 페이지로 이동</a>
		
		$.ajax({
					type:"POST"
				   ,url:"../include/sidebarMeet"
				   ,dataType:"json"
				   ,success:function(data){
					   $('#sideMeetList').empty();
					   var append = '<a href="../meetRoom/meetMain.jsp"  style="font-size:20px; color:#FFA7A7;">회의실 페이지로 이동</a>';
					   $('#sideMeetList').append(append);
					   $.each(data , function( key,  val){
						  	var mr_no = val.MR_NO;
						  	var mr_name = val.MR_NAME;
						  	var mr_detaileloc = val.MR_DETAILELOC;
						  	var append = "<a href='../meetRoom/reCalList?mr_no="+mr_no+"'>"
						  				  +mr_name+'&nbsp;&nbsp;'+mr_detaileloc+"</a>";
						  	$('#sideMeetList').append(append);
					   });
					   }
		 ,error:function(jqXHR, exception){
			  if (jqXHR.status === 0) {
		            alert('Not connect.\n Verify Network.');
		        }
		        else if (jqXHR.status == 400) {
		            alert('Server understood the request, but request content was invalid. [400]');
		        }
		        else if (jqXHR.status == 401) {
		            alert('Unauthorized access. [401]');
		        }
		        else if (jqXHR.status == 403) {
		            alert('Forbidden resource can not be accessed. [403]');
		        }
		        else if (jqXHR.status == 404) {
		            alert('Requested page not found. [404]');
		        }
		        else if (jqXHR.status == 500) {
		            alert('Internal server error. [500]');
		        }
		        else if (jqXHR.status == 503) {
		            alert('Service unavailable. [503]');
		        }
		        else if (exception === 'parsererror') {
		        	$('#sideMeetList').empty();
		        	var append = "<a href='#'>사용가능 회의실이 없습니다.</a>";
		        	$('#sideMeetList').append(append);
		        }
		        else if (exception === 'timeout') {
		            alert('Time out error. [Timeout]');
		        }
		        else if (exception === 'abort') {
		            alert('Ajax request aborted. [Aborted]');
		        }
		        else {
		            alert('Uncaught Error.n' + jqXHR.responseText);
		        }


		  }
		
			});
		
		$.ajax({
			type:"POST"
		   ,url:"../include/sidebarTeam"
		   ,dataType:"json"
		   ,success:function(data){
			   $('#sideTeamList').empty();
			   $.each(data , function( key,  val){
				  	var teamName = val.TEAM_NAME;
				  	var code = val.TEAM_CODE;
				  	var append = "<a href='../team/board?team_code="+code+"'>"
				  				  +teamName+"</a>";
				  	$('#sideTeamList').append(append);
			   });
		   }
		  ,error:function(jqXHR, exception){
			  if (jqXHR.status === 0) {
		            alert('Not connect.\n Verify Network.');
		        }
		        else if (jqXHR.status == 400) {
		            alert('Server understood the request, but request content was invalid. [400]');
		        }
		        else if (jqXHR.status == 401) {
		            alert('Unauthorized access. [401]');
		        }
		        else if (jqXHR.status == 403) {
		            alert('Forbidden resource can not be accessed. [403]');
		        }
		        else if (jqXHR.status == 404) {
		            alert('Requested page not found. [404]');
		        }
		        else if (jqXHR.status == 500) {
		            alert('Internal server error. [500]');
		        }
		        else if (jqXHR.status == 503) {
		            alert('Service unavailable. [503]');
		        }
		        else if (exception === 'parsererror') {
		        	$('#sideTeamList').empty();
		        	var append = "<a href='#'>참여중인 팀이없습니다.</a>";
		        	$('#sideTeamList').append(append);
		        }
		        else if (exception === 'timeout') {
		            alert('Time out error. [Timeout]');
		        }
		        else if (exception === 'abort') {
		            alert('Ajax request aborted. [Aborted]');
		        }
		        else {
		            alert('Uncaught Error.n' + jqXHR.responseText);
		        }
		  }
});
	});
	
});
	
</script>
<style>
  
  /*
    DEMO STYLE
*/
@import "https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700";
.es_info-color {
    background-color: rgb(0, 51, 102) !important;
}
body {
    font-family: 'Poppins', sans-serif;
    background: #fafafa;
}
p {
    font-family: 'Poppins', sans-serif;
    font-size: 1.1em;
    font-weight: 300;
    line-height: 1.7em;
    color: #999;
}
a, a:hover, a:focus {
    color: inherit;
    text-decoration: none;
    transition: all 0.3s;
}
/* .navbar { */
/*     padding: 15px 10px; */
/*     background: #fff; */
/*     border: none; */
/*     border-radius: 0; */
/*     margin-bottom: 40px; */
/*     box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1); */
/* } */
/* .navbar-btn { */
/*     box-shadow: none; */
/*     outline: none !important; */
/*     border: none; */
/* } */
.es_line {
    width: 100%;
    height: 1px;
    border-bottom: 1px dashed #ddd;
    margin: 40px 0;
}
/* ---------------------------------------------------
    SIDEBAR STYLE
----------------------------------------------------- */
.es_wrapper {
    display: block;
    margin-bottom:60px;
}
.es_overlay {
    display: none;
    position: fixed;
    /* full screen */
    width: 100vw;
    height: 100vh;
    /* transparent black */
    background: rgba(0, 0, 0, 0.7);
    /* middle layer, i.e. appears below the sidebar */
    z-index: 998;
    opacity: 0;
    /* animate the transition */
    transition: all 0.5s ease-in-out;
}
/* display .overlay when it has the .active class */
#dismiss {
    width: 35px;
    height: 35px;
    position: absolute;
    /* top right corner of the sidebar */
    top: 10px;
    right: 10px;
    background:#5B718C;
    border:0;
    border-color:#5B718C;
}
#sidebar {
    min-width: 250px;
    max-width: 250px;
    height: 100vh;
    position: fixed;
    top: 0;
    left: -250px;
    /* top layer */
    z-index: 9999;
    background: #5B718C;
    color: #fff;
    transition: all 0.3s;
}
#sidebar.active { 
    margin-left: 250px; 
} 
#sidebar .sidebar-header {
    padding: 20px;
    background: #5B718C;
}
#sidebar ul.components {
    padding: 20px 0;
    border-bottom: 1px solid #47748b;
    
}
#sidebar ul{
	font-family: 'Cute Font', cursive;
	font-family: 'Noto Sans KR', sans-serif;
	
}
#sidebar ul p {
    color: #fff;
    padding: 10px;
}
#sidebar ul li a {
    padding: 10px;
    font-size: 1.1em; !important;
    display: block;
}

#sidebar ul li a:hover {
    color: #7386D5;
    background: #fff;
}
#sidebar ul li.active > a, a[aria-expanded="true"] {
    color: #fff;
    background: #376092;
}
/* a[data-toggle="collapse"] { */
/*     position: relative; */
/* } */
/* a[aria-expanded="false"]::before, a[aria-expanded="true"]::before { */
/*     content: '\e259'; */
/*     display: block; */
/*     position: absolute; */
/*     right: 20px; */
/*     font-family: 'Glyphicons Halflings'; */
/*     font-size: 0.6em; */
/* } */
a[aria-expanded="true"]::before {
    content: '\e260';
}
ul ul a {
    font-size: 0.9em !important;
    padding-left: 30px !important;
    background: #6d7fcc;
}
ul.CTAs {
    padding: 20px;
}
ul.CTAs a {
    text-align: center;
    font-size: 0.9em !important;
    display: block;
    border-radius: 5px;
    margin-bottom: 5px;
}
a.download {
    background: #fff;
    color: #7386D5;
}
a.article, a.article:hover {
    background: #6d7fcc !important;
    color: #fff !important;
}
 .navbar-nav.navbar-center { 
     position: absolute; 
     left: 50%; 
     transform: translatex(-50%); 
 } 
/* ---------------------------------------------------
    CONTENT STYLE
----------------------------------------------------- */
#content {
    width: calc(100% - 250px);
    padding: 40px;
    min-height: 100vh;
    transition: all 0.3s;
    position: absolute;
    top: 0;
    right: 250px;
}
#content.active {
    width: 100%;
}
.es_dropdown-container {
  display: none;
  padding-left: 8px;
}
.es_dropdown-btn {
/*   padding: 6px 8px 6px 16px; */
  text-decoration: none;
  font-size: 25px;
  display: block;
  border: none;
  background: none;
     width:100%; 
   text-align: left; 
  cursor: pointer;
  outline: none;
  margin-bottom:8px;
}

.es_active {
  background-color:#376092;
  color: white;
}
.meetplace{
border:1px solid blue;
margin-top:2%;
width:95%;
height:1000px;
margin-left:2.5%;
}


 #utopia{
 text-transform: uppercase;
	color: #fff;
	text-shadow: 0 0 10px #fff, 0 0 20px #fff, 0 0 30px #fff, 
	             0 0 40px #ff00de, 0 0 70px #ff00de, 
	             0 0 80px #ff00de, 0 0 100px #ff00de, 0 0 120px #ff00de;
 }

</style>
</head>
<body>
<script type="text/javascript">
$(function() {
	$("#meeting").click(function() {
		$("#meetdiv").load("../meetRoom/meetRoomAdds.jsp");
	});
});
</script>

<div class="es_wrapper">
 <!-- Sidebar -->
    <nav id="sidebar">

        <button id="dismiss" onclick="dismiss()">
            <i class="fas fa-arrow-left"></i>
        </button>

        <div class="sidebar-header">
            <h2 style='margin-bottom:0;font-weight:bold;'><img src='<%=imagePath %>' width='40' height='40'><%=name %></h2><br>
            <h4  style='position:relative; margin-top:3px;font-weight:bold; color:#FFF;'><%=dept %>/<%=position %></h4>
        </div>
        <ul class="list-unstyled components">
          
            <li>
            
            <button class="es_dropdown-btn">
            <img src='../images/sideTeam.png' width='35' height='35'>
            	&nbsp;&nbsp;참여중인팀
   			 <i class="fa fa-caret-down"></i>
  			</button>
  			<div class="es_dropdown-container" id="sideTeamList">
    			
  			</div>
            </li>
            
            <li>
                
            	 <button class="es_dropdown-btn">
	            <img src='../images/sideMeet.png' width='35' height='35'>
	            	&nbsp;&nbsp;회의실 
	   			 <i class="fa fa-caret-down"></i>
	  			</button>
	  			<div class="es_dropdown-container" id="sideMeetList">
    			
  			</div>
            
            
            </li>
            <li style='font-size:30px;'>
                <a href="../chatting/chatMain.jsp"  style='font-size:20px'><h3 style='margin:0'><img src='../images/sideChat.png'width='35' height='35'>&nbsp;&nbsp;채팅</h3></a>
                <a href="../calendar/calList?mem_id=<%=id %>" style='font-size:20px' ><h3 style='margin:0'><img src='../images/sideCalender.png'width='35' height='35'>&nbsp;&nbsp;캘린더</h3></a>
<!--                 <a href="../calendar/calList" style='font-size:20px' >캘린더</a> -->
                <a href="../chart/chartList?mem_id=<%=id %>" style='font-size:20px'><h3 style='margin:0'><img src='../images/sideChart.png'width='35' height='35'>&nbsp;&nbsp;차트</h3></a>
            </li>
            <li>
                <a href="../note/myBoard" style='font-size:20px'><h3 style='margin:0'><img src='../images/sideNote.png'width='35' height='35'>&nbsp;&nbsp;내 보드</h3></a>
            </li>
            <li class="divider"></li>
            <li>
                <a href="javascript:newTeamModal()" style='font-size:20px'><h3 style='margin:0'><img src='../images/sideCreateTeam.png'width='35' height='35'>&nbsp;&nbsp;팀 만들기</h3></a>
            </li>
        </ul>
    </nav>
    <!-- /Sidebar -->
    
    <!-- 상단 -->
  <div class='col-sm-12'>
<nav class="navbar navbar-default navbar-fixed-top es_info-color" style="border-color:rgb(0, 51, 102);" id='nav_top'>
  <div class="container-fluid">
   <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#topNav">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
    </div>
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="navbar-collapse collapse" id='topNav'>
      <!-- 왼쪽 -->
      <div class='col-sm-2'>
      <ul class="nav navbar-nav navbar-left">
        <button type="button" id="sidebarToggle" class="btn btn-navbar" style="outline: none; margin-left:0px; margin-top:7px; margin-bottom:0px; background:rgb(0, 51, 102);">
<!--         	<i class="fas fa-bars"></i>  -->
<img src='../images/sideButton5.png' style='background-color:#003366' width='35px' height='35px'>
        </button>
      </ul>
      <span  id='navChat'>
        
		</span>
      </div>
      
      
      <!-- 가운데 -->
      <div class='col-sm-3 col-sm-offset-3' style='height:60px;'>
      <a id="utopia" href="../board/boardlist?mem_id=<%=id %>" style="font-size:3.0em; font-weight:bold; margin-right:250px; margin-top:7px;  color: white; ">육토피아</a>
      </div>
      <!-- 가운데 -->
   		<!-- 검색 -->
   		<div class='col-sm-2' style='margin-top:0px;'>
<script>
  (function() {
    var cx = '017166172904477820079:btu6_etctw4';
    var gcse = document.createElement('script');
    gcse.type = 'text/javascript';
    gcse.async = true;
    gcse.src = 'https://cse.google.com/cse.js?cx=' + cx;
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(gcse, s);
  })();
</script>
<gcse:search disableWebSearch='false' enableAutoComplete="true" defaultToImageSearch="false"></gcse:search>
         </div>
   		<!-- 검색 -->
      <!-- 오른쪽 -->
      <div class='col-sm-2'>
      <ul class="nav navbar-nav navbar-right">
      <li style="font-size:1.5em;  color: white; margin-top:15px"><%=name %></li>
      <!--  -->
      <li class="dropdown" style='height:55px;margin-bottom:5px;'>
              <a href="#" class="dropdown-toggle" data-toggle="dropdown"  id='memberInfo'>
              <img src=<%=imagePath %>  alt="Cinque Terre" width="35" height="35" >
              <b class="caret"></b></a>
              <ul class="dropdown-menu">
              
                <li ><a href="../include/profile.jsp" style='background-color:white;'>프로필</a></li>
                <li><a href="../note/myBoard" style='background-color:white;'>쪽지함</a></li>
                <li class="divider"></li>
                <li><a href="../login/logout" style='background-color:white;'>로그아웃</a></li>
              </ul>
       </li>       
      <!--  -->
        </ul>
        <a class="btn btn-default " href="../note/myBoard" id="messagesDropdown" role="button" aria-haspopup="true" aria-expanded="false" style='margin-top:15px'>
          <i class="fas fa-envelope fa-fw"></i>
          <span class="badge badge-danger" id='messageCount'></span>
        </a>

      </div>
      
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
  
</nav>
</div>
<!-- /상단 -->
<div class="es_overlay"></div>

<div class="modal fade" id="newTeamModal" role="dialog">
  <div class="modal-dialog modal-sm" >
    <div class="modal-content">
      <div class="modal-header">
        <img width="30px" height="30px"src="../images/createTeam.png">
        <span class="modal-title text-center" style='font-size:20px; font-weight:bold; margin-left:20px;padding:10px;color:#BDBDBD;'>create Team</span>
         <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      
      <div class="modal-body" style='overflow-x:hidden; height:300px;' id='messageModalBody'>
      		<input type='text' class='form-control' id='teamName' placeholder='팀명을 적어주세요'>
            <div class="es_funkyradio">
             <div class="es_funkyradio-success">
             <input type="radio" name="public" id="radio3" style='margin-bottom:3px;'/>
             <label for="radio3" style='margin-bottom:3px;'>공개</label>
             </div>
             <div class="es_funkyradio-danger">
            <input type="radio" name="private" id="radio4" />
            <label for="radio4">비공개</label>
        </div>
            </div>
      		<div style='padding:10px; color:#BDBDBD; font-szie:15px; margin-top:20px;'>새로운 프로젝트팀을 생성해서 팀원을 꾸려보세요.</div>
    	</div>
    	<form id='checkDatas'>
      <div class="modal-footer">
      	<button type="button" class="btn btn-default" id="createTeam" data-dismiss="modal" style='border:0; color:#47C83E;'><i class="fas fa-check"></i>&nbsp;팀생성</button>
        <button type="button" class="btn btn-default" data-dismiss="modal" style='border:0; color:#FF0000;'><i class="fas fa-times"></i>&nbsp;나가기</button>
      </div>
      	</form>
  </div>
</div>
</div>



<script type="text/javascript">
function dismiss(){
   // hide sidebar
    $("#sidebar").removeClass("active");
    // hide overlay
    
}
    $(document).ready(function () {
        
        $('#dismiss, .es_overlay').on('click', function () {
            // hide sidebar
            $('#sidebar').removeClass("active");
            // hide overlay
        });
        
        $('#sidebarToggle').on('click', function () {
            // open sidebar
            $('#sidebar').addClass("active");
            // fade in the overlay
//             $('.overlay').addClass("active");
//             $('.collapse.in').toggleClass('in');
//             $('a[aria-expanded=false]').attr('aria-expanded', 'true');
        });
    });
    var dropdown = document.getElementsByClassName("es_dropdown-btn");
    var i;
    for (i = 0; i < dropdown.length; i++) {
      dropdown[i].addEventListener("click", function() {
        this.classList.toggle("es_active");
        var dropdownContent = this.nextElementSibling;
        if (dropdownContent.style.display === "block") {
          dropdownContent.style.display = "none";
        } else {
          dropdownContent.style.display = "block";
        }
      });
    }

    
    $('ul.nav li.dropdown').hover(function() {
    	  $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeIn(500);
    	}, function() {
    	  $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeOut(500);
    	});
    /* 웹소켓 카운트 */
   		 var socket = new WebSocket('ws://192.168.0.6:9000/4People_last2Spring/WebSocketServer')
		 var data = []
    	 var mem_id = "<%= id %>";
		socket.onopen = function() {
    		var obj ={
    			 id : mem_id,
    			 gubun : 'open'
    		}
    		var json = JSON.stringify(obj);
   			socket.send(json);
		}
		socket.onmessage = function(message) {
			var info = JSON.parse(message.data);
			var gubun = info.gubun;
			if(gubun=='sendNote'){
				noteCount +=1;
				$('#messageCount').empty();
				$('#messageCount').append(noteCount);
			}
			
		}
		socket.onerror = function() {
			//alert('에러가 발생 했습니다.')
		}
		socket.onclose = function() {
			
		}
		
		
    /* 웹소켓 카운트 */
</script>
		
</div>


</body>
</html>