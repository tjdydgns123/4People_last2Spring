<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.3/FileSaver.min.js"></script>
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
/* 차트 등록 */
function chartSave(){
	//폼 전송 처리함.
	$("#form_chartIns").attr("method", "POST");
	$("#form_chartIns").attr("action", "chartIns");
	$("#form_chartIns").submit();
}
</script>
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
	<c:forEach items="${chartList}" var="arr">
		arr_label.push("${arr.label}");
		arr_chartname.push("${arr.chartname}");
		arr_charttype.push("${arr.charttype}");
		arr_data.push("${arr.data}");
		arr_no.push("${arr.no}");
	</c:forEach>
	//배열에 있는 값 for문 돌면서 한개씩 꺼내서 화면에 뿌림
	for(var i=0; i<${chartList.size()}; i++){
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
	    				backgroundColor:["red","orange","yellow","green"], 
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
	//임의 차트 버튼 누르면 상세보여줌
	$("button[name = 'btn_myChart']").click(function(){
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
	//삭제 버튼 누르면 삭제하기
	$("#btn_chartDel").click(function(){
		if (confirm("삭제 하시겠습니까?") == true){    //확인
			location.href="chartDel?mem_id=" + mem_id + "&no=" + selectChartNo;
		}else{   //취소
			return false;
		}
	});
	//차트 수정
	$("#btn_chartUpd").click(function(){
		var x= $("#x1_1").val()+","+$("#x2_1").val()+","+$("#x3_1").val()+","+$("#x4_1").val();
		var y= $("#y1_1").val()+","+$("#y2_1").val()+","+$("#y3_1").val()+","+$("#y4_1").val();
		location.href="chartUpd?mem_id=" + mem_id + "&no=" + selectChartNo + "&label=" + x + "&data=" + y;
	});
	//이미지 저장
	$("#btn_imageSave").click(function() {
 	    $("#chartDetail").get(0).toBlob(function(blob) {
    		saveAs(blob, selectChartNo+".png");
		}); 
});
});	
</script>
<div class=" row col-md-offset-1" style="position: relative; height:30vh; width:95vw"><br>
<!-- 차트 등록 버튼 시작 -->
<button type="button" data-toggle="modal" class="btn btn-default item-space" style="width:200px; height:200px" data-target="#modal_createChart">
  <i class="fas fa-plus-circle" style="color:rgb(92,209,229); font-size:50px"></i>
 <br><br> <h4><strong>차트 생성하기</strong></h4>
</button>
<!-- 차트 등록 버튼 끝 -->

<!-- 차트 리스트 자동생성 버튼 시작  forEach 돌면서 DB에 저장된 차트 갯수만큼 버튼 만들어줌.-->
<c:forEach items="${chartList}" var="chartList">
<button type="button" id="btn_myChart${chartList.no}" name="btn_myChart" data-toggle="modal" class="btn btn-default item-space" style="width:330px; height:200px" data-target="#modal_myChartView" 
value="${chartList.mem_id}+${chartList.no}+${chartList.chartname}+${chartList.charttype}+${chartList.label}+${chartList.data}">
<!-- 스크립트문에서 이 넘버와 일치하는 차트 생성됨-->
<canvas id="${chartList.no}" ></canvas> 
 <h4><strong>${chartList.chartname}</strong></h4>
</button>
</c:forEach>
<!-- 차트 리스트 자동생성 버튼 끝 -->
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
          <!-- 사용자 아이디 히든타입에 담음 -->
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
          <button type="button" class="btn btn-primary btn-lg item-space" id="btn_chartCreate" data-dismiss="modal" onClick="chartSave()">등록</button>
          <button type="button" class="btn btn-dark btn-lg" data-dismiss="modal" style="background-color:#8C8C8C">취소</button>
          </form>
			</div> 
    </div>
			<div class="modal-footer"></div>
  </div></div></div>
  <!-- 차트 등록 Modal 끝-->
  <!-- 차트보기 선택 Modal 시작-->
  <div class="modal fade" id="modal_myChartView" role="dialog" style="width:'500px'; height:'auto'">
    <div class="modal-dialog modal-lg">
      <!-- Modal content--> 
      <div class="modal-content" style="background-color:#D9D9D9">
        <div class="modal-header" style="background-color:#D9D9D9">
          <button type="button" class="close" data-dismiss="modal">X</button>
          <h3 class="modal-title" align="center"><strong>차트 상세 보기</strong></h3>
        </div>
        <div class="modal-body" style="background-color:#D9D9D9">
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
			<button type="button" id="btn_imageSave" class="btn btn-secondary btn-lg" style="background-color:#D9D9D9">
			<i class="fas fa-save" style="font-size:50px"></i><br>
			<strong>저장</strong></button>
			</div> 
    </div>
			<div class="modal-footer"></div>
  </div></div></div>
  <!-- 차트보기 선택  Modal 끝-->
  <!-- 차트 수정 Modal 시작 -->
  <div class="modal fade" id="modal_editChart" role="dialog">
    <div class="modal-dialog"> 
      <!-- Modal content-->
      <div class="modal-content" style="background-color:#D9D9D9">
        <div class="modal-header" style="background-color:#D9D9D9">
          <button type="button" class="close" data-dismiss="modal">X</button>
          <h3 class="modal-title" align="center"><strong>차트 수정하기</strong></h3> 
        </div>
        <div class="modal-body" style="background-color:#D9D9D9">
          <div class="col-md-12 text-center" style="background-color:#D9D9D9">
			 <h3>[데이터 입력]</h3> 
			 <h4>X축 (항목명 또는 값)</h4>
			 <textarea class="item-space" id="x1_1" name="label" style="width:80px; height:50px; font-size:30px; resize:none"></textarea>		
			 <textarea class="item-space" id="x2_1" name="label" style="width:80px; height:50px; font-size:30px; resize:none"></textarea>			
			 <textarea class="item-space" id="x3_1" name="label" style="width:80px; height:50px; font-size:30px; resize:none"></textarea>			
			 <textarea id="x4_1" name="label" style="width:80px; height:50px; font-size:30px; resize: none"></textarea><br>			
			 <h4>Y축 (값)</h4>
			 <textarea class="item-space" id="y1_1" name="data" style="width:80px; height:50px; font-size:30px; resize:none"></textarea>		
			 <textarea class="item-space" id="y2_1" name="data" style="width:80px; height:50px; font-size:30px; resize:none"></textarea>		
			 <textarea class="item-space" id="y3_1" name="data" style="width:80px; height:50px; font-size:30px; resize:none"></textarea>		
			 <textarea id="y4_1" name="data" style="width:80px; height:50px; font-size:30px; resize:none"></textarea><br>
          <button type="button" class="btn btn-primary btn-lg item-space" id="btn_chartUpd" data-dismiss="modal" onClick="chartUpdate()">수정</button>
          <button type="button" class="btn btn-dark btn-lg" data-dismiss="modal" style="background-color:#8C8C8C">취소</button>
			</div> 
    </div>
			<div class="modal-footer"></div>
  </div></div></div>
  <!-- 차트 수정 Modal 끝 -->
</body>
</html>