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


<div class="container">
<canvas id="myChart" style="width:50%"></canvas></div>
<script>
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
    	
    options: {}
});


</script>


</body>