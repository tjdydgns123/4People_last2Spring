<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <bean id="data-source-target" class="org.springframework.jdbc.datasource.DriverManagerDataSource">
		<property name="driverClassName">
			<value>oracle.jdbc.driver.OracleDriver</value>
		</property>
		<property name="url">
			<value>jdbc:oracle:thin:@192.168.0.59:1521:orcl11</value>
		</property>
		<property name="username">
			<value>PEOPLE</value>
		</property>
		<property name="password">
			<value>ABCD1234</value>
		</property>
	</bean>
    
    <%
    String url = "jdbc:oracle:thin:@192.168.0.59:1521:orcl11";
    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;
    String mem_id =request.getParameter("mem_id");
    String mem_pw =request.getParameter("mem_pw");
    String mem_name="";
    StringBuffer sql = new StringBuffer();
    sql.append("select mem_name from member where mem_id='"+mem_id+"'"+"And mem_pw='"+mem_pw+"'");
    
    try{
    	// 드라이버 클래스를 로딩한다 .
    	// 제품군의 이름을 알수있다 .
    	Class.forName("oracle.jdbc.driver.OracleDriver");
    	// 물리적으로 떨어져있는 서버 제품과 연결통로를 확보함 .
    	con = DriverManager.getConnection(url,"PEOPLE","ABCD1234");
    	stmt = con.createStatement();
    	rs = stmt.executeQuery(sql.toString());
    	rs.next();
    	mem_name=rs.getString("mem_name");
    	
    }
    catch(SQLException se){
    	
    }catch(Exception e){
    	
    }finally{
    	try{
    		if(rs!=null) rs.close();
    		if (stmt !=null) stmt.close();
    		if(con != null) con.close();
    	}catch(Exception e2){
    		
    	}
    }
    out.print(mem_name);
    %>
    
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html> -->