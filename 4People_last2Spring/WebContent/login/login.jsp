<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>

<!DOCTYPE html>
<html>
<head>

   <title>Login</title>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="./vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="./fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="./vendor/animate/animate.css">
<!--===============================================================================================-->   
   <link rel="stylesheet" type="text/css" href="./vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="./vendor/select2/select2.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="./css/util.css">   
   <link rel="stylesheet" type="text/css" href="./css/main.css">
<!--===============================================================================================-->
<link href="https://fonts.googleapis.com/css?family=Cute+Font|Noto+Sans+KR|Noto+Serif+KR" rel="stylesheet">
<style type="text/css">

	.es_login100-form-title {
	  font-family: 'Noto Sans KR', sans-serif;
	  font-size: 50px;
	  font-weight:bold;
	  line-height: 1.2;
	  text-align: center;
/* 	  color: #003366; */
/*      background:linear-gradient( to right, #003366, #5CD1E5 ); */
    background: linear-gradient(to right, #003366, #5CD1E5);
   -webkit-background-clip: text;
   -webkit-text-fill-color: transparent;
	  width: 100%;
	  display: block;
	  padding-bottom: 54px;

}
 
</style>
<script type="text/javascript">
       function ID(){
          alert($("#name").val());
          alert($("#hp").val());
          alert($("#br").val());
       }
       function loginCall(){
          $("#f_login").attr("method","POST");
          $("#f_login").attr("action","./login");
          $("#f_login").submit();      
       }
       function findid(){
           var mem_name = $('#name_text').val();
           var mem_phone = $('#phone_text').val();
          var param = "mem_name="+mem_name+"&mem_phone="+mem_phone;
          alert(mem_name);
          alert(mem_phone);
          $.ajax({
             type:"POST"
             ,url:"../login/findId"
             ,data:param
             ,success:function(data){
                 var result = JSON.stringify(data);
                 alert('result='+result);
                 alert('data='+data);
                $('#idresult').empty();   
                var tag;   
                     if(data==""){
                        tag = "성명과 전화번호가 일치하지 않습니다.";
                        }
                     else{
                        tag = data;
                        }
                      $('#idresult').append(tag);   
             } ,error:function(request,status,error){
                 
                 alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
           }
          });
           }
       function findpw(){
           var mem_id = $('#p_id_text').val();
           var mem_name = $('#p_name_text').val();
          var param = "mem_name="+mem_name+"&mem_id="+mem_id;
          $.ajax({
             type:"POST"
             ,url:"../login/findpw"
             ,data:param
             ,success:function(data){
                 var result = JSON.stringify(data);
                 alert('result='+result);
                 alert('data='+data);
                $('#pwresult').empty();   
                var tag;   
                     if(data==""){
                        tag = "성명과 아이디가 일치하지 않습니다.";
                        }
                     else{
                        tag = data;
                        }
                      $('#pwresult').append(tag);   
             } ,error:function(request,status,error){
                 
                 alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
           }
          });
           }
      </script>

<%
String clientId = "fQGI7_Qyq4FUUGzgcRyP";//애플리케이션 클라이언트 아이디값";
String redirectURI = URLEncoder.encode("http://192.168.0.218:9000/4People_last2Spring/login/naverLogin", "UTF-8");
SecureRandom random = new SecureRandom();
String state = new BigInteger(130, random).toString();
String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
apiURL += "&client_id=" + clientId;
apiURL += "&redirect_uri=" + redirectURI;
apiURL += "&state=" + state;
session.setAttribute("state", state);
 %>


</head>
<body>


      <div class="container-login100">
         <div class="wrap-login100">
            <div class="login100-pic js-tilt" data-tilt style='padding:30px; padding-top:60px;'>
               <img class="rounded-circle" width='250px;'height='250px;'src="https://media.licdn.com/dms/image/C510BAQF831qXpG4I0Q/company-logo_200_200/0?e=2159024400&v=beta&t=Cx2Wf0Yt1sW2as-Zu0ZGv8SPRyTMnNoKYjOG5fzLaBY" alt="IMG">
            </div>

            <div class="login100-form validate-form" style='background:#FFF' >
               <span class="es_login100-form-title">
                  	육토피아
               </span>
            <form id="f_login" class="form-signin" method="POST">
               <div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
                  <input class="input100" type="text" id="uid" name="mem_id" placeholder="Email">
                  <span class="focus-input100"></span>
                  <span class="symbol-input100">
                     <i class="fa fa-envelope" aria-hidden="true"></i>
                  </span>
               </div>

               <div class="wrap-input100 validate-input" data-validate = "Password is required">
                  <input class="input100" type="password" id="upw" name="mem_pw" placeholder="Password">
                  <span class="focus-input100"></span>
                  <span class="symbol-input100">
                     <i class="fa fa-lock" aria-hidden="true"></i>
                  </span>
               </div>
               <div class="container-login100-form-btn">
                  <button class="login100-form-btn" onclick="loginCall()" style='background: #003366;'>
                     로그인
                  </button>
               </div>
               <br>
               <div class='col-sm-12' align="center">
                 <a  href="./naverLogin"><img width="45%;"height="45" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
               <!-- 구글 로그인 화면으로 이동 시키는 URL -->
               <!-- 구글 로그인 화면에서 ID, PW를 올바르게 입력하면 oauth2callback 메소드 실행 요청-->
               <span class='text-right' id="google_id_login" style="text-align:right; margin-top:6px;">
               <a href="./googleLogin" class='btn btn-default' style='width:45%; background-color:#FFF; border: 1px solid #BDBDBD;'>
               <img width='27px;' height='27px;' src='../images/googleLogin2.png'>
               <span class='text-center'>로그인</span>
               </a>
               </span>
               </div>
            </form>   

               <div class="text-center p-t-12">
                  
                  <span class="txt1">
                     아이디
                  </span>
                  <a class="txt2" href="#" data-toggle="modal" data-target="#idfind_modal">
                     찾기
                  </a>
                  <span class="txt1">
                     /&nbsp;비밀번호
                  </span>
                  <a class="txt2" href="#" data-toggle="modal" data-target="#pwfind_modal">
                     찾기
                  </a>
               </div>
               <div class="text-center p-t-136">
                  <a id="ghldnjsrkdlq" class="txt2" href="./signUp-confirm.jsp" style='font-size:20px;'>
                     회원가입
                     <i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
                  </a>
               </div>
            </div>
         </div>
      </div>
   
   
 <!-- 모달  -->
         <div id="idfind_modal" class="modal modal-lg" role="dialog">
        <div class="modal-dialogg">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">아이디찾기</h4>
        <button type="button" class="close" data-dismiss="modal">×</button>
      </div>
      <div class="modal-body">
        <input type="text" id="name_text" placeholder="이름을 입력하세요.">
        <input type="text" id="phone_text" placeholder="전화번호를 입력하세요.">
        <br><br>
        <button type="button" class="btn btn-default"  onClick="findid()">찾기</button>
      </div>
      <div class="modal-footer">
      <div id="idresult">
      </div>
         </div>
       </div>
       
        </div>
      </div>
        <!-- 모달  -->
 <!-- 모달  -->
         <div id="pwfind_modal" class="modal modal-lg" role="dialog">
        <div class="modal-dialogg">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">비밀번호찾기</h4>
        <button type="button" class="close" data-dismiss="modal">×</button>
      </div>
      <div class="modal-body">
        <input type="text" id="p_id_text" placeholder="아이디를 입력하세요.">
        <input type="text" id="p_name_text" placeholder="이름을 입력하세요.">
        <br><br>
        <button type="button" class="btn btn-default"  onClick="findpw()">찾기</button>
      </div>
      <div class="modal-footer">
      <div id="pwresult">
      </div>	
         </div>
       </div>
        </div>
      </div>
        <!-- 모달  -->
   
<!--===============================================================================================-->   
   <script src="./vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
   <script src="./vendor/bootstrap/js/popper.js"></script>
   <script src="./vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
   <script src="./vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
   <script src="./vendor/tilt/tilt.jquery.min.js"></script>
   

</body>
</html>