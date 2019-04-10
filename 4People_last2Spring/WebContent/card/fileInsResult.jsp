<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="java.util.Map, java.util.List, java.util.Iterator, java.util.ArrayList" %>
     <%
     List<Map<String,Object>> cardList = ( List<Map<String,Object>>)request.getAttribute("cardList");
     List<String> fileList = (List<String>)cardList.get(0).get("fileMap");
     List<String> att_no = new ArrayList<String>(); 
     List<String> att_name = new ArrayList<String>(); 
     List<String> sub_att_name = new ArrayList<String>(); 
     List<String> att_date = new ArrayList<String>(); 
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
      <%if(fileList!=null) {%>
      <div id="<%=att_no.get(0) %>">
         <div class="col-sm-2"><button style="width:50px;height:50px;background-color:#D9D9D9" onClick="filedown('<%=att_name.get(0) %>')"><%
         if(sub_att_name.get(0).equals("ppt")||sub_att_name.get(0).equals("pptx")){%>
       	  <img src="../images/powerpoint.png">
         <%}else if(sub_att_name.get(0).equals("execel")||sub_att_name.get(0).equals("xlsx")||sub_att_name.get(0).equals("xls")){%>
       	  <img src="../images/excel.png">
        <%} else if(sub_att_name.get(0).equals("png")){%>
       	  <img src="../images/png.png">
        <%}else if(sub_att_name.get(0).equals("gif")){ %>
       	  <img src="../images/gif.png">
        <%}else if(sub_att_name.get(0).equals("word")||sub_att_name.get(0).equals("docx")){ %>
       	  <img src="../images/word.png">
        <%} else if(sub_att_name.get(0).equals("txt")){%>
       	  <img src="../images/txt.png">
        <%} else if(sub_att_name.get(0).equals("hwp")){%>
       	  <img src="../images/hwp.png">
       	  <%}else { %>
       	  sub_att_name.get(0)
       	  <%} %>
         </button></div>
		 <div class="col-sm-10">      
         <div><label><%=att_name.get(0) %></label></div>
         <div class="row"><label><%=att_date.get(0) %></label></div>
         </div>
         	<a id="<%=att_no.get(0) %>" href="#" style="margin-left:100%" onClick="file_del(id)"><img src="../images/close-cross.png"></a>
         	</div>
		<%} %>
<script type="text/javascript">
// opener.parent.location.reload();
// location.reload();
// history.go(0);
// window.close();
// $('#cardmodal').modal('show');
</script>
