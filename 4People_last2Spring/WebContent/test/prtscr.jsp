<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="./html2canvas.js"></script>

<title>Insert title here</title>
</head>
<body>

<input type="text" id="myInput" value="Hello, World!">
<button onclick="copy_to_clipboard()">클립보드로 복사</button>

<script>
function copy_to_clipboard() {
  var copyText = document.getElementById("myInput");
  copyText.select();
  document.execCommand("Copy");
}
</script>


</body>
</html>