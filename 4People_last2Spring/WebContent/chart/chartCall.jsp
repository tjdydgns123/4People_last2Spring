<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.vo.ChartVO, java.util.Map, java.util.List, java.util.Iterator, java.util.ArrayList" %>
<%
	List<ChartVO> chartCall = (List<ChartVO>)request.getAttribute("chartCall");
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
$(document).ready(function(){
	//DB의 차트 테이블 값 담을 배열 선언 
	var arr_label = new Array();
	var arr_chartname = new Array();
	var arr_charttype = new Array();
	var arr_data = new Array();
	var arr_no = new Array();
	//배열에 차트 테이블 값 담음
	<c:forEach items="${chartCall}" var="arr">
		arr_label.push("${arr.label}");
		arr_chartname.push("${arr.chartname}");
		arr_charttype.push("${arr.charttype}");
		arr_data.push("${arr.data}");
		arr_no.push("${arr.no}");
	</c:forEach>
	//배열에 있는 값 for문 돌면서 한개씩 꺼내서 화면에 뿌림
	for(var i=0; i<${chartCall.size()}; i++){
		//차트 타입 담는 변수
 		var chartType = arr_charttype[i]; 
		//차트 라벨(값) 담는 변수
	    var v_x = arr_label[i];   
	    //콤마로 구분된 문자값 자름..
	    var tokens_x = v_x.split(',');
	    var x1 = tokens_x[0];  
	    var x2 = tokens_x[1];  
	    var x3 = tokens_x[2];  
	    var x4 = tokens_x[3]; 
	  	//차트 데이터 (수치) 담는 변수
	    var v_y = arr_data[i];
	  	//콤마로 구분된 문자값 자름
	    var tokens_y = v_y.split(',');  
	    var y1 = tokens_y[0];   
	    var y2 = tokens_y[1];   
	    var y3 = tokens_y[2];   
	    var y4 = tokens_y[3];  
	    //차트 이름 담는 변수
	    var chartName = arr_chartname[i];
		//차트 넘버 로 구분하여 생성 시작
	    var ctx = document.getElementById(arr_no[i]).getContext('2d'); 
	    var myChart  = new Chart(ctx, {
	        type: chartType,
	        data: {
	        	labels: [x1, x2, x3, x4],
	    		datasets: [
	    			{
	    				label:chartName, 
	    				backgroundColor:["red","orange","yellow","green","blue","purple","grey"],
	    				data: [y1, y2, y3, y4] 
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
	}
// 	//임의 차트 버튼 누르면 상세보여줌
// 	$("button[name = 'btn_myChart']").click(function(){
// 		//클릭한 차트의 전체 값 나열
// 		var sel_chart = $(this).attr('value');
// 		//차트 값 플러스 구분자로 자르기
// 		var tokens = sel_chart.split('+');
// 		mem_id = tokens[0];
// 		selectChartNo = tokens[1];
// 		var chartName = tokens[2];
// 		var chartType = tokens[3];
// 		var label = tokens[4];
// 		//값 다시 자르기
// 		var tokens_label = label.split(',');
// 		var x1 = tokens_label[0];
// 		var x2 = tokens_label[1];
// 		var x3 = tokens_label[2];
// 		var x4 = tokens_label[3];
// 		var data = tokens[5];
// 		var tokens_data = data.split(',');
// 		var y1 = tokens_data[0];
// 		var y2 = tokens_data[1];
// 		var y3 = tokens_data[2];
// 		var y4 = tokens_data[3];
		
// 		var ctx = document.getElementById('chartDetail').getContext('2d');
// 		var myChart  = new Chart(ctx, {
// 	        type: chartType,
// 	        data: {
// 	        	labels: [x1, x2, x3, x4],
// 	    		datasets: [
// 	    			{
// 	    				label:chartName, 
// 	    				backgroundColor:["red","orange","yellow","green","blue","purple","grey"],
// 	    				data: [y1, y2, y3, y4] 
// 	    			}
// 	    		]
// 	        },
// 		    options: {
// 		    	legend: {
// 			        // 이 값이 false일때 차트 크기 작게 조정됨. true일때는 차트 크기 크게 보임.
// 		        	 responsive: true,
// 		        	 //상단 타이틀 부분 안보이게 함.
// 		                 //display: false
// 	                labels: {
// 	                fontSize: 30,
// 	                fontColor:"blacks" 
// 	            		}
// 		         },
//              scales: { //X,Y축 옵션
//                  yAxes: [{
//                      ticks: {
//                          beginAtZero:true,  //Y축의 값이 0부터 시작
//                          fontColor:"black",
//                          fontStyle:"bold",
//                          fontSize:20
//                      }
//                  }],
//                  xAxes: [{
//                 	 ticks: {
//                 	 fontColor:"black",
//                 	 fontStyle:"bold", 
//                 	 fontSize:20 
//                 	 }
//                  }]
//             	}
// 		        }
// 		});

});
</script>
<!-- 차트 리스트 자동생성 버튼 시작  forEach 돌면서 DB에 저장된 차트 갯수만큼 버튼 만들어줌.-->
<c:forEach items="${chartCall}" var="chartCall">
<button type="button" id="btn_myChart${chartCall.no}" name="btn_myChart" data-toggle="modal" class="btn btn-default item-space" style="width:330px; height:200px" data-target="#modal_myChartView" 
value="${chartCall.mem_id}+${chartCall.no}+${chartCall.chartname}+${chartCall.charttype}+${chartCall.label}+${chartCall.data}">
<!-- 스크립트문에서 이 넘버와 일치하는 차트 생성됨-->
<canvas id="${chartCall.no}" ></canvas> 
 <h4><strong>${chartCall.chartname}</strong></h4>
</button>
</c:forEach>
<!-- 차트 리스트 자동생성 버튼 끝 -->
</body>
</html>