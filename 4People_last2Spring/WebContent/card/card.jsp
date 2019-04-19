<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.vo.ChartVO, java.util.Map, java.util.List, java.util.Iterator, java.util.ArrayList" %>

    <%
    String mem_id = (String)session.getAttribute("MEM_ID");
     List<Map<String,Object>> cardList = ( List<Map<String,Object>>)request.getAttribute("cardList");
     
     Cookie[] cookies = request.getCookies();
 	if (cookies != null) {
 	  for (Cookie cookie : cookies) {
 	    out.print("쿠키 이름 : "+cookie.getName()+", 쿠키 값 : "+cookie.getValue()); 
 	  }
 	} else {
 	  out.println("쿠키가 한 개도 없습니다.");
 	}
     	String card_maker = (String)cardList.get(0).get("card_maker");
    	String card_name = (String)cardList.get(0).get("card_name");
    	String card_duedate = (String)cardList.get(0).get("card_duedate");
     List<String> labelList = ( List<String>)cardList.get(0).get("labelMap");
     List<String> commentsList = ( List<String>)cardList.get(0).get("commentsMap");
     List<String> desList = (List<String>)cardList.get(0).get("desMap");
     List<String> partiList = (List<String>)cardList.get(0).get("partiMap");
     List<String> checkList = (List<String>)cardList.get(0).get("checkMap");
     List<String> check_con_List = (List<String>)cardList.get(0).get("checklistMap");
     List<String> chartList = (List<String>)cardList.get(0).get("chartMap");
     List<String> fileList = (List<String>)cardList.get(0).get("fileMap");
 
     List<String> label_color = new ArrayList<String>(); 
     List<String> label_content = new ArrayList<String>(); 
     List<String> label_code = new ArrayList<String>(); 
     List<String> comm_no = new ArrayList<String>(); 
     List<String> comm_time = new ArrayList<String>(); 
     List<String> comm_content = new ArrayList<String>(); 
     List<String> comm_maker = new ArrayList<String>(); 
     List<String> c_mem_name = new ArrayList<String>(); 
     List<String> c_mem_image = new ArrayList<String>(); 
     List<String> mem_name = new ArrayList<String>(); 
     List<String> parti_code = new ArrayList<String>(); 
     List<String> p_mem_image = new ArrayList<String>(); 
     List<String> check_code = new ArrayList<String>(); 
     List<String> check_title = new ArrayList<String>(); 
     List<String> check_con_code = new ArrayList<String>(); 
     List<String> check_con_name = new ArrayList<String>(); 
     List<String> check_con_confirm = new ArrayList<String>(); 
     List<String> att_no = new ArrayList<String>(); 
     List<String> att_name = new ArrayList<String>(); 
     List<String> sub_att_name = new ArrayList<String>(); 
     List<String> att_date = new ArrayList<String>();
     
     List<String> no = new ArrayList<String>();
     List<String> c_mem_id = new ArrayList<String>();
     List<String> chartname = new ArrayList<String>();
     List<String> charttype = new ArrayList<String>();
     List<String> label = new ArrayList<String>();
     List<String> data = new ArrayList<String>();
     List<String> createtime = new ArrayList<String>();
     
     String des_content = null; 
     String des_no = null; 
     
     if(labelList!=null){
     Iterator ltr = labelList.iterator();
		while(ltr.hasNext()){
			Map<String,Object> pMap = (Map<String,Object>)ltr.next();
			Object keys[] = pMap.keySet().toArray();
			for(int j=0;j<keys.length;j++){
				if(keys[j].equals("label_color")){
					label_color.add(pMap.get(keys[j]).toString());
				}
				else if(keys[j].equals("label_content")){
					label_content.add(pMap.get(keys[j]).toString());
				}
				else if(keys[j].equals("label_code")){
					label_code.add(pMap.get(keys[j]).toString());
				}
				
			}
		}
     }
     
    
     if(chartList != null){
    	 Iterator cltr = chartList.iterator();
//     	 while(cltr.hasNext()){
    		 Map<String,Object> pMap = (Map<String,Object>)cltr.next();
    		 Object keys[] = pMap.keySet().toArray();
    		 for(int j=0; j<keys.length; j++){
    			 if(keys[j].equals("no")){
    				 no.add(pMap.get(keys[j]).toString());
    			 }
    			 else if(keys[j].equals("mem_id")){
    				 c_mem_id.add(pMap.get(keys[j]).toString());
    				 out.print("c_mem_id : "+c_mem_id);
    			 }
    			 else if(keys[j].equals("chartname")){
    				 chartname.add(pMap.get(keys[j]).toString());
    			 }
    			 else if(keys[j].equals("charttype")){
    				 charttype.add(pMap.get(keys[j]).toString());
    			 }
    			 else if(keys[j].equals("label")){
    				 label.add(pMap.get(keys[j]).toString());
    			 }
    			 else if(keys[j].equals("data")){
    				 data.add(pMap.get(keys[j]).toString());
    			 }
    			 else if(keys[j].equals("createtime")){
    				 createtime.add(pMap.get(keys[j]).toString());
    			 }
    		 }
//     	 }
     }
     
		if(commentsList!=null){
     Iterator ctr = commentsList.iterator();
		while(ctr.hasNext()){
			Map<String,Object> pMap = (Map<String,Object>)ctr.next();
			Object keys[] = pMap.keySet().toArray();
			for(int j=0;j<keys.length;j++){
				if(keys[j].equals("comm_no")){
					comm_no.add(pMap.get(keys[j]).toString());
				}
				else if(keys[j].equals("comm_time")){
					comm_time.add(pMap.get(keys[j]).toString());
				}
				else if(keys[j].equals("comm_content")){
					comm_content.add(pMap.get(keys[j]).toString());
				}
				else if(keys[j].equals("mem_name")){
					c_mem_name.add(pMap.get(keys[j]).toString());
				}
				else if(keys[j].equals("comm_maker")){
					comm_maker.add(pMap.get(keys[j]).toString());
				}
				else if(keys[j].equals("mem_image")){
					c_mem_image.add(pMap.get(keys[j]).toString());
				}
				
			}
		}
    
		}
		if(desList!=null){
			 Iterator dtr = desList.iterator();
				while(dtr.hasNext()){
					Map<String,Object> pMap = (Map<String,Object>)dtr.next();
					Object keys[] = pMap.keySet().toArray();
					for(int j=0;j<keys.length;j++){
						if(keys[j].equals("des_no")){
							des_no=(pMap.get(keys[j]).toString());
						}
						else if(keys[j].equals("des_content")){
							des_content=(pMap.get(keys[j]).toString());
						}
						
					}
				}
		}
		if(partiList!=null){
			 Iterator ptr = partiList.iterator();
				while(ptr.hasNext()){
					Map<String,Object> pMap = (Map<String,Object>)ptr.next();
					Object keys[] = pMap.keySet().toArray();
					for(int j=0;j<keys.length;j++){
						if(keys[j].equals("mem_name")){
							mem_name.add(pMap.get(keys[j]).toString());
						}
						else if(keys[j].equals("parti_code")){
							parti_code.add(pMap.get(keys[j]).toString());
						}
						else if(keys[j].equals("mem_image")){
							p_mem_image.add(pMap.get(keys[j]).toString());
						}
						
					}
				}
		}
		if(checkList!=null){
			 Iterator chtr = checkList.iterator();
				while(chtr.hasNext()){
					Map<String,Object> pMap = (Map<String,Object>)chtr.next();
					Object keys[] = pMap.keySet().toArray();
					for(int j=0;j<keys.length;j++){
						if(keys[j].equals("check_title")){
							check_title.add(pMap.get(keys[j]).toString());
						}
						else if(keys[j].equals("check_code")){
							check_code.add(pMap.get(keys[j]).toString());
						}
						
					}
				}
		}
		if(check_con_List!=null){
			 Iterator chcotr = check_con_List.iterator();
				while(chcotr.hasNext()){
					Map<String,Object> pMap = (Map<String,Object>)chcotr.next();
					Object keys[] = pMap.keySet().toArray();
					for(int j=0;j<keys.length;j++){
						if(keys[j].equals("check_con_name")){
							check_con_name.add(pMap.get(keys[j]).toString());
						}
						else if(keys[j].equals("check_con_code")){
							check_con_code.add(pMap.get(keys[j]).toString());
						}
						else if(keys[j].equals("check_con_confirm")){
							check_con_confirm.add(pMap.get(keys[j]).toString());
						}
						
					}
				}
		}
		int ccl_ALLlength =0;
		int check_length = 0;
		int plus_length = 0;
		if(check_con_code.size()>0){
		ccl_ALLlength=Math.round(100/check_con_code.size());
		
		for(int j=0;j<check_con_confirm.size();j++){
			if(check_con_confirm.get(j).equals("1")){
				check_length +=1;
			}
		}
		plus_length = ccl_ALLlength*check_length;
		}
		
		if(fileList!=null){
			 
			 Iterator fitr = fileList.iterator();
				while(fitr.hasNext()){
					Map<String,Object> pMap = (Map<String,Object>)fitr.next();
					Object keys[] = pMap.keySet().toArray();
					for(int j=0;j<keys.length;j++){
					
						if(keys[j].equals("att_name")){
							att_name.add(pMap.get(keys[j]).toString());
							String [] str = pMap.get(keys[j]).toString().split("\\.");
							sub_att_name.add(str[1]);
						}
						else if(keys[j].equals("att_no")){
							att_no.add(pMap.get(keys[j]).toString());
						}
						else if(keys[j].equals("att_date")){
							att_date.add(pMap.get(keys[j]).toString());
						}
						
					}
				}
		}
    %>
