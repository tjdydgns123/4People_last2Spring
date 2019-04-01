<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 String name = (String)session.getAttribute("MEM_NAME"); 
 String dept = (String)session.getAttribute("MEM_COMPANYNAME");
 String position = (String)session.getAttribute("MEM_POSITION");
 String id = (String)session.getAttribute("MEM_ID");
 
%>   
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

 <%@ include file="../common/common.jsp" %>
<title>Insert title here</title>
<script type="text/javascript">
	var noteCount;
$(document).ready(function () {
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
    background-color: rgb(51, 181, 229) !important;
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
#sidebar ul p {
    color: #fff;
    padding: 10px;
}
#sidebar ul li a {
    padding: 10px;
    font-size: 1.1em;
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
/* .navbar-nav.navbar-center { */
/*     position: absolute; */
/*     left: 50%; */
/*     transform: translatex(-50%); */
/* } */
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
  padding: 6px 8px 6px 16px;
  text-decoration: none;
  font-size: 20px;
  display: block;
  border: none;
  background: none;
  width:100%;
  text-align: left;
  cursor: pointer;
  outline: none;
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
            <h3><%=name %></h3><br>
            <h4><%=dept %>/<%=position %></h4>
        </div>
        <ul class="list-unstyled components">
            <li>
            <button class="es_dropdown-btn">개인프로젝트 
   			 <i class="fa fa-caret-down"></i>
  			</button>
  			<div class="es_dropdown-container">
    			<a href="#">Link 1</a>
    			<a href="#">Link 2</a>
    			<a href="#">Link 3</a>
  			</div>
            </li>
            <li>
            <button class="es_dropdown-btn">참여중인팀 
   			 <i class="fa fa-caret-down"></i>
  			</button>
  			<div class="es_dropdown-container" id="sideTeamList">
    			
  			</div>
            </li>
            
            <li>
                <a href="#" id="meeting">회의실</a>
            </li>
            <li>
                <a href="../chatting/chatMain.jsp">채팅</a>
                <a href="../calendar/calendar.for?crud=sel">캘린더</a>
            </li>
            <li>
                <a href="#">채팅</a>
            </li>
            <li>
                <a href="#">내 보드</a>
            </li>
        </ul>
    </nav>
    <!-- /Sidebar -->
    
    <!-- 상단 -->
<nav class="navbar navbar-default navbar-fixed-top es_info-color" style="border-color:rgb(51, 181, 229);" id='nav_top'>
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
      <ul class="nav navbar-nav navbar-left">
        <button type="button" id="sidebarToggle" class="btn btn-navbar" style="outline: none; margin-left:0px; margin-top:7px; margin-bottom:0px; background:rgb(51, 181, 229);">
        	<i class="fas fa-bars"></i>
        </button>
        <span style='margin-left:20px;' id='navChat'>
        
		</span>
      </ul>
      
      <!-- 가운데 -->
<!--       <ul class="nav navbar-nav navbar-center"> -->
   
<!--       </ul> -->
      <!-- 오른쪽 -->
      <ul class="nav navbar-nav navbar-right">
      <li style="font-size:1.5em;  color: white; margin-top:15px"><%=name %></li>
      
      <!--  -->
      
      <li class="dropdown" style='height:55px;margin-bottom:5px;'>
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="http://icons.iconarchive.com/icons/papirus-team/papirus-status/48/avatar-default-icon.png"  alt="Cinque Terre" width="35" height="35" >
              <b class="caret"></b></a>
              <ul class="dropdown-menu">
              
                <li ><a href="#" style='background-color:white;'>프로필</a></li>
                <li><a href="../note/myBoard" style='background-color:white;'>쪽지함</a></li>
                <li><a href="#" style='background-color:white;'>설정</a></li>
                <li class="divider"></li>
                <li><a href="#" style='background-color:white;'>로그아웃</a></li>
              </ul>
       </li>       
      <!--  -->
     
      
        </ul>
      <form class="navbar-form navbar-right" role="search">
      
         <a href="#" style="font-size:2.0em; margin-right:350px;  color: white; ">4People</a>
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search" style="margin-top:5px;" >
        </div>
        <button type="submit" class="btn btn-default" style="margin-top:5px; margin-right:60px;">검색</button>
         
         <a class="btn btn-default" href="#" id="alertsDropdown" role="button" aria-haspopup="true" aria-expanded="false"  style="margin-right:10px;">
          <i class="fas fa-bell fa-fw"></i>
          <span class="badge badge-danger">9+</span>
        </a>
        <a class="btn btn-default" href="../note/myBoard" id="messagesDropdown" role="button" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-envelope fa-fw"></i>
          <span class="badge badge-danger" id='messageCount'></span>
        </a>
      </form>
      
      
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
  
</nav>

<!-- /상단 -->
<div class="es_overlay"></div>
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
			alert('에러가 발생 했습니다.')
		}
		socket.onclose = function() {
			
		}
		
		
    /* 웹소켓 카운트 */
</script>
		
</div>


</body>
</html>
