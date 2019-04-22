<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
	<title>kuzuro 게시판</title>
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.3/FileSaver.min.js"></script>
	<!-- 제이쿼리 -->
	<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
	<jsp:include page="../include/top.jsp"  flush="false">
		<jsp:param value="" name="top" />
	</jsp:include> 
</head>
<body>

<!-- 	</section> -->
<script type="text/javascript">

<!-- 	<footer> -->
<%-- 		<%@include file="include/footer.jsp" %>		 --%>
<!-- 	</footer> -->

<!-- </div> -->

<!-- </body> -->
<!-- </html> -->
$(".copy-img").each(function() {
	  $(this).wrap("<span></span>"),
	  $(this).parents("span").append("<input type=\"text\" value=" + $(this).attr("src") + ">")
	})
$(".copy-img").click(function() {
  var b = $(this).parents("span").children("input");
  b.select(),
  document.execCommand("copy"),
//   alert("copied! " + b.attr("value"))
});
</script> 
<div class="container">
<div class="copyable">
    <img src="image/bar-chart.png" alt="Copy Image to Clipboard via Javascript."/>
</div>
<div class="copyable">
    <img src="image/bubble_chart.png" alt="Copy Image to Clipboard via Javascript."/>
</div>
 
</div>
</body>
</html>






