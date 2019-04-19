<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<!-- //기본적으로 필요한 자바스크립트 -->

<script type="text/javascript" src="/public/common/js/common.js"></script>
<script type="text/javascript" src="/public/common/js/jquery-1.10.2.min.js" /></script>
<script type="text/javascript" src="/public/front/plugin/chartjs/Chart.js"></script>

 



</head>



<script type="text/javascript">

$(document).ready(function() {  
        
    
   
        
        
       }); 
       

  </script>

</head>
<body>  
<div class="container">
<%
      String test = "테스트" ;
      pageContext.setAttribute("test", test) ;
 %>

 <c:out value="${test}" />




</div>
</body>
</html>