<head>
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.3/FileSaver.min.js"></script>
</head>   
<link href="https://fonts.googleapis.com/css?family=Source+Code+Pro" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.css" rel="stylesheet" type="text/css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.js"></script>
<style>
.modal-body{
 overflow-y:auto;
}
.modal-body{
    overflow-y: auto;
}
.es_comment {
    border-bottom: 1px solid rgba(9,45,66,.13);
    margin-left: 40px;
    min-height: 32px;
    padding: 12px 0;
    position: relative;
}
.es_content {
    display: inline-block;
    font-size: 12px;
    margin: 0;
    min-width: 110px;
}
.es_font{
font-family: 'Candal', sans-serif;
}
.es_shadow{
		background-color:#F6F6F6;
		box-shadow: 0 3px 6px rgba(0,0,0,.25);
       word-break:break-all;
/*     -webkit-box-shadow: 0 3px 6px rgba(0,0,0,.25); */
/*     -moz-box-shadow: 0 3px 6px rgba(0,0,0,.25); */
}
.filebox label {
    display: inline-block;
    padding: .5em .75em;
    color: #999;
    font-size: inherit;
    line-height: normal;
    vertical-align: middle;
    background-color: #fdfdfd;
    cursor: pointer;
    border: 1px solid #ebebeb;
    border-bottom-color: #e2e2e2;
    border-radius: .25em;
}
/* .filebox input[type="file"] { */
/*     position: absolute; */
/*     width: 1px; */
/*     height: 1px; */
/*     padding: 0; */
/*     margin: -1px; */
/*     overflow: hidden; */
/*     clip:rect(0,0,0,0); */
/*     border: 0; */
/* } */
/* named upload */
.filebox .upload-name {
    display: inline-block;
    padding: .5em .75em;
    font-size: inherit;
    font-family: inherit;
    line-height: normal;
    vertical-align: middle;
    background-color: #f5f5f5;
  border: 1px solid #ebebeb;
  border-bottom-color: #e2e2e2;
  border-radius: .25em;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
}
#fname { display:none; } 
.input-group-addon { display:none; } 
.glyphicon { display:none; } 
#gihanz { display:none; } 
.glyphicon-calendar  { display:none; } 
 /* iframe을 숨기기 위한 css*/
        #if{
            width: 0px;
            height: 0px;
            border: 0px;
        }
        
        .modal-title-jm { 
          margin: 0;
  line-height: 1.42857143;
        text-align:center ;
        color:#17375E;
        }
