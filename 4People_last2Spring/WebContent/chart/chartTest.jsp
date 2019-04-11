<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<jsp:include page="../include/top.jsp"  flush="false">
		<jsp:param value="" name="top" />
	</jsp:include> 
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

</head>
<body>

<script type="text/javascript">	
$(document).ready(function(){
  $('#aaa').on('click', function () {
	  var ctx = document.getElementById('myChart').getContext('2d');

	//For a pie chart
	var myBarChart  = new Chart(ctx, {
	    type: 'bar',
	    data: {
	    	labels: ["1월", "2월", "3월"],
			datasets: [
				{
					label: "막대 그래프 테스트",
					fillColor: "rgba(150,200,250,0.5)",
					strokeColor: "rgba(150,200,250,0.8)",
					highlightFill: "rgba(150,200,250,0.75)",
					highlightStroke: "rgba(150,200,250,1)",
					data: [65, 59, 80] 
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

<div class="btn-group" data-toggle="buttons">
  <label class="btn btn-secondary active">
  <i class="fas fa-chart-bar" style="font-size:50px"></i><br>
    <input type="radio" name="options" id="option1" autocomplete="off" checked> 라디오 1 (기본선택)
  </label>
  <label class="btn btn-secondary">
  <i class="fas fa-chart-bar" style="font-size:50px"></i><br>
    <input type="radio" name="options" id="option2" autocomplete="off"> 라디오 2
  </label>
  <label class="btn btn-secondary">
  <i class="fas fa-chart-bar" style="font-size:50px"></i><br>
    <input type="radio" name="options" id="option3" autocomplete="off"> 라디오 3
  </label>
</div>


<div class="container" style="position: relative; height:40vh; width:80vw">
<button type="button" style="width:500px; height:300px" class="btn btn-default" id="aaa">
<canvas id="myChart" ></canvas>
버튼</button>

<button type="button" class="btn btn-secondary btn-lg item-space" data-dismiss="modal">
			<i class="fas fa-edit" style="font-size:50px"></i><br>
			삭제</button>
			<button type="button" class="btn btn-secondary btn-lg item-space" data-dismiss="modal">
			<i class="far fa-edit" style="font-size:50px"></i><br>
			수정</button>

</div> 
</body>