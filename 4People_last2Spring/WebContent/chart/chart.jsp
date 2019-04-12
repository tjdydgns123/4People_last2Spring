<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<meta charset="UTF-8">
	<jsp:include page="../include/top.jsp"  flush="false">
		<jsp:param value="" name="top" />
	</jsp:include> 
<style type="text/css">
/* 항목 사이 간격 주기 */
.item-space {
    margin-right: 10px;
}
/* 글씨 폰트 변경 */
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
.hanna {font-family: 'Nanum Gothic', sans-serif; font-size:30px; color:black} 
</style>
<script type="text/javascript">
/* 차트 등록 버튼 누르면 처리 시작 */
function save() {
	//폼 전송 처리함.
	$("#form_chartIns").attr("method", "POST");
	$("#form_chartIns").attr("action", "chartIns");
	$("#form_chartIns").submit();
}
/* 차트 등록 버튼 누르면 처리 끝 */

</script>
</head>
<body>

 

<script type="text/javascript">
$(document).ready(function(){
	var aa_label = new Array();
	var aa_chartname = new Array();
	var aa_charttype = new Array();
	var aa_data = new Array();
	var aa_no = new Array();
	<c:forEach items="${chartList}" var="aaa">
		aa_label.push("${aaa.label}");
		aa_chartname.push("${aaa.chartname}");
		aa_charttype.push("${aaa.charttype}");
		aa_data.push("${aaa.data}");
		aa_no.push("${aaa.no}");
	</c:forEach>
	
	for(var i=0; i<${chartList.size()}; i++){
		
 		var chartType = aa_charttype[i]; 
		
	    var v_x = aa_label[i];   
	    var tokens_x = v_x.split(','); 
	    var x1 = tokens_x[0];  
	    var x2 = tokens_x[1];  
	    var x3 = tokens_x[2];  
	    var x4 = tokens_x[3]; 
	    
	    var v_y = aa_data[i];
	    var tokens_y = v_y.split(',');  
	    var y1 = tokens_y[0];   
	    var y2 = tokens_y[1];   
	    var y3 = tokens_y[2];   
	    var y4 = tokens_y[3];  
	    
	    var chartName = aa_chartname[i];

	    
	    var ctx = document.getElementById(aa_no[i]).getContext('2d'); 
	    var myBarChart  = new Chart(ctx, {
	        type: chartType,
	        data: {
	        	labels: [x1, x2, x3, x4],
	    		datasets: [
	    			{
	    				label: "막대 그래프 테스트",
	    				backgroundColor:["red","green","blue","pink"],
	    				data: [y1, y2, y3, y4] 
	    			}
	    		]
	        },
	        	
	        options: {
	        	 responsive: false
	            }
	    });

	     }

	var ctx = document.getElementById('myChart3').getContext('2d');
	var myBarChart2  = new Chart(ctx, {
	    type: 'radar', 
	    data: {
	    	labels: ["1월", "2월", "3월"],
			datasets: [
				{
					label: "버블 그래프 테스트",
					backgroundColor:["red","green","blue"],
					data: [65, 59, 80, 65, 59, 80, 65, 59, 80] 
				}
			]
	    },
	    options: {
	    	 responsive: true
	        }
	});
	
});
// var ctx = document.getElementById('myChart1').getContext('2d');
// var myBarChart  = new Chart(ctx, {
//     type: 'bar',
//     data: {
//     	labels: ["1월", "2월", "3월"],
// 		datasets: [
// 			{
// 				label: "막대 그래프 테스트",
// 				backgroundColor:["red","green","blue"],
// 				data: [65, 59, 80] 
// 			}
// 		]
//     },
    	
//     options: {
//     	 responsive: false
//         }
// });


// var ctx = document.getElementById('myChart2').getContext('2d');
// var myPieChart  = new Chart(ctx, {
//     type: '${chartList.get(0).charttype}',
//     data: {
//     	labels: ["${chartList.get(0).label}"],
// 		datasets: [
// 			{
// 				label: "${chartList.get(0).chartname}",
// 				backgroundColor:["red","green","blue"],
// 				data: [${chartList.get(0).data}] 
// 			}
// 		]
//     },
//     options: {
//     	 responsive: false,
//     	 scales: { //X,Y축 옵션
//              yAxes: [{
//                  ticks: {
//                      beginAtZero:true  //Y축의 값이 0부터 시작
//                  }
//              }]
//         }
//     }
// });



//차트 정보 불러옴
    // getter
//     for(int i=0; i<chartList.length(); i++){
//     var chartType = $('input[name="charttype"]:checked').val();


</script>
<div class=" row col-md-offset-1" style="position: relative; height:30vh; width:95vw"><br>
<!-- 차트 등록 버튼 시작 -->
<button type="button" data-toggle="modal" class="btn btn-default item-space" style="width:200px; height:200px" data-target="#modal_createChart">
  <i class="fas fa-plus-circle" style="color:rgb(92,209,229); font-size:50px"></i>
 <br><br> <h4><strong>차트 생성하기</strong></h4>
</button>
<!-- 차트 등록 버튼 끝 -->

<!-- 차트 리스트 버튼 시작 -->
<c:forEach items="${chartList}" var="chartList">
<button type="button" id="btn_myChart1" data-toggle="modal" class="btn btn-default item-space" style="width:330px; height:200px" data-target="#modal_myChart1">
<canvas id="${chartList.no}" ></canvas> 
 <h4><strong>${chartList.chartname}</strong></h4>
</button>
</c:forEach>
<!-- 차트 리스트 버튼 끝 -->