</style>
<body>


 <div class="modal-dialog" style="ovewflow-y:auto">
    <div class="modal-content" style="width:808px; height:750px;">
      <div class="modal-header" style="background-color:#D9D9D9">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title-jm" id="myModalLabel" style="text-aling:center"><%if(card_duedate!=null){out.print(card_duedate+"  -  ");}  %>  <%=card_name %></h4>
      </div>
      <div class="modal-body" id="ccmmdy" style="width:100%; height:100%; background-color:#D9D9D9;">
        <div  class="col-sm-10">
        <!-- 라벨 div -->
         <div id="card_label" style="margin-left:20px; margin-bottom:30px;">
         <h3>라벨</h3>
         <% if(labelList!=null){
         for(int i=0;i<labelList.size();i++){ %>
         <input id="<%=label_code.get(i) %>" type='button' class="btn <%=label_color.get(i) %>" value="<%= label_content.get(i)%>" data-toggle="modal" data-target="#label_modal2" onClick="label_codee(id)">
         <%}} %>
         <div id="label_modal2" class="modal" role="dialog" style="position:relative;width:250px">
  		<div class="modal-dialogg">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header" style="background-color:#FAE0D4">
        <button type="button" class="close" onClick="mo_close()">&times;</button>
        <h4 class="modal-title"><img src="../images/price-tagg.png"></h4>
      </div>
      <div class="modal-body" style="background-color:#FAE0D4">
      	<label>Title</label><br>
        <input type="text" id="label_text2">
        <Br>
        <br>
        <label>Select Color</label>
      <input type="button" class="btn btn-default btn-block" onClick="defaultt()">
      <input type="button" class="btn btn-success btn-block" onClick="success()">
      <input type="button" class="btn btn-info btn-block" onClick="info()">
      <input type="button" class="btn btn-primary btn-block" onClick="primary()">
      <input type="button" class="btn btn-warning btn-block" onClick="warning()">
      <input type="button" class="btn btn-danger btn-block" onClick="danger()">
      </div>
      <div class="modal-footer" style="background-color:#FAE0D4">
        <button type="button" class="btn btn-info"  onClick="label_Upd()">수정</button>
        <button type="button" class="btn btn-danger" onClick="label_del()">삭제</button>
      	</div>
    	</div>
  		</div>
		</div>
         </div>
        <!-- 라벨 div -->
        
        <!-- 참여자 div -->
         <div id="card_member" style="margin-left:20px; margin-bottom:50px;">
         <h3>참여자</h3>
         <div id="membersja" style="position:absolute;" ondrop="drop(event)" >
         <button style="background-color:#FFFFFF"  name="parti" onClick="mem_name_ajax()" data-target="#label_modal3" data-toggle="modal" ><img src="../images/plus.png" style="width:25px;height:25px;"></button>
         <%if(partiList!=null){
        	 for(int i=0;i<partiList.size();i++){
        	 %>
        	 <button id="<%=parti_code.get(i) %>" name="gkgk" draggable="true" ondragstart="drag(event)" style='background-color:#D9D9D9;height:37px;margin-right:3px' onClick="mouse(id)"> <img id="<%=parti_code.get(i) %>" src="http://192.168.0.6:9000/4People_last2Spring/pds/<%=p_mem_image.get(i) %>"  alt="Cinque Terre" width="30" height="30" ><%=mem_name.get(i) %></button>
        	 <%}} %>
           <div id="label_modal3" class="modal" role="dialog" style="position:relative;">
  		<div class="modal-dialogg">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" onClick="mo_close3()">&times;</button>
        <h4 class="modal-title">초대하기</h4>
      </div>
      <div class="modal-body">
        <input type="text" id="label_text5">
      </div>
      <div class="modal-footer">
      <div id="membergood34">
      </div>
      	</div>
    	</div>
  		</div>
		</div>
        </div>
         </div>
        <!-- 참여자 div -->
    
        <!-- 요약 div -->
         <div id="card_description" style=" margin-bottom:50px;">
         <h3 id="hth"><img src="../images/description2.png">요약    <%if(des_content!=null){ %>
           <a id="<%=des_no%>" href="#" onclick="desUPD(id)" style="margin-left:20px">edit</a>
		<%}%>     </h3>
       
          <div id="des_con">
          <div id="des_conss" class="droptarget" ondrop="drop(event)" ondragover="allowDrop(event)">
          <%if(des_content==null){ %>
         <textarea  id="des_text" style="margin-left:50px; width:500px; height:150px; border-radius: 8px 8px 8px 10px; border:0; " ><회의내용>
- 3.15 워크샵 준비하기
- 학회참석하기
- A4용지 구매하기</textarea>
         <%}%>
          </div>
          <div id="des_cons">
          <%if(des_content!=null){ %>
         <span><h5 style="margin-left:45px;"><%=des_content.replace("#","<br>") %></h5></span>
         <%} %>
         </div>
         </div>
         <div id="des_bt">
         <%if(des_content==null){ %>
         <input id="<%=des_no %>" type="button" style="margin-left:50px; margin-top:10px" class="btn btn-success col-sm-2 col-sm-offset-5" value="저장" onClick="descriptionIns(id)">
         <%} %>
         </div>
         </div>
        <!-- 요약 div -->
      
      
        <!-- 차트 시작 -->
        <% if(no.size()!=0) {%>
        <div id="chartbutton" style=" margin-bottom:50px;"></div>
        <% } %>
        <!-- 차트 끝 -->
      
      
        <!-- 첨부파일 div -->
         <div id="card_c_file" style=" margin-bottom:50px;">
         <h3><img src="../images/c_file2.png">첨부파일</h3>
         <%if(fileList!=null) {
         	for(int i=0;i<att_no.size();i++){%>
         <div id="<%=att_no.get(i) %>">
         <div class="col-sm-2"><button style="width:50px;height:50px;background-color:#D9D9D9;" onClick="filedown('<%=att_name.get(i) %>')"><%
          if(sub_att_name.get(i).equals("ppt")||sub_att_name.get(i).equals("pptx")){%>
        	  <img src="../images/powerpoint.png">
          <%}else if(sub_att_name.get(i).equals("execel")||sub_att_name.get(i).equals("xlsx")||sub_att_name.get(i).equals("xls")){%>
        	  <img src="../images/excel.png">
         <%} else if(sub_att_name.get(i).equals("png")){%>
        	  <img src="../images/png.png">
         <%}else if(sub_att_name.get(i).equals("gif")){ %>
        	  <img src="../images/gif.png">
         <%}else if(sub_att_name.get(i).equals("word")||sub_att_name.get(i).equals("docx")){ %>
        	  <img src="../images/word.png">
         <%} else if(sub_att_name.get(i).equals("txt")){%>
        	  <img src="../images/txt.png">
         <%} else if(sub_att_name.get(i).equals("hwp")){%>
        	  <img src="../images/hwp.png">
        	  <%}else { %>
        	  sub_att_name.get(i)
        	  <%} %>
         </button></div>
		 <div class="col-sm-10">      
         <div><label><%=att_name.get(i) %></label></div>
         <div class="row"><label><%=att_date.get(i) %></label></div>
         </div>
			<a id="<%=att_no.get(i) %>" href="#" style="margin-left:100%" onClick="file_del(id)"><img src="../images/close-cross.png"></a>
         </div>
		<%}}%>
		</div>
        <!-- 첨부파일 div -->
        <!-- 체크리스트 -->
         <div id="check_list"  style=" margin-bottom:50px;">
         <% if(check_title.size()!=0) {%>
         <h3 id="check_addhaja"><img src="../images/plan.png">&nbsp;<%=check_title.get(0) %> &nbsp;&nbsp;
         <a href="#" id="<%=check_code.get(0) %>" onClick="checklistadd(id)"><img src="../images/add-file.png"></a>&nbsp;&nbsp;<a  href="#" id="<%=check_code.get(0) %>" onClick="checkDEL(id)" style="background-color:#D9D9D9">
         <img src="../images/removebtn.png"></a></h3>
         <div class="progress">
         <%if(check_length==check_con_code.size()){ %>
   <div id="barbar" class="progress-bar progress-bar-danger progress-bar-striped active" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width:100%;">
    100%
    <%} else if(check_length==0){%>
   <div id="barbar" class="progress-bar progress-bar-danger progress-bar-striped active" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width:0%;">
     0%
    <%}else{ %>
   <div id="barbar" class="progress-bar progress-bar-danger progress-bar-striped active" role="progressbar" aria-valuenow="<%=plus_length %>" aria-valuemin="0" aria-valuemax="100" style="width: <%=plus_length %>%;">
    <%=plus_length %>%
   <%} %>
   </div>
   </div>
  <%} %>
	<% if(check_con_List!=null){ 
		for(int i=0;i<check_con_code.size();i++){%>
<%--       <div id="<%=check_con_code.get(i) %>" class="checkbox" class='min'> --%>
      <div id="<%=check_con_code.get(i) %>" class="checkbox">
	  <label >
	  	<% if(check_con_confirm.get(i).equals("0")){ %>
	    <input id="<%=check_con_code.get(i) %>" type="checkbox" value="" onClick="hihi(this,id)">
	   		<%=check_con_name.get(i) %>
	   		<%} else{%>
	    <input id="<%=check_con_code.get(i) %>" type="checkbox" value="" checked onClick="hihi(this,id)">
	   		<%=check_con_name.get(i) %>
	   		<%} %>
	  </label>
	  <a id="<%=check_con_code.get(i) %>" href="#" style="margin-left:100%" onClick="ck_con_del(id)"><img src="../images/close-cross.png"></a>
	 </div>
     <%} }%>
        </div>
        <!-- 체크리스트 -->
        <!-- 한마디 div -->
         <div id="card_hanmadi" style=" margin-bottom:50px;">
         <h3><img src="../images/hanmadi.png">한마디</h3>
         <div>
         <textarea  id='input_comment' style="margin-left:50px; width:500px; height:75px;  border-radius: 8px 8px 8px 10px; border:0;"/>
         </div>
         <div>
         <input type="button"  style="margin-left:50px; margin-top:5px" class="btn btn-success col-sm-2 col-sm-offset-5" value="저장" onClick='comment()'>
         </div>
         <!-- 은수 -->
         <br><br><br>
         <div id="comments" style='background-color: #D9D9D9;'>
         <% if(commentsList!=null){
        	 for(int i=0;i<commentsList.size();i++){
           
         %>
         	<img  width="30px" height="30px"  src="http://192.168.0.6:9000/4People_last2Spring/pds/<%=c_mem_image.get(i)%>">
         		<label><span style='font-size:20px; font_weight:bold; margin:5px;'><%=c_mem_name.get(i) %></span><span style='font-size:8px;'><%=comm_time.get(i) %></span>
         		<%if(mem_id.equals(comm_maker.get(i))){ %>
         		<a id="<%=comm_no.get(i) %>" style="margin-left:130px;" href="#" onClick="commDEL(id)"><img src="../images/close-cross.png" style="width:8px;hieght:8px"></a>
         		<%} %>
         		</label>
         	<div>
         	<label style='background-color: #FFFFFF;color:#17375E;margin-left:50px; width:50%; height:25px;border-radius: 8px 8px 8px 10px; border:0;' >&nbsp;&nbsp;&nbsp;<%=comm_content.get(i) %></label>
         	</div>	
         	<%
        	 }}
         	%>
         </div>
         <!-- 은수 -->
         </div>
        <!-- 한마디 div -->

           </div>
         <!-- col- sm -10 끝  -->
        <div class="col-sm-2">
        <butuon type="button" class="btn btn-default es_shadow" style="text-align:left; width:120px; background-color:#CFCFCF; margin-bottom:8px; margin-top:30px" onClick="vison()" ><img src="../images/description.png">요약</butuon>
        <butuon type="button" class="btn btn-default es_shadow" style="text-align:left; width:120px; background-color:#CFCFCF; margin-bottom:8px"><img src="../images/member.png">참여자</butuon>
        <!-- 모달  -->
        <div style="position:absolute;">
        <butuon type="button" class="btn btn-default es_shadow" style="text-align:left; width:120px; background-color:#CFCFCF; margin-bottom:8px" onClick="labelAdd()" data-toggle="modal"  data-target="#label_modal"><img src="../images/label.png">라벨</butuon>
        <div id="label_modal" class="modal" role="dialog" style="position:relative; left:-90px;">
  		<div class="modal-dialogg">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header" style="background-color:#FAE0D4">
        <button type="button" class="close" onClick="mo_close2()">&times;</button>
        <h4 class="modal-title"><img src="../images/price-tag.png"></h4>
      </div>
      <div class="modal-body" style="background-color:#FAE0D4">
      	<label>Title</label>
        <input type="text" id="label_text" placeholder="내용을 입력하세요." value='내일 정전이 된다해도 나는 오늘 한 줄의 코드를 쓰겠다.'><br><br>
      	<label>Select Color</label><br>
      <input type="button" class="btn btn-default" onClick="defaultt()">
      <input type="button" class="btn btn-success" onClick="success()">
      <input type="button" class="btn btn-info" onClick="info()">
