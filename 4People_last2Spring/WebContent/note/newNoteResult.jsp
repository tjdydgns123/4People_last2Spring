<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat,java.util.Date,java.util.Locale" %>
<%
	String mb_code = (String)request.getAttribute("mb_code");
	String mb_content =(String)request.getAttribute("mb_content");
	String color = (String)request.getAttribute("note_code");
	
	SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyy.MM.dd", Locale.KOREA );
	Date currentTime = new Date ();
	String mTime = mSimpleDateFormat.format ( currentTime );

%>
<script>
//메모를 클릭했을때
$('.mymemo').click(function(){
    note_id = $(this).attr("id");
//     alert(note_id);
});

</script>
<div id='<%=mb_code+"note"%>'>
<div class='col-sm-2 style='height:200px; wdith:200px;mgain:50px;' >
<div id='frame'><a class='note sticky1 mymemo'id="<%=mb_code%>" style='background-color:<%=color%>;'>
<div class='es_pin'></div><div class='text'><%=mb_content%></div>
<div class='footer'><%=mTime+"  "%>나</div></a></div></div></div>


