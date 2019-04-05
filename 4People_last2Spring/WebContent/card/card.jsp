<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.Map, java.util.List, java.util.Iterator, java.util.ArrayList" %>
    <%
     List<Map<String,Object>> cardList = ( List<Map<String,Object>>)request.getAttribute("cardList");
     List<String> labelList = ( List<String>)cardList.get(0).get("labelMap");
     List<String> commentsList = ( List<String>)cardList.get(0).get("commentsMap");
     List<String> desList = (List<String>)cardList.get(0).get("desMap");
     List<String> partiList = (List<String>)cardList.get(0).get("partiMap");
     List<String> checkList = (List<String>)cardList.get(0).get("checkMap");
     List<String> label_color = new ArrayList<String>(); 
     List<String> label_content = new ArrayList<String>(); 
     List<String> label_code = new ArrayList<String>(); 
     List<String> comm_no = new ArrayList<String>(); 
     List<String> comm_time = new ArrayList<String>(); 
     List<String> comm_content = new ArrayList<String>(); 
     List<String> comm_maker = new ArrayList<String>(); 
     List<String> mem_name = new ArrayList<String>(); 
     List<String> parti_code = new ArrayList<String>(); 
     List<String> check_code = new ArrayList<String>(); 
     List<String> check_title = new ArrayList<String>(); 
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
				else if(keys[j].equals("comm_maker")){
					comm_maker.add(pMap.get(keys[j]).toString());
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
							out.print(pMap.get(keys[j]).toString());
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
    %>
   
<!DOCTYPE html>
<link href="https://fonts.googleapis.com/css?family=Source+Code+Pro" rel="stylesheet">

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

</style>
 
 <div class="modal-dialog" style="ovewflow-y:auto">
    <div class="modal-content" style="width:810px; height:850px;">
      <div class="modal-header" style="background-color:#D9D9D9">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel" >Modal title</h4>
      </div>
      <div class="modal-body" style="width:808px; height:800px; background-color:#D9D9D9;">
        <div  class="col-sm-10">
        <!-- 라벨 div -->
         <div id="card_label" style="margin-left:20px; margin-bottom:50px;">
         <h3>라벨</h3>
         <% if(labelList!=null){
         for(int i=0;i<labelList.size();i++){ %>
         <input id="<%=label_code.get(i) %>" type='button' class="btn <%=label_color.get(i) %>" value="<%= label_content.get(i)%>" data-toggle="modal" data-target="#label_modal2" onClick="label_codee(id)">
         <%}} %>
         <div id="label_modal2" class="modal" role="dialog" style="position:relative;width:250px">
  		<div class="modal-dialogg">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" onClick="mo_close()">&times;</button>
        <h4 class="modal-title">수정 or 삭제</h4>
      </div>
      <div class="modal-body">
        <input type="text" id="label_text2">
        <Br>
        <br>
      <input type="button" class="btn btn-default btn-block" onClick="defaultt()">
      <input type="button" class="btn btn-success btn-block" onClick="success()">
      <input type="button" class="btn btn-info btn-block" onClick="info()">
      <input type="button" class="btn btn-primary btn-block" onClick="primary()">
      <input type="button" class="btn btn-warning btn-block" onClick="warning()">
      <input type="button" class="btn btn-danger btn-block" onClick="danger()">
      </div>
      <div class="modal-footer">
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
         <button style="background-color:#FFFFFF"  onClick="mem_name_ajax()" data-target="#label_modal3" data-toggle="modal" ><img src="../images/plus.png" style="width:25px;height:25px;"></button>
         <%if(partiList!=null){
        	 for(int i=0;i<partiList.size();i++){
        	 %>
        	 <button id="<%=parti_code.get(i) %>" draggable="true" ondragstart="drag(event)" style='background-color:#FFFFFF;height:33px;margin-right:3px' onClick="mouse(id)"><%=mem_name.get(i) %></button>
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
      <div id="membergood">
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
         <textarea  id="des_text" style="margin-left:50px; width:500px; height:150px; border-radius: 8px 8px 8px 10px; border:0; " />
         <%}%>
          </div>
          <div id="des_cons">
          <%if(des_content!=null){ %>
         <span><h5><%=des_content.replace("#","<br>") %></h5></span>
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
      
        <!-- 첨부파일 div -->
         <div id="card_c_file" style=" margin-bottom:50px;">
         <h3><img src="../images/c_file2.png">첨부파일</h3>
         </div>
        <!-- 첨부파일 div -->
        <!-- 체크리스트 -->
         <div id="check_list" style=" margin-bottom:50px;">
         <% if(check_title.size()!=0) {%>
         <h3><img src="../images/plan.png">&nbsp;<%=check_title.get(0) %> &nbsp;&nbsp;&nbsp;<button id="<%=check_code.get(0) %>" oncClick="checkDEL()" style="background-color:#D9D9D9"><img src="../images/removebtn.png"></button></h3>
         <div class="progress">
   <div id="barbar" class="progress-bar progress-bar-danger progress-bar-striped active" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
    0%
   </div>
 
</div>
      <div class="checkbox">
	  <label>
	    <input id="hihi2" type="checkbox" value="" onClick="hihi(this,id)">
	    호 호 호 호 호
	  </label>
	 </div>
      <div class="checkbox">
	  <label>
	    <input id="hihi3" type="checkbox" value="" onClick="hihi(this,id)">
	   히 히 히 히 히
	  </label>
	 </div>
      <div class="checkbox">
	  <label>
	    <input id="hihi4" type="checkbox" value="" onClick="hihi(this,id)">
	   하하하하
	  </label>
	 </div>
      <div class="checkbox">
	  <label>
	    <input id="hihi5" type="checkbox" value="" onClick="hihi(this,id)">
	   희희희희
	  </label>
	 </div>
      <div class="checkbox">
	  <label>
	    <input id="hihi5" type="checkbox" value="" onClick="hihi(this,id)">
	   희희희희
	  </label>
	 </div>
      <div class="checkbox">
	  <label>
	    <input id="hihi5" type="checkbox" value="" onClick="hihi(this,id)">
	   희희희희
	  </label>
	 </div>
      <div class="checkbox">
	  <label>
	    <input id="hihi5" type="checkbox" value="" onClick="hihi(this,id)">
	   희희희희
	  </label>
	 </div>
  <%} %>
         </div>
        <!-- 체크리스트 -->
        <!-- 한마디 div -->
         <div id="card_hanmadi" style=" margin-bottom:50px;">
         <h3><img src="../images/hanmadi.png">한마디</h3>
         <div>
         <input type="text" id='input_comment' style="margin-left:50px; width:500px; height:75px;  border-radius: 8px 8px 8px 10px; border:0;">
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
         	<img  width="30px" height="30px"  src="../images/comment.png">
         		<label><span style='font-size:20px; font_weight:bold; margin:5px;'><%=comm_maker.get(i) %></span><span style='font-size:8px;'><%=comm_time.get(i) %></span></label>
         	<div>
         	<span class="label label-default"><%=comm_content.get(i) %></span>
         	</div>	
         	<%
        	 }}
         	%>
         </div>
         <!-- 은수 -->
         </div>
        <!-- 한마디 div -->
         <!-- 은수 -->
         <!-- 댓글 -->
         <div id="coment">
         <div class='es_comment' style='background-color: #D9D9D9;'>
         </div>
         </div>
         <!-- 댓글 -->
         <!-- 은수 -->
         
        </div>
        <div class="col-sm-2">
        <butuon type="button" class="btn btn-default es_shadow" style="text-align:left; width:120px; background-color:#CFCFCF; margin-bottom:8px; margin-top:30px" ><img src="../images/description.png">요약</butuon>
        <butuon type="button" class="btn btn-default es_shadow" style="text-align:left; width:120px; background-color:#CFCFCF; margin-bottom:8px"><img src="../images/member.png">참여자</butuon>
        <!-- 모달  -->
        <div style="position:absolute;">
        <butuon type="button" class="btn btn-default es_shadow" style="text-align:left; width:120px; background-color:#CFCFCF; margin-bottom:8px" onClick="labelAdd()" data-toggle="modal"  data-target="#label_modal"><img src="../images/label.png">라벨</butuon>
        <div id="label_modal" class="modal" role="dialog" style="position:relative; left:-90px">
  		<div class="modal-dialogg">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" onClick="mo_close2()">&times;</button>
        <h4 class="modal-title">라벨 내용</h4>
      </div>
      <div class="modal-body">
        <input type="text" id="label_text">
      </div>
      <div class="modal-footer">
      <input type="button" class="btn btn-default" onClick="defaultt()">
      <input type="button" class="btn btn-success" onClick="success()">
      <input type="button" class="btn btn-info" onClick="info()">
      <br>
      <input type="button" class="btn btn-primary" onClick="primary()">
      <input type="button" class="btn btn-warning" onClick="warning()">
      <input type="button" class="btn btn-danger" onClick="danger()">
      <br>
        <button type="button" class="btn btn-default"  onClick="addInput()">생성</button>
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
      <div class="modal-header">
        <button type="button" class="close" onClick="mo_close4()">&times;</button>
        <h4 class="modal-title"><img src="../images/notepad.png">타이틀</h4>
      </div>
      <div class="modal-body">
        <input type="text" id="check_text">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default"  onClick="checkAdd()">생성</button>
      	</div>
    	</div>
  		</div>
		</div>
        <!-- 모달  -->
        </div>
        
        <butuon type="button" class="btn btn-default es_shadow" style="text-align:left; width:120px; background-color:#CFCFCF; margin-bottom:8px"><img src="../images/gihan.png">기한설정</butuon>
        <butuon type="button" class="btn btn-default es_shadow" style="text-align:left; width:120px; background-color:#CFCFCF; margin-bottom:8px"><img src="../images/c_file.png">첨부파일</butuon>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <div class="droptarget" ondrop="drop(event)" ondragover="allowDrop(event)"><img src="../images/bin.png"></div>
        </div>
      </div>
    </div>
  </div>
  

  