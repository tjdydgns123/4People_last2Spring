<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	String url = "jdbc:oracle:thin:@192.168.0.59:1521:orcl11";
	Connection con = null;
	ResultSet rs = null;
	String mem_id = "test"; //단위테스트를 하기위해 상수로 처리
	String mem_pw = "123";
	String mem_name = ""; //최종적으로 출력되는 값임
	StringBuffer sql = new StringBuffer();
	sql.append("SELECT mem_name FROM chat_member WHERE mem_id='"+mem_id+"' AND mem_pw='"+mem_pw+"'");
	try{
		//드라이버 클래스를 로딩한다. (안드로이드의 경우는 필요 없다. 왜? : 내장되어있으니까)
		//제품군의 이름을 알 수 있다. (서버에 대한 다른 정보도 알 수 있음)
		Class.forName("oracle.jdbc.driver.OracleDriver");
		//물리적으로 떨어져있는 서버제품과 연결통로를 확보함.
		con = DriverManager.getConnection(url, "scott","tiger");
		//쿼리문을 전달할 전령객체 필요. 처리에 대한 요청(select문)
		stmt = con.createStatement();
		rs = stmt.executeQuery(sql.toString());
		rs.next();//커서를 이동해달라는 명령이므로 while문이 없어도 됨
		mem_name=rs.getString("mem_name");
	}catch(SQLException se){
		
	}catch(Exception e){
		
	}finally{
		//사용한 자원에 대한 반납을 명시적으로 처리
		//만일 생략하면 당장은 에러가 발생하지 않지만 자웒
		try{
			if(rs!=null) rs.close();
			if(stmt!=null) stmt.close();
			if(con!=null) con.close();
		}catch{
			
		}
	}
	out.print(mem_name);
%>
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>androidOracleConnection.jsp</title>
</head>
<body>

</body>
</html> -->