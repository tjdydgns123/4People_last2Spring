<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<meta charset="UTF-8">
	<jsp:include page="../include/top.jsp"  flush="false">
		<jsp:param value="" name="top" />
	</jsp:include> 
<style>
/* 항목 사이 간격 주기 */
.item-space {
    margin-right: 10px;
}
</style>
<script type="text/javascript">

</script>
</head>
<body>
<script type="text/javascript">
$(document).ready(function(){
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


var ctx = document.getElementById('myChart2').getContext('2d');
var myPieChart  = new Chart(ctx, {
    type: 'pie',
    data: {
    	labels: ["1월", "2월", "3월"],
		datasets: [
			{
				label: "원형 그래프 테스트",
				backgroundColor:["red","green","blue"],
				data: [65, 59, 80] 
			}
		]
    },
    	
    options: {
    	 responsive: false
        }
});

var ctx = document.getElementById('myChart3').getContext('2d');
var myBarChart2  = new Chart(ctx, {
    type: 'radar', 
    data: {
    	labels: ["1월", "2월", "3월","1월", "2월", "3월","1월", "2월", "3월"],
		datasets: [
			{
				label: "버블 그래프 테스트",
				backgroundColor:["red","green","blue"],
				data: [65, 59, 80,65, 59, 80,65, 59, 80] 
			}
		]
    },
    	
    options: {
    	 responsive: true
        }
});

//차트 정보 입력 후 등록 눌렀을 때
$('#btn_chartCreate').click(function () {
    // getter
    var chartType = $('input[name="chart"]:checked').val();
    var x1 = document.getElementById('x1').value;
    var x2 = document.getElementById('x2').value;
    var x3 = document.getElementById('x3').value;
    var x4 = document.getElementById('x4').value;
    var y1 = document.getElementById('y1').value;
    var y2 = document.getElementById('y2').value;
    var y3 = document.getElementById('y3').value;
    var y4 = document.getElementById('y4').value;
    var chartName = document.getElementById('chartName').value;


    var ctx = document.getElementById('myChart1').getContext('2d');
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

    
  });
});
</script>
<div class=" row col-md-offset-1" style="position: relative; height:30vh; width:60vw"><br>
<!-- 차트 등록 버튼 시작 -->
<button type="button" data-toggle="modal" class="btn btn-default item-space" style="width:200px; height:200px" data-target="#modal_createChart">
  <i class="fas fa-plus-circle" style="color:rgb(92,209,229); font-size:50px"></i>
 <br><br> <h4><strong>차트 생성하기</strong></h4>
</button>
<!-- 차트 등록 버튼 끝 -->

<!-- 차트 등록 시작 -->
<button type="button" id="btn_myChart1" data-toggle="modal" class="btn btn-default item-space" style="width:330px; height:200px" data-target="#modal_myChart1">
<canvas id="myChart1" ></canvas> 
 <h4><strong>나의 차트1</strong></h4>
</button>
<!-- 차트 등록 끝 -->

<!-- 차트 등록 시작 -->
<button type="button" id="btn_myChart2" data-toggle="modal" class="btn btn-default" style="width:330px; height:200px" data-target="#myModal">
<canvas id="myChart2" ></canvas> 
 <h4><strong>나의 차트2</strong></h4>
</button>
<!-- 차트 등록 끝 -->
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
          <h3>차트 종류 선택</h3>
          <div class="btn-group" data-toggle="buttons">
          
          <label class="btn btn-default item-space" style="width:150px; height:150px"><br>
		  <img src="image/bar-chart.png" style=" width: 50px; height: auto"><br><br>
		  <input type="radio" name="chart" id="barChart" autocomplete="off" checked value="bar"><strong>막대형 차트</strong>
			</label>
			
			<label class="btn btn-default item-space" style="width:150px; height:150px"><br>
		  <img src="image/pie-chart.png" style=" width: 50px; height: auto"><br><br>
		  <input type="radio" name="chart" id="pieChart" autocomplete="off" checked value="doughnut"><strong>도넛형 차트</strong>
			</label>

			<label class="btn btn-default item-space" style="width:150px; height:150px"><br>
		  <img src="image/line-chart.png" style=" width: 50px; height: auto"><br><br>
		  <input type="radio" name="chart" id="lineChart" autocomplete="off" checked value="line"><strong>선형 차트</strong>
			</label>
 
			<label class="btn btn-default item-space" style="width:150px; height:150px"><br>
		  	<img src="image/radar_chart.png" style=" width: 50px; height: auto"><br><br>
		  <input type="radio" name="chart" id="bubbleChart" autocomplete="off" checked value="radar"><strong>방사형 차트</strong>
			</label></div><br>
		
			 <h3>데이터 입력</h3>
			 <h4>X축 (항목명 또는 값)</h4>
			 <textarea class="item-space" id="x1" style="width:80px; height:50px; font-size:30px; resize:none"></textarea>		
			 <textarea class="item-space" id="x2" style="width:80px; height:50px; font-size:30px; resize:none"></textarea>			
			 <textarea class="item-space" id="x3" style="width:80px; height:50px; font-size:30px; resize:none"></textarea>			
			 <textarea id="x4" style="width:80px; height:50px; font-size:30px; resize: none"></textarea><br>			
			 <h4>Y축 (값)</h4>
			 <textarea class="item-space" id="y1" style="width:80px; height:50px; font-size:30px; resize:none"></textarea>		
			 <textarea class="item-space" id="y2" style="width:80px; height:50px; font-size:30px; resize:none"></textarea>		
			 <textarea class="item-space" id="y3" style="width:80px; height:50px; font-size:30px; resize:none"></textarea>		
			 <textarea id="y4" style="width:80px; height:50px; font-size:30px; resize:none"></textarea><br>
			 <h3>차트 제목</h3>
			 <textarea id="chartName" style="width:500px; height:50px; font-size:30px; resize:none"></textarea><br><br>			
          <button type="button" class="btn btn-primary btn-lg item-space" id="btn_chartCreate" data-dismiss="modal" >등록</button>
          <button type="button" class="btn btn-dark btn-lg" data-dismiss="modal" style="background-color:#8C8C8C">취소</button>
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