<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ page import="java.io.*" %>
<%
	String bs_fname = request.getParameter("fname");
	String filePath = "\\\\192.168.0.6\\pds\\";
// 	out.print("파일명:"+bs_fname);
	File file = new File(filePath,bs_fname);
	String mimeType = null;
	if(mimeType==null){
		response.setContentType("application/octet-stream");
	}
	String downName = new String(bs_fname.getBytes("UTF-8"),"8859_1");
	//첨부파일 이름의 경우 post방식으로 처리되므로 header영역이 아닌 body영역에 값이 담김.
	//UTF-8인 경우와 EUC-KR인 경우를 나누어서 한글 처리를 함.
	if(request.getHeader("user-agent").indexOf("MSIE")==-1){
		downName = new String(bs_fname.getBytes("UTF-8"),"8859_1");
	}else{
		downName = new String(bs_fname.getBytes("EUC-KR"),"8859_1");
	}
	response.setHeader("Content-Disposition","attachment;filename="+downName);
	FileInputStream fis = new FileInputStream(file);
	out.clear();
	ServletOutputStream sos = response.getOutputStream();
	try{
		byte b[] = new byte[1024*10];
		int data = 0;
		//파일객체에서 읽어들인 정보가 -1(End of file)더 이상 없으면 -1로 처리됨.
		while((data=(fis.read(b,0,b.length)))!=-1){
			//실제 파일이름 객체에 파일내용 쓰기 처리.
			sos.write(b,0,data);
		}
		sos.flush();
	}catch(Exception e){
		out.print(e.toString());
	}finally{
		if(fis!=null) fis.close();
		if(sos !=null) sos.close();
	}
//한글파일이름인 경우 한글처리문제 체크
//File생성 - 해당 첨부파일이 생성되는게 아니다.
//OutputStream을 이용해서 write메소드 호출 - 쓰기
//다운완료
%>