<!--       <br> -->
      <input type="button" class="btn btn-primary" onClick="primary()">
      <input type="button" class="btn btn-warning" onClick="warning()">
      <input type="button" class="btn btn-danger" onClick="danger()">
      <br><br>
        <button type="button" class="btn btn-success"  onClick="addInput()">생성</button>
      </div>
      
  		</div>
		</div>
		</div>
        </div>
        <!-- 모달  -->
        
        
        <butuon type="button" class="btn btn-default es_shadow" style="text-align:left; width:120px; background-color:#CFCFCF; margin-bottom:8px" onClick="checkAdd()"><img src="../images/checklist.png">체크리스트</butuon>
        <div style="position:absolute;">
        <butuon type="button" class="btn btn-default es_shadow" style="text-align:left; width:120px; background-color:#CFCFCF; margin-bottom:8px"  data-target="#checkModal" data-toggle="modal"><img src="../images/checklist.png">체크리스트</butuon>
        <!-- 모달  -->
         <div id="checkModal" class="modal" role="dialog" style="position:relative; left:-90px">
  		<div class="modal-dialogg">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header" style="background-image:url('../images/snow.gif')">
        <button type="button" class="close" onClick="mo_close4()">&times;</button>
        <h4 class="modal-title"><img src="../images/notepad.png"></h4>
      </div>
      <div class="modal-body" style="background-image:url('../images/snow.gif')">
      	<label style="color:#FFFFFF">Title</label>
        <input type="text" id="check_text" placeholder="내용을 입력하세요.">
        <br><br>
        <button type="button" class="btn btn-default"  onClick="checkAdd()">생성</button>
      </div>
    	</div>
  		</div>
		</div>
        <!-- 모달  -->
        </div>
        
        <butuon type="button" class="btn btn-default es_shadow" style="text-align:left; width:120px; background-color:#CFCFCF; margin-bottom:8px"><img src="../images/gihan.png">기한설정</butuon>
        
        <div id="datepicker" class="input-group date" data-date-format="yyyy-mm-d DD">
         <input id="gihanz" class="form-control" type="text" readonly />
        <butuon type="button" class="btn btn-default es_shadow" style="text-align:left; width:120px; background-color:#CFCFCF; margin-bottom:8px" onClick="gihan(event)"><img src="../images/gihan.png"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>기한설정</butuon>
		</div>
         <form id="fileBoxform" name="fileBoxform" method="post" enctype="multipart/form-data">
        <div class="fileBox">
        <button type="button" id="btn-upload" class="btn btn-default es_shadow" style="text-align:left; width:120px; background-color:#CFCFCF; margin-bottom:8px" onClick="akakl(event)"><img src="../images/c_file.png">첨부파일</button>
        <input id="fname" name="fname" type="file" class="uploadBtn" style="width:120px; background-color:#CFCFCF; margin-bottom:8px" onClick="fileINS()">
        <input type="hidden" id='card_code' name='card_code'>
        <input type="hidden" id='f_team_code' name='f_team_code'>
        <input type="hidden" id='f_maker' name='f_maker'>
        </div>
        <!-- 차트 -->
        <div>
        <% if(chartList != null){ %>
          <button  id=<%=c_mem_id.get(0) %> type="button" class="btn btn-default es_shadow" data-toggle="modal"  data-backdrop="static" data-target="#chartmodal" style="text-align:left; width:120px; background-color:#CFCFCF; margin-bottom:8px" onClick="chartCall(id)"><img src="../images/description.png">최신차트</button>
        <% } %>
        </div>
        <!-- 차트 끝 -->
        </form>
        <br>
        <div class="droptarget" ondrop="drop(event)" ondragover="allowDrop(event)"><img src="../images/bin.png"></div>
        <!-- col sm-2 끝  -->
        </div>
  <!--모달바디 끝  -->
  </div>
  <!-- 모달 컨텐츠 끝  -->
  </div>
  <!-- 모달 다이얼로끝그 -->
  </div>
  
