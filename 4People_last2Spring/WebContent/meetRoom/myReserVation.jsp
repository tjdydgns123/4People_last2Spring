<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../include/top.jsp" flush="false">
	<jsp:param value="" name="top" />
</jsp:include>
<title>Insert title here</title>
</head>
<body style='background-color:#FFF;'>
<div class='col-sm-12'>
<article class="container" style='margin-top: 20px;'>
 	<div class="alert alert-success alert-dismissable" style='font-size:20px;'>
          <i class="fa fa-id-card"></i>
             내 <strong>예약정보 </strong>페이지 입니다.
        </div>
 
       <div class='row' style='background-color:#B7F0B1; width:100%; height:150px;'>
       		<div class='col-sm-4' style='padding:25px;'>
       			<img src='http://192.168.0.6:9000/4People_last2Spring/pds/vss2026@daum.net은수.png' width='100px' height='100px'>
       			<span style='font-size:20px; font-weight:bold; color:#FFF;'>김은수</span>
       		</div>
       		
       		<div class='col-sm-2'>
       		</div>
       		
       		<div class='col-sm-2'>
       		</div>
       		
       		<div class='col-sm-2'>
       		</div>
       		
       		<div class='col-sm-2'>
       		</div>
       </div> 
        
        
        
        
        
        
        
      <table style='width:100%; margin-top:40px;' >
      	<thead>
      		<tr>
		      <th scope="col">예약일</th>
		      <th scope="col">회의장소</th>
		      <th scope="col">소속</th>
		      <th scope="col">참여인원</th>
		      <th scope="col">이용날짜</th>
		      <th scope="col">이용시간</th>
		      <th scope="col">예약취소</th>
		    </tr>
      	</thead>
      	<tbody>
      		<tr>
      			<td>2019-04-12</td>
      			<td>아토피아 회의실</td>
      			<td>개발 1팀</td>
      			<td>honey컴퍼니</td>
      			<td>12명</td>
      			<td>2019-04-13</td>
      			<td>08:00~12:00</td>
      		</tr>
      	</tbody>
      </table> 
        
</article>
 </div>
</body>
</html>