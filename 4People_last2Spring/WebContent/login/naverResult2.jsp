<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.BufferedReader, java.io.InputStreamReader, java.net.HttpURLConnection,java.net.URL,java.net.URLEncoder" %>    
<%
	String token = "AAAAOELoYpwJZc4Zc1JT6V1p75p53QPhKxuUYoaqUjALVI4BppAsWut8tznW5haY3Wg9YDS-oGwPu8J5gNmFGrM7fkE";// 네이버 로그인 접근 토큰;
	String header = "Bearer " + token; // Bearer 다음에 공백 추가
	try {
	    String apiURL = "https://openapi.naver.com/v1/nid/me";
	    URL url = new URL(apiURL);
	    HttpURLConnection con = (HttpURLConnection)url.openConnection();
	    con.setRequestMethod("GET");
	    con.setRequestProperty("Authorization", header);
	    int responseCode = con.getResponseCode();
	    BufferedReader br;
	    if(responseCode==200) { // 정상 호출
	        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	    } else {  // 에러 발생
	        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	    }
	    String inputLine;
	    StringBuffer sb_response = new StringBuffer();
	    while ((inputLine = br.readLine()) != null) {
	        sb_response.append(inputLine);
	    }
	    br.close();
	    System.out.println(response.toString());
	} catch (Exception e) {
	    System.out.println(e);
	}
%>