<script>
/* 체크가 되어있는 개수 */
var count=parseFloat("<%=check_length%>"); 
	
function hihi(check,id){
// 	alert("count:"+count); 
	var length ='';
	var llength ='';
	var lllength ='';
	var Mllength ='';
	
	/* 현재 존재하는 체크박스의 개수  */
	 length = $('#check_list').children('.checkbox').length;
	 
	/* 체크박스 클릭시 올라가는 % */
	 llength = 100/length;
	 /* 체크박스 클릭할 때마다 벨류를 더해줌 */
	 lllength = Math.round(parseFloat($("#barbar").attr("aria-valuenow"))+llength);
	 /* 체크박스 클릭할 때마다 벨류를 빼줌 */
	 Mllength = Math.round(parseFloat($("#barbar").attr("aria-valuenow"))-llength);
    
	if ( check.checked == true ){
// 	alert("선택");
	count += 1;
// 	 alert("선택후 count: "+count);
	 if(count!=length){
	$('#barbar').attr({
		"aria-valuenow" : lllength ,
		"style" : "width:"+lllength+"%"
		});
	$('#barbar').empty();
	$('#barbar').append(lllength+"%");
	}
	 else{
		 var lilength = Math.round(parseFloat($("#barbar").attr("aria-valuenow")));
		 var halength = 100-lilength;
	$('#barbar').attr({
		"aria-valuenow" : 100 ,
		"style" : "width:"+100+"%"
		});
	$('#barbar').empty();
	$('#barbar').append(100+"%");
		 }
	 var param = "check_con_code="+id;
		$.ajax({
			type:"POST"
		   ,url:"../card/checklistUPD"
		   ,data:param
		   ,dataType:"html"
		   ,success:function(result){
			   
		   }
		});
	 
	 }
	else{
// 	alert("해제");
	count -=1;
// 	 alert("해제후 count: "+count);
	 if(count!=0){
	$('#barbar').attr({
		"aria-valuenow" : Mllength,
		"style" : "width:"+Mllength+"%"
		});
	$('#barbar').empty();
	$('#barbar').append(Mllength+"%");
		 }
	 else{
	$('#barbar').attr({
		"aria-valuenow" : 0,
		"style" : "width:"+0+"%"
		});
	$('#barbar').empty();
	$('#barbar').append(0+"%");
		 }
	 var param = "check_con_code="+id;
		$.ajax({
			type:"POST"
		   ,url:"../card/checklistUPD2"
		   ,data:param
		   ,dataType:"html"
		   ,success:function(result){
			   
		   }
		});
	}
	
}
/* 차트삽입 버튼 누르면 차트 가져오기 */
function chartCall(id){
	var param = "mem_id="+id;
		$('#chartbutton').empty();
		$.ajax({
				type:"post"
				,url:"../card/chartCall"
				,data:param
					   ,dataType:"html"
					   ,success:function(result){
					   	 $('#chartbutton').append(result);
					   }
		,error:function(jqXHR, exception){
			  if (jqXHR.status === 0) {
		        }
		        else if (jqXHR.status == 400) {
		        }
		        else if (jqXHR.status == 401) {
		        }
		        else if (jqXHR.status == 403) {
		        }
		        else if (jqXHR.status == 404) {
		        }
		        else if (jqXHR.status == 500) {
		        }
		        else if (jqXHR.status == 503) {
		        }
		        else if (exception === 'parsererror') {
		        }
		        else if (exception === 'timeout') {
		        }
		        else if (exception === 'abort') {
		        }
		        else {
		        }
		  }
		});
}
/* 차트삽입버튼 끝 */
</script>

<!-- <div class="modal fade" id="chartmodal" tabindex="-1" role="dialog" aria-labelledby="chartmodal" aria-hidden="true" > -->
<!-- </div> -->

</body>
</html>
