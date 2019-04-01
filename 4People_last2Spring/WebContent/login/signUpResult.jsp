<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  int result = (Integer)request.getAttribute("result");
	if(result==1){
%>
		<script>
		alert("가입성공");
		location.href="./login.jsp";
		</script>
		
		
<%	}else{%>	
	<script>
	alert("가입실패");
	history.go(-1);
	</script>
<% }%> 

