<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.Map, java.util.List, java.util.Iterator, java.util.ArrayList" %>
    <%
     List<Map<String,Object>> cardList = ( List<Map<String,Object>>)request.getAttribute("cardList");
     List<String> labelList = ( List<String>)cardList.get(0).get("labelMap");
     List<String> commentsList = ( List<String>)cardList.get(0).get("commentsMap");
     List<String> desList = (List<String>)cardList.get(0).get("desMap");
     List<String> label_color = new ArrayList<String>(); 
     List<String> label_content = new ArrayList<String>(); 
     List<String> label_code = new ArrayList<String>(); 
     List<String> comm_no = new ArrayList<String>(); 
     List<String> comm_time = new ArrayList<String>(); 
     List<String> comm_content = new ArrayList<String>(); 
     List<String> comm_maker = new ArrayList<String>(); 
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
						}
						else if(keys[j].equals("des_content")){
							des_content=(pMap.get(keys[j]).toString());
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
    <div class="modal-content" style="width:810px; height:800px;">
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
         <div id="label_modal2" class="modal modal-center fade" role="dialog" style="position:relative;width:250px">
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
         </div>
        <!-- 참여자 div -->
    
        <!-- 요약 div -->
         <div id="card_description" style=" margin-bottom:50px;">
         <h3 id="hth"><img src="../images/description2.png">요약    <%if(des_content!=null){ %>
           <a style="margin-left:20px">edit</a>
		<%}%>     </h3>
       
          <div id="des_con">
          <%if(des_content==null){ %>
         <textarea  id="des_text" style="margin-left:50px; width:500px; height:150px; border-radius: 8px 8px 8px 10px; border:0; " />
         <%}else{ %>
         <span><h5 id="<%=des_no%>"><%=des_content %></h5></span>
         <%} %>
         </div>
         <div id="des_bt">
         <%if(des_content==null){ %>
         <input type="button" style="margin-left:50px; margin-top:10px" class="btn btn-success col-sm-2 col-sm-offset-5" value="저장" onClick="descriptionIns()">
         <%} %>
         </div>
         </div>
        <!-- 요약 div -->
      
        <!-- 첨부파일 div -->
         <div id="card_c_file" style=" margin-bottom:50px;">
         <h3><img src="../images/c_file2.png">첨부파일</h3>
         </div>
        <!-- 첨부파일 div -->
        
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
         	<img  width="30px" height="30px"  src="../images/comment.png">
         		<label><span style='font-size:20px; color:#4374D9; font_weight:bold; margin:5px;'>김은수</span><span style='font-size:8px;'>2019-03-27&nbsp;&nbsp;수요일 &nbsp;&nbsp;18:41</span></label>
         		<a href="javascript:commentDeletModal()" style='margin-left:300px;'> <img  width="15px" height="15px"  src="../images/commentDelete.png"></a>
         </div>
         </div>
         <!-- 댓글 -->
         <!-- 은수 -->
         
        </div>
        <div class="col-sm-2">
        <butuon type="button" class="btn btn-default" style="text-align:left; width:120px; background-color:#CFCFCF; margin-bottom:8px; margin-top:30px" ><img src="../images/description.png">요약</butuon>
        <butuon type="button" class="btn btn-default" style="text-align:left; width:120px; background-color:#CFCFCF; margin-bottom:8px"><img src="../images/member.png">참여자</butuon>
        <div style="position:absolute;">
        <butuon type="button" class="btn btn-default" style="text-align:left; width:120px; background-color:#CFCFCF; margin-bottom:8px" onClick="labelAdd()" data-toggle="modal"  data-backdrop="static" data-target="#label_modal"><img src="../images/label.png">라벨</butuon>
        <div id="label_modal" class="modal modal-center fade" role="dialog" style="position:relative; left:-90px">
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
        
        <butuon type="button" class="btn btn-default" style="text-align:left; width:120px; background-color:#CFCFCF; margin-bottom:8px"><img src="../images/checklist.png">체크리스트</butuon>
        <butuon type="button" class="btn btn-default" style="text-align:left; width:120px; background-color:#CFCFCF; margin-bottom:8px"><img src="../images/gihan.png">기한설정</butuon>
        <butuon type="button" class="btn btn-default" style="text-align:left; width:120px; background-color:#CFCFCF; margin-bottom:8px"><img src="../images/c_file.png">첨부파일</butuon>
        <butuon type="button" class="btn btn-default es_shadow" style="text-align:left; width:120px; background-color:#CFCFCF; margin-bottom:8px; margin-top:30px" ><img src="../images/description.png">요약</butuon>
        <butuon type="button" class="btn btn-default es_shadow" style="text-align:left; width:120px; background-color:#CFCFCF; margin-bottom:8px"><img src="../images/member.png">참여자</butuon>
        <butuon type="button" class="btn btn-default es_shadow" style="text-align:left; width:120px; background-color:#CFCFCF; margin-bottom:8px" onClick="labelAdd()"><img src="../images/label.png">라벨</butuon>
        <butuon type="button" id='checkList' class="btn btn-default es_shadow" style="text-align:left; width:120px; background-color:#CFCFCF; margin-bottom:8px" onClick="testModal()"><img src="../images/checklist.png">체크리스트</butuon>
        <butuon type="button" class="btn btn-default es_shadow" style="text-align:left; width:120px; background-color:#CFCFCF; margin-bottom:8px"><img src="../images/gihan.png">기한설정</butuon>
        <butuon type="button" class="btn btn-default es_shadow" style="text-align:left; width:120px; background-color:#CFCFCF; margin-bottom:8px"><img src="../images/c_file.png">첨부파일</butuon>
        </div>
      </div>
    </div>
  </div>
  

  