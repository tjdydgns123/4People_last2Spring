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
</head>
<body>
<script type="text/javascript">


</script>
<canvas id="myChart"></canvas>
<!-- 차트 등록 버튼 시작 -->
<button type="button" id="myButton" data-toggle="modal" class="btn btn-default" style="width:200px; height:200px" data-target="#myModal">
  <i class="fas fa-plus-circle" style="color:rgb(92,209,229); font-size:50px"></i>
 <br><br> <h4><strong>차트 생성하기</strong></h4>
</button>
<!-- 차트 등록 버튼 끝 -->

<!-- Modal 시작-->
  <div class="modal fade" id="myModal" role="dialog" style="width:'500px'">
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content" style="background-color:#D9D9D9">
        <div class="modal-header" style="background-color:#D9D9D9">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h3 class="modal-title" align="center"><strong>새 차트 등록하기</strong></h3>
        </div>
        <div class="modal-body" style="background-color:#D9D9D9">
          <div class="col-md-12 text-center" style="background-color:#D9D9D9">
          <h3>차트 종류 선택</h3>
          <div class="btn-group" data-toggle="buttons">
          
          <label class="btn btn-default item-space" style="width:150px; height:150px"><br>
		  <i class="fas fa-chart-bar" style="font-size:50px"></i><br><br>
		  <input type="radio" name="options" id="option1" autocomplete="off" checked><strong>막대 그래프</strong>
			</label>
			
			<label class="btn btn-default item-space" style="width:150px; height:150px"><br>
		  <i class="fas fa-chart-pie" style="font-size:50px"></i><br><br>
		  <input type="radio" name="options" id="option2" autocomplete="off" checked><strong>원형 그래프</strong>
			</label>

			<label class="btn btn-default item-space" style="width:150px; height:150px"><br>
		  <i class="fas fa-chart-line" style="font-size:50px"></i><br><br>
		  <input type="radio" name="options" id="option3" autocomplete="off" checked><strong>선형 그래프</strong>
			</label>
 
			<label class="btn btn-default item-space" style="width:150px; height:150px"><br>
		  	<img src="image/bubble_chart.png" style=" width: 50px; height: auto"><br><br>
		  <input type="radio" name="options" id="option4" autocomplete="off" checked><strong>버블 그래프</strong>
			</label></div><br>
		
			 <h3>데이터 입력</h3>
			 <h4>X축 (항목명 또는 값)</h4>
			 <textarea class="item-space" style="width:80px"></textarea>		
			 <textarea class="item-space" style="width:80px"></textarea>			
			 <textarea class="item-space" style="width:80px"></textarea>			
			 <textarea style="width:80px"></textarea><br>			
			 <h4>Y축 (값)</h4>
			 <textarea class="item-space" style="width:80px"></textarea>		
			 <textarea class="item-space" style="width:80px"></textarea>		
			 <textarea class="item-space" style="width:80px"></textarea>		
			 <textarea style="width:80px"></textarea><br>
			 <h3>차트 제목</h3>
			 <textarea style="width:500px"></textarea><br><br>			
          <button type="button" class="btn btn-primary btn-lg" data-dismiss="modal">등록</button>&nbsp;&nbsp;&nbsp;
          <button type="button" class="btn btn-dark btn-lg" data-dismiss="modal" style="background-color:#8C8C8C">취소</button>
			</div> 
    </div>
			<div class="modal-footer"></div>
  </div></div></div>
  <!-- Modal 끝-->

</body>