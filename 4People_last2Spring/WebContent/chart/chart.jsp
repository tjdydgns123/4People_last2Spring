<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.3/FileSaver.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-colorschemes@latest/dist/chartjs-plugin-colorschemes.min.js"></script>
<script src="https://unpkg.com/chartjs-plugin-colorschemes@latest/dist/chartjs-plugin-colorschemes.min.js"></script>
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
/* 추가 버튼 간격 주기 */
.addItem-space {
    margin-right: 30px;
}
</style>
<script type="text/javascript">
//차트 등록
function chartSave(){
	//라벨 각 값에 큰 따옴표 붙이기
	 var label_size = $("#form_chartIns textarea[name = 'label']").length;
     for(i=0;i<label_size;i++){
         var string = $("#form_chartIns textarea[name = 'label']").eq(i).val();
         var replacedString = string.replace(string, '"'+string+'"');
         console.log(replacedString);
         $("#form_chartIns textarea[name = 'label']").eq(i).val(replacedString);
     }
	////데이터 각 값에 큰 따옴표 붙이기
     var data_size = $("#form_chartIns textarea[name = 'data']").length;
     for(i=0;i<data_size;i++){
         var string = $("#form_chartIns textarea[name = 'data']").eq(i).val();
         var replacedString = string.replace(string, '"'+string+'"');
         console.log(replacedString);
         $("#form_chartIns textarea[name = 'data']").eq(i).val(replacedString);
     }
	//폼 전송 처리함.
	$("#form_chartIns").attr("method", "POST");
	$("#form_chartIns").attr("action", "chartIns");
	$("#form_chartIns").submit();
}
function textarea_add() {  //innerHTML+= 
    document.getElementById('btn_x').innerHTML += '<textarea class="item-space" id="x5" name="label" style="width:80px; height:50px; font-size:30px; resize:none">'; 
    document.getElementById('btn_y').innerHTML += '<textarea class="item-space" id="y5" name="data" style="width:80px; height:50px; font-size:30px; resize:none">'; 
}
function textarea_add2() {  //innerHTML+= 
    document.getElementById('btn_x2').innerHTML += '<textarea class="item-space" id="x5" name="label" style="width:80px; height:50px; font-size:30px; resize:none">'; 
    document.getElementById('btn_y2').innerHTML += '<textarea class="item-space" id="y5" name="data" style="width:80px; height:50px; font-size:30px; resize:none">'; 
}
 
</script>
</head>
<body>
<script type="text/javascript">
//선택된 차트 번호, 사용자 아이디를 전역변수로 선언
	var selectChartNo;
	var mem_id;
	var myChart2;
