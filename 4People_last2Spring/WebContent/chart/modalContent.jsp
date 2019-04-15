<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script> 
<meta charset="UTF-8">
<%@ include file="../common/common.jsp" %>
<title>Insert title here</title>

</head>
<body>
<script type="text/javascript">

function test(){
	

	//차트보기 버튼 클릭시 동작

			console.log("나는 본 페이지");
			//클릭한 차트의 전체 값 나열
			var sel_chart = $(this).attr('value');
			//차트 값 플러스 구분자로 자르기
			var tokens = sel_chart.split('+');
			mem_id = tokens[0];
			selectChartNo = tokens[1];
			var chartName = tokens[2];
			var chartType = tokens[3];
			var label = tokens[4];
			//값 다시 자르기
			var tokens_label = label.split(',');
			var x1 = tokens_label[0];
			var x2 = tokens_label[1];
			var x3 = tokens_label[2];
			var x4 = tokens_label[3];
			var data = tokens[5];
			var tokens_data = data.split(',');
			var y1 = tokens_data[0];
			var y2 = tokens_data[1];
			var y3 = tokens_data[2];
			var y4 = tokens_data[3];
			
			var ctx = document.getElementById('chartDetail').getContext('2d');
			var myChart  = new Chart(ctx, {
		        type: chartType,
		        data: {
		        	labels: [x1, x2, x3, x4],
		    		datasets: [
		    			{
		    				label:chartName, 
		    				backgroundColor:["red","orange","yellow","green"],
		    				data: [y1, y2, y3, y4] 
		    			}
		    		]
		        },
			    options: {
			    	legend: {
				        // 이 값이 false일때 차트 크기 작게 조정됨. true일때는 차트 크기 크게 보임.
			        	 responsive: true,
			        	 //상단 타이틀 부분 안보이게 함.
			                 //display: false
		                labels: {
		                fontSize: 30,
		                fontColor:"blacks" 
		            		}
			         },
	               scales: { //X,Y축 옵션
	                   yAxes: [{
	                       ticks: {
	                           beginAtZero:true  //Y축의 값이 0부터 시작
	                       }
	                   }]
	              	}
			        }
			});

			
	}
</script>
<div class="col-md-12 text-center" style="background-color:#D9D9D9">
	<canvas id="chartDetail" ></canvas> 
	<button type="button" id="btn_chartDel" class="btn btn-secondary btn-lg item-space" data-dismiss="modal" style="background-color:#D9D9D9"> 
	<i class="fas fa-trash-alt" style="font-size:50px"></i><br>
	<strong>삭제</strong></button>
	<button type="button" class="btn btn-secondary btn-lg item-space" data-toggle="modal" style="background-color:#D9D9D9" data-target="#modal_editChart">
	<i class="fas fa-edit" style="font-size:50px"></i><br>
	<strong>수정</strong></button>
	<button type="button" class="btn btn-secondary btn-lg item-space" data-dismiss="modal" style="background-color:#D9D9D9">
	<i class="fas fa-copy" style="font-size:50px"></i><br>
	<strong>복사</strong></button>
	<button type="button" class="btn btn-secondary btn-lg" data-dismiss="modal" style="background-color:#D9D9D9">
	<i class="fas fa-save" style="font-size:50px"></i><br> 
	<strong>저장</strong></button>
	</div>
	<script type="text/javascript">
	console.log("나는 모달");
	
	</script>
</body>
</html>