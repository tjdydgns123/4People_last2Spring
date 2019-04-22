<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.3/FileSaver.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-colorschemes@latest/dist/chartjs-plugin-colorschemes.min.js"></script>
<script src="https://unpkg.com/chartjs-plugin-colorschemes@latest/dist/chartjs-plugin-colorschemes.min.js"></script>
<meta charset="UTF-8">
<script type="text/javascript">
$(document).ready(function(){
var ctx = document.getElementById('chartDetail').getContext('2d');
myChart2  = new Chart(ctx, {
    type: "${chartDetail.charttype}",
    data: {
    	labels: [${chartDetail.label}],
		datasets: [
			{
				label:"${chartDetail.chartname}", 
				backgroundColor:["red","orange","yellow","green","blue"],
				data: [${chartDetail.data}]
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
                 beginAtZero:true,  //Y축의 값이 0부터 시작
                 fontColor:"black",
                 fontStyle:"bold",
                 fontSize:20
             } 
         }],
         xAxes: [{
        	 ticks: {
        	 fontColor:"black",
        	 fontStyle:"bold", 
        	 fontSize:20 
        	 }
         }]
    	}
        }
});
});
</script>
<body>
<canvas id="chartDetail" ></canvas>  
</body>

