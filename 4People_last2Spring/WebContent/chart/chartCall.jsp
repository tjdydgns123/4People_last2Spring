<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.vo.ChartVO, java.util.Map, java.util.List, java.util.Iterator, java.util.ArrayList" %>
<%
	List<ChartVO> chartCall = (List<ChartVO>)request.getAttribute("chartCall");

	Cookie chartC = new Cookie("chartC","mem_id=eun@naver.com");
	chartC.setMaxAge(60);
  	response.addCookie(chartC);
  	
%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.3/FileSaver.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
//선택된 차트 번호, 사용자 아이디를 전역변수로 선언
var selectChartNo;
var mem_id;
var myChart2;
$(document).ready(function(){
	//차트 넘버 로 구분하여 생성 시작
    var ctx = document.getElementById('detail').getContext('2d'); 
    var myChart1  = new Chart(ctx, {
        type: "${chartCall.get(0).charttype}", 
        data: {
        	labels:  
	        	[${chartCall.get(0).label}],   
    		datasets: [
    			{
    				label:"${chartCall.get(0).chartname}", 
    				backgroundColor:["red","orange","yellow","green","blue"],  
    				data: [${chartCall.get(0).data}]    
    			}
    		]
            
        },
        options: {
        	 legend: {
	        // 이 값이 false일때 차트 크기 작게 조정됨. true일때는 차트 크기 크게 보임.
        	 responsive: false
        	 //상단 타이틀 부분 안보이게 함.
                 //display: false
                 },
             scales: { //X,Y축 옵션
            	 yAxes: [{
                     ticks: {
                         beginAtZero:true,  //Y축의 값이 0부터 시작
                         fontColor:"blacks"
                     }
                 }],
                 xAxes: [{
                	 ticks: {
                	 fontColor:"blacks"
                	 }
                 }]
          } 
            } 
    });
});

</script>
<h3 id="hth"><img src="../images/description2.png">차트</h3>
<button type="button" data-toggle="modal" class="btn btn-default item-space" style="width:330px; height:200px" data-target="#modal_myChartView">
<canvas id="detail" ></canvas> 
<%--  <h4><strong><%=chartCall.get(0).getChartname() %></strong></h4> --%>
 <h4><strong><%=chartCall.get(0).getChartname() %></strong></h4>
</button>
</body>
</html>