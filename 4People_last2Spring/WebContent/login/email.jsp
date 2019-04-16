<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
function emailCall(){
	$("f_email").attr("method","POST");
	$("f_email").attr("action","./sendMail");
	$("f_email").submit();		
}
</script>

<form id="f_email" class="form-signin" method="POST">
 <a href=""> <button class="login100-form-btn" onclick="emailCall()">
							로그인
							</button> </a>
</form>
</body>
</html>