$(document).ready(function(){
		//차트 넘버 로 구분하여 생성 시작
	   <c:forEach var="data" items="${chartList}">
	    var ctx = document.getElementById("${data.no}").getContext('2d'); 
	    var myChart1  = new Chart(ctx, {
	        type: "${data.charttype}", 
	        data: {
	        	labels:  
		        	[${data.label}],   
	    		datasets: [
	    			{
	    				label:"${data.chartname}", 
	    				backgroundColor:["red","orange","yellow","green","blue"],  
	    				data: [${data.data}]    
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
	    </c:forEach>
	//}
	//임의 차트 버튼 누르면 상세보여줌
	$("button[name = 'btn_myChart']").click(function(){
		 
		//클릭한 차트의 전체 값 나열
		selectChartNo = $(this).attr('value');
		console.log(selectChartNo);
		$.ajax({
			type:"GET",
			url:"chartDetail?no="+selectChartNo,
			data : selectChartNo,
			dataType:"HTML",
			success : function(result) {
			//통신이 성공적으로 이루어졌을 때 처리하고 싶은 함수
				$('#modal_myChartView').append(result);
			},
			complete : function(result){
			//통신이 실패했어도 완료가 되었을 때 처리하고 싶은 함수
			},
			error : function(xhr, status, error) {
			//에러가 발생했을 때 처리하고 싶은 함수
			alert("error");    //경고창 띄움
			} 
			});
		
		
		
});
	$("#btn_chartUpd").click(function(){
	//라벨 각 값에 큰 따옴표 붙이기
		 var label_size = $("#form_chartUpd textarea[name = 'label']").length;
	     for(i=0;i<label_size;i++){
	         var string = $("#form_chartUpd textarea[name = 'label']").eq(i).val();
	         var replacedString = string.replace(string, '"'+string+'"');
	         $("#form_chartUpd textarea[name = 'label']").eq(i).val(replacedString);
	     }
		////데이터 각 값에 큰 따옴표 붙이기
	     var data_size = $("#form_chartUpd textarea[name = 'data']").length;
	     for(i=0;i<data_size;i++){
	         var string = $("#form_chartUpd textarea[name = 'data']").eq(i).val();
	         var replacedString = string.replace(string, '"'+string+'"');
	         $("#form_chartUpd textarea[name = 'data']").eq(i).val(replacedString);
	     }
	     //no컬럼에 현재 선택된 변수 담기
	     var string = $("#form_chartUpd input[name = 'no']").val();
         var replacedString = string.replace(string, selectChartNo);
	     $("#form_chartUpd input[name = 'no']").val(replacedString);
		//폼 전송 처리함.
		$("#form_chartUpd").attr("method", "POST");
		$("#form_chartUpd").attr("action", "chartUpd");
		$("#form_chartUpd").submit();
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
// 	$("#btn_chartUpd").click(function(){
// 		var x= '"'+$("#x1_1").val()+'"'+","+'"'+$("#x2_1").val()+'"'+","+'"'+$("#x3_1").val()+'"'+","+'"'+$("#x4_1").val()+'"';
// 		var y= '"'+$("#y1_1").val()+'"'+","+'"'+$("#y2_1").val()+'"'+","+'"'+$("#y3_1").val()+'"'+","+'"'+$("#y4_1").val()+'"';
// 		location.href="chartUpd?mem_id=" + mem_id + "&no=" + selectChartNo + "&label=" + x + "&data=" + y;
// 	});
	//이미지 저장
	$("#btn_imageSave").click(function() {
 	    $("#chartDetail").get(0).toBlob(function(blob) {
    		saveAs(blob, selectChartNo+".png");
		}); 
	});
	//차트 상세보기 모달에서 마우스오버하면 이전 차트 보이는 버그 수정
	$('#modal_myChartView').on('hide.bs.modal', function(e){
		myChart2.destroy();
		e.stopImmediatePropagation();
	});
	 
	
});	
</script>
<div class=" row col-md-offset-1" style="position: relative; height:30vh; width:90vw"><br>
<!-- 차트 등록 버튼 시작 -->
<button type="button" data-toggle="modal" class="btn btn-default item-space" style="width:200px; height:200px" data-target="#modal_createChart">
  <i class="fas fa-plus-circle" style="color:rgb(92,209,229); font-size:50px"></i>
 <br><br> <h4><strong>차트 생성하기</strong></h4>
</button>
<!-- 차트 등록 버튼 끝 -->

<!-- 차트 리스트 자동생성 버튼 시작  forEach 돌면서 DB에 저장된 차트 갯수만큼 버튼 만들어줌.-->
	<c:forEach items="${chartList}" var="chartList">
	<button type="button" id="btn_myChart${chartList.no}" name="btn_myChart" data-toggle="modal" class="btn btn-default item-space" style="width:330px; height:200px" data-target="#modal_myChartView" 
	value="${chartList.no}">
	<!-- 스크립트문에서 이 넘버와 일치하는 차트 생성됨-->
	<canvas id="${chartList.no}" ></canvas> 
	 <h4><strong>${chartList.chartname}</strong></h4>
	</button>
	</c:forEach>
<!-- 차트 리스트 자동생성 버튼 끝 -->
</div>
<!-- 차트 등록 Modal 시작-->
  <div class="modal fade" id="modal_createChart" role="dialog" style="width:'500px'" data-backdrop="static">
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
          <input type="hidden" id="mem_id" name="mem_id" value="${mem_id}">
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
			 <h4 class="addItem-space" style="white-space:nowrap;">X축 (항목명 또는 값)
			 <button type="button" class="btn btn-primary btn-lg" id="btn_add" onClick="textarea_add()">추가</button></h4>
			 <span id="btn_x">
			 <textarea class="item-space" id="x1" name="label" style="width:80px; height:50px; font-size:15px; resize:none">재민이</textarea>		
			 <textarea class="item-space" id="x2" name="label" style="width:80px; height:50px; font-size:15px; resize:none">영성이형</textarea>			
			 <textarea class="item-space" id="x3" name="label" style="width:80px; height:50px; font-size:15px; resize:none">윤정이누나</textarea></span>			
			 <textarea id="x4" name="label" style="width:80px; height:50px; font-size:15px; resize: none">슬기누나</textarea><br>			
			 
			 
			 <h4>Y축 (값)</h4>
			 <span id="btn_y">
			 <textarea class="item-space" id="y1" name="data" style="width:80px; height:50px; font-size:15px; resize:none">100</textarea>		
			 <textarea class="item-space" id="y2" name="data" style="width:80px; height:50px; font-size:15px; resize:none">50</textarea>		
			 <textarea class="item-space" id="y3" name="data" style="width:80px; height:50px; font-size:15px; resize:none">80</textarea></span>		
			 <textarea id="y4" name="data" style="width:80px; height:50px; font-size:15px; resize:none">30</textarea><br> 
			 <h3>차트 제목</h3>
			 <textarea id="chartName" name="chartname" style="width:500px; height:50px; font-size:30px; resize:none">나와의 친밀도 ㅎ</textarea><br><br>			
          <button type="button" class="btn btn-primary btn-lg item-space" id="btn_chartCreate" data-dismiss="modal" onClick="chartSave()">등록</button>
          <button type="button" class="btn btn-dark btn-lg" data-dismiss="modal" style="background-color:#8C8C8C">취소</button>
          </form>
			</div> 
    </div>
			<div class="modal-footer"></div>
  </div></div></div>
  <!-- 차트 등록 Modal 끝-->
  <!-- 차트보기 선택 Modal 시작-->
  <div class="modal fade" id="modal_myChartView" role="dialog" style="width:'500px'; height:'auto'" data-backdrop="static">
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
			<button type="button" id="btn_imageSave" class="btn btn-secondary btn-lg" style="background-color:#D9D9D9">
			<i class="fas fa-save" style="font-size:50px"></i><br>
			<strong>저장</strong></button>
			</div> 
    </div>
			<div class="modal-footer"></div>
  </div></div></div>
  <!-- 차트보기 선택  Modal 끝-->
  <!-- 차트 수정 Modal 시작 -->
  <div class="modal fade" id="modal_editChart" role="dialog" data-backdrop="static">
    <div class="modal-dialog"> 
      <!-- Modal content-->
      <div class="modal-content" style="background-color:#D9D9D9">
        <div class="modal-header" style="background-color:#D9D9D9">
          <button type="button" class="close" data-dismiss="modal">X</button>
          <h3 class="modal-title" align="center"><strong>차트 수정하기</strong></h3> 
        </div>
        <div class="modal-body" style="background-color:#D9D9D9">
          <div class="col-md-12 text-center" style="background-color:#D9D9D9">
          <form id="form_chartUpd" method="post">
          <input type="hidden" id="mem_id" name="mem_id" value="${mem_id}">
          <input type="hidden" id="no2" name="no" value="">
			 <h3>[데이터 입력]</h3> 
			 <h4>X축 (항목명 또는 값)
			 <button type="button" class="btn btn-primary btn-lg" id="btn_add" onClick="textarea_add2()">추가</button></h4>
			 <span id="btn_x2">
			 <textarea class="item-space" id="x1_1" name="label" style="width:80px; height:50px; font-size:15px; resize:none">영은이누나</textarea>		
			 <textarea class="item-space" id="x2_1" name="label" style="width:80px; height:50px; font-size:15px; resize:none">영성이형</textarea>			
			 <textarea class="item-space" id="x3_1" name="label" style="width:80px; height:50px; font-size:15px; resize:none">슬기누나</textarea></span>			
			 <textarea id="x4_1" name="label" style="width:80px; height:50px; font-size:15px; resize: none">윤정이누나</textarea><br>			
			 <h4>Y축 (값)</h4>
			 <span id="btn_y2">
			 <textarea class="item-space" id="y1_1" name="data" style="width:80px; height:50px; font-size:15px; resize:none">100</textarea>		
			 <textarea class="item-space" id="y2_1" name="data" style="width:80px; height:50px; font-size:15px; resize:none">100</textarea>		
			 <textarea class="item-space" id="y3_1" name="data" style="width:80px; height:50px; font-size:15px; resize:none">100</textarea></span>		
			 <textarea id="y4_1" name="data" style="width:80px; height:50px; font-size:15px; resize:none">100</textarea><br>
          <button type="button" class="btn btn-primary btn-lg item-space" id="btn_chartUpd" data-dismiss="modal">수정</button>
          <button type="button" class="btn btn-dark btn-lg" data-dismiss="modal" style="background-color:#8C8C8C">취소</button>
          </form>
			</div> 
    </div>
			<div class="modal-footer"></div>
  </div></div></div>
  <!-- 차트 수정 Modal 끝 -->
</body>
</html>

