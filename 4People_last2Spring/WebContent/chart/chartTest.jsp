<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<!-- //기본적으로 필요한 자바스크립트 -->

<script type="text/javascript" src="/public/common/js/common.js"></script>
<script type="text/javascript" src="/public/common/js/jquery-1.10.2.min.js" /></script>
<script type="text/javascript" src="/public/front/plugin/chartjs/Chart.js"></script>





<!-- //레전드 사용시 아래의 css추가 -->

<style type="text/css"> 

 .legend { 
  width: 10em; 
  border: 1px solid black; 
    width: 10em; 
    border: 1px solid black; 
  }
   
  .legend .title { 
      display: block; 
      margin: 0.5em; 
      border-style: solid; 
      border-width: 0 0 0 1em; 
      padding: 0 0.3em; 
}
.chart-legend li span{
    display: inline-block;
    width: 12px;
    height: 12px;
    margin-right: 5px;
}



</style>
</head>



<script type="text/javascript">

//예시 라인 차트 (jstl은 동적으로 뿌리기 위함.)
 
$(document).ready(function() {  
        
    
   
        var chartData = {
            
        labels : ${labelList},
        datasets : [
             

       <c:forEach var="data" items="${dataList}" varStatus="i">
       <c:if test="${i.index > 0}">,</c:if>
       {
        
           label: "${data.processName}", 
           fillColor : "rgba(${data.color},0.5)",
           strokeColor : "rgba( ${data.color},0.8)",           
           pointColor:   "rgba(${data.color},7.5)",
                    pointStrokeColor:   "rgba(${data.color},1)",
                    color: "rgba(${data.color},0.5)", //레전드 컬러값 추가
                    pointHighlightFill: "#fff",
                    pointHighlightStroke: "#fff",
                    data : ${data.statiList},
             
          }
         
       </c:forEach>
     
      
           ]};
     
     
        window.onload = function(){
         
        var ctx = document.getElementById("canvas").getContext("2d");           
        var myLineChart = new Chart(ctx).Line(chartData, 
         {
          responsive : true,
          showInLegend: true,
          
         });
  
          document.getElementById("legendDiv").innerHTML = myLineChart.generateLegend(); 

         //레전트 생성
        };
        
       }); 
       

  </script>

</head>
<body>  

  <div id="chart-area" >
   <canvas id="canvas"></canvas>  
  </div>
 <div id="legendDiv"  class="chart-legend"></div>
</body>
</html>