</div>
<!-- 차트 등록 Modal 시작-->
  <div class="modal fade" id="modal_createChart" role="dialog" style="width:'500px'">
    <div class="modal-dialog modal-lg">
     
      <!-- Modal content-->
      <div class="modal-content" style="background-color:#D9D9D9">
        <div class="modal-header" style="background-color:#D9D9D9">
          <button type="button" class="close" data-dismiss="modal">X</button>
          <h3 class="modal-title" align="center"><strong>새 차트 등록하기</strong></h3>
        </div>
        <div class="modal-body" style="background-color:#D9D9D9">
          <div class="col-md-12 text-center" style="background-color:#D9D9D9">
          <p class="hanna">차트 종류 선택</p>
          <form id="form_chartIns" method="post">
          <input type="hidden" id="mem_id" name="mem_id" value="${chartList.get(0).mem_id}">
          <div class="btn-group" data-toggle="buttons">
          <label class="btn btn-default item-space" style="width:150px; height:150px"><br>
		  <img src="image/bar-chart.png" style=" width: 50px; height: auto"><br><br>
		  <input type="radio" name="charttype" id="barChart" autocomplete="off" checked value="bar"><strong>막대형 차트</strong>
			</label>
			
			<label class="btn btn-default item-space" style="width:150px; height:150px"><br>
		  <img src="image/pie-chart.png" style=" width: 50px; height: auto"><br><br>
		  <input type="radio" name="charttype" id="pieChart" autocomplete="off" checked value="doughnut"><strong>도넛형 차트</strong>
			</label>

			<label class="btn btn-default item-space" style="width:150px; height:150px"><br>
		  <img src="image/line-chart.png" style=" width: 50px; height: auto"><br><br>
		  <input type="radio" name="charttype" id="lineChart" autocomplete="off" checked value="line"><strong>선형 차트</strong>
			</label>
 
			<label class="btn btn-default item-space" style="width:150px; height:150px"><br>
		  	<img src="image/radar-chart2.png" style=" width: 50px; height: auto"><br><br>
		  <input type="radio" name="charttype" id="bubbleChart" autocomplete="off" checked value="radar"><strong>방사형 차트</strong>
			</label></div><br>
		
			 <h3>[데이터 입력]</h3> 
			 <h4>X축 (항목명 또는 값)</h4>
			 <textarea class="item-space" id="x1" name="label" style="width:80px; height:50px; font-size:30px; resize:none"></textarea>		
			 <textarea class="item-space" id="x2" name="label" style="width:80px; height:50px; font-size:30px; resize:none"></textarea>			
			 <textarea class="item-space" id="x3" name="label" style="width:80px; height:50px; font-size:30px; resize:none"></textarea>			
			 <textarea id="x4" name="label" style="width:80px; height:50px; font-size:30px; resize: none"></textarea><br>			
			 <h4>Y축 (값)</h4>
			 <textarea class="item-space" id="y1" name="data" style="width:80px; height:50px; font-size:30px; resize:none"></textarea>		
			 <textarea class="item-space" id="y2" name="data" style="width:80px; height:50px; font-size:30px; resize:none"></textarea>		
			 <textarea class="item-space" id="y3" name="data" style="width:80px; height:50px; font-size:30px; resize:none"></textarea>		
			 <textarea id="y4" name="data" style="width:80px; height:50px; font-size:30px; resize:none"></textarea><br>
			 <h3>차트 제목</h3>
			 <textarea id="chartName" name="chartname" style="width:500px; height:50px; font-size:30px; resize:none"></textarea><br><br>			
          <button type="button" class="btn btn-primary btn-lg item-space" id="btn_chartCreate" data-dismiss="modal" onClick="save()">등록</button>
          <button type="button" class="btn btn-dark btn-lg" data-dismiss="modal" style="background-color:#8C8C8C">취소</button>
          </form>
			</div> 
    </div>
			<div class="modal-footer"></div>
  </div></div></div>
  <!-- 차트 등록 Modal 끝-->
  <!-- 나의 차트 1 선택 Modal 시작-->
  <div class="modal fade" id="modal_myChart1" role="dialog" style="width:'500px'; height:'auto'">
    <div class="modal-dialog modal-lg">
      <!-- Modal content--> 
      <div class="modal-content" style="background-color:#D9D9D9">
        <div class="modal-header" style="background-color:#D9D9D9">
          <button type="button" class="close" data-dismiss="modal">X</button>
          <h3 class="modal-title" align="center"><strong>나의 차트 1</strong></h3>
        </div>
        <div class="modal-body" style="background-color:#D9D9D9">
          <div class="col-md-12 text-center" style="background-color:#D9D9D9">
          	<canvas id="myChart3" ></canvas> 
			<button type="button" class="btn btn-secondary btn-lg item-space" data-dismiss="modal" style="background-color:#D9D9D9">
			<i class="fas fa-trash-alt" style="font-size:50px"></i><br>
			<strong>삭제</strong></button>
			<button type="button" class="btn btn-secondary btn-lg item-space" data-dismiss="modal" style="background-color:#D9D9D9">
			<i class="fas fa-edit" style="font-size:50px"></i><br>
			<strong>수정</strong></button>
			<button type="button" class="btn btn-secondary btn-lg item-space" data-dismiss="modal" style="background-color:#D9D9D9">
			<i class="fas fa-copy" style="font-size:50px"></i><br>
			<strong>복사</strong></button>
			<button type="button" class="btn btn-secondary btn-lg" data-dismiss="modal" style="background-color:#D9D9D9">
			<i class="fas fa-save" style="font-size:50px"></i><br>
			<strong>저장</strong></button>
			</div> 
    </div>
			<div class="modal-footer"></div>
  </div></div></div>
  <!-- 나의 차트 1 선택  Modal 끝-->
</body>