<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"
	charset="utf-8"></script>

<title>Insert title here</title>
<script type="text/javascript">
// alert("gg");
// 	$(document).ready(function() {
// 		alert("찍힘?");
<%-- 		alert("<%=result%>"); --%>
// 		alert(${result}.response.id);
		var name = ${result}.response.name;
		var email = ${result}.response.email;
// 		alert(name);
// 		alert(email);
		location.href="./navergogo?mem_id="+email+"&mem_name="+name;
// 		$("#name").html("환영합니다. "+name+"님");
// 		$("#email").html(email);
// 	  });
</script>


</head>
<body>
<div
		style="background-color: #15a181; width: 100%; height: 50px; text-align: center; color: white;">
		<h3>SIST Naver_Login Success</h3>
	</div>
	<br>
	<h2 style="text-align: center" id="name"></h2>
	<h4 style="text-align: center" id="email"></h4>

</body>
</html>