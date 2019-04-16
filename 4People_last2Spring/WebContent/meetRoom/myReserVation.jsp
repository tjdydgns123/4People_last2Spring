<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import='java.util.*' %>    
    
<%
   Map<String, Object> sizes = (Map<String, Object>)request.getAttribute("sizes");
	int afterSize = (Integer)sizes.get("after");
	int beforeSize = (Integer)sizes.get("before");
	int hapSize = afterSize+beforeSize;
	String mem_name = (String)session.getAttribute("MEM_NAME");
	String mem_image = (String)session.getAttribute("MEM_IMAGE");
	String imagePath="http://192.168.0.6:9000/4People_last2Spring/pds/"+mem_image;
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../include/top.jsp" flush="false">
	<jsp:param value="" name="top" />
</jsp:include>
<title>Insert title here</title>
<style type="text/css">
th {
        text-align: center;
      }

</style>


<script type="text/javascript">
	
	

	function afterDate(){
		$.ajax({
			 type:'POST'
			 ,url:'./afterDate'
			 ,dataType:'html'
			 ,success:function(data){
				 $('#t_reservation').html(data);
			 }
		 	 ,error:function(e){
		 		 
		 	 }
		});
	}
	function beforeDate(){
		$.ajax({
			 type:'POST'
			 ,url:'./beforeDate'
			 ,dataType:'html'
			 ,success:function(data){
				 
			 }
		 	 ,error:function(e){
		 		 
		 	 }
		});

	}
	function hapDate(){
		$.ajax({
			 type:'POST'
			 ,url:'./hapDate'
			 ,dataType:'html'
			 ,success:function(data){
				 $('#t_reservation').html(data);
			 }
		 	 ,error:function(e){
		 		 
		 	 }
		});

	}
	function reservationCancel(id){
		
		$.ajax({
			 type:'POST'
			 ,url:'./hapDate'
			 ,dataType:'html'
			 ,success:function(data){
				
			 }
		 	 ,error:function(e){
		 		 
		 	 }
		});
		
		}
	
</script>


</head>
<body style='background-color:#FFF;'>
<div class='col-sm-12'>
<article class="container" style='margin-top: 20px;'>
 	<div class="alert alert-success alert-dismissable" style='font-size:20px;'>
          <i class="fa fa-id-card"></i>
             내 <strong>예약정보 </strong>페이지 입니다.
        </div>
 
       <div class='row' style='background-color:#B7F0B1; width:100%; height:150px; margin:0;'>
       		<div class='col-sm-3' style='padding:25px;'>
       			<img src='<%=imagePath %>' width='100px' height='100px'>
       			<span style='font-size:30px; font-weight:bold; color:#FFF;'>&nbsp;<%=mem_name %></span>
       		</div>
       		
       		<div class='col-sm-3' style='padding:20px;'>
       			<a href='javascript:hapDate()'>
       			<div class='text-center' style='font-size:25px; font-weight:bold;'><%="종합( "+hapSize+" )"%><br>
       				<img src='../images/myReservation1.png' width='80px' height='80px'>
       			</div>
       			</a>
       		</div>
       		
       		<div class='col-sm-3' style='padding:20px;'>
       			<a href='javascript:beforeDate()'>
       			<div class='text-center' style='font-size:25px; font-weight:bold;'><%="이용예정( "+beforeSize+" )"%><br>
       				<img src='../images/myReservation2.png' width='80px' height='80px'>
       			</div>
       			
       			</a>
       		</div>
       		
       		<div class='col-sm-3' style='padding:20px;'>
       			<a href='javascript:afterDate()'>
       			<div class='text-center' style='font-size:25px; font-weight:bold;'><%="이용완료( "+afterSize+" )"%><br>
       				<img src='../images/myReservation3.png' width='80px' height='80px'>
       			</div>
       			
       			</a>
       		</div>
       </div> 
        
        
        
        
        
        
        
      <table style='width:100%; margin-top:40px;  padding-top: 20px;' id='t_reservation'>
      	<thead >
      		<tr align="center" style='border: 1px solid #BDBDBD; font-size:21px; background-color:#FFA7A7; color:#CC3D3D;'>
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
      		
      	</tbody>
      </table> 
        
</article>
 </div>
</body>
</html>