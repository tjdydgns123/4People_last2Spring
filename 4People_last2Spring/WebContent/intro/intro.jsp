<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>인트로페이지</title>
	
  <!-- Bootstrap core CSS -->
  <link href="./vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="./vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
  <link href="./vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template -->
  <link href="./css/landing-page.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR|Stylish&amp;subset=korean" rel="stylesheet">
  <script src="./vendor/jquery/jquery.min.js"></script>
  
  <style>
  	 p {
        font-family:'Noto Serif KR', serif;
        font-size:30px;
      }
     p.a{
     	font-weight: 400;
     }
     .it { font-style: italic; font-size:15px; }
	.font-h3: 'Stylish', sans-serif;
  </style>
  
  <script type="text/javascript">
  $(window).on("load",function(){
	  $('#close').bind('click', function(){
		  	$("#information").empty();
		  });
  });
  </script>

</head>

<body>

  <!-- Navigation -->
  <nav class="navbar navbar-light bg-light static-top">
    <div class="container" >
      <a class="navbar-brand text-center" href="./main.jsp">4People</a>
    </div>
      <div class="text-right">
  		 	<a class="btn btn-primary" href="../login/login.jsp">로그인</a>
      		<a class="btn btn-primary" href="../login/signUp-confirm.jsp">회원가입</a>
      </div>
  </nav>

  <!-- Masthead -->
  <header class="masthead text-white text-center">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-xl-9 mx-auto">
          <h1 class="mb-5">Build a landing page for your business or project and generate more leads!</h1>
        </div>
        <div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
          <form>
            <div class="form-row">
              <div class="col-12 col-md-9 mb-2 mb-md-0">
                <input type="email" class="form-control form-control-lg" placeholder="Enter your email...">
              </div>
              <div class="col-12 col-md-3">
                <button type="submit" class="btn btn-block btn-lg btn-primary">Sign up!</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </header>

  <!-- Icons Grid -->
    <div class="container " id='information' style='margin-bottom:20px; margin-top:20px;'>
    <button type="button" id='close' class="close" aria-label="Close" style='border:0; outline:0;'><span aria-hidden="true">&times;</span><p class='it'>닫기</p></button>
      <div class="row" style=' justify-content: center;'>
      <p class='a'>사용법</p>
<!--         <div class="col-lg-4"> -->
<!--           <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3"> -->
<!--             <div class="features-icons-icon d-flex"> -->
<!--               <i class="icon-screen-desktop m-auto text-primary"></i> -->
<!--             </div> -->
<!--             <h3>Fully Responsive</h3> -->
<!--             <p class="lead mb-0">This theme will look great on any device, no matter the size!</p> -->
<!--           </div> -->
<!--         </div> -->
<!--         <div class="col-lg-4"> -->
<!--           <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3"> -->
<!--             <div class="features-icons-icon d-flex"> -->
<!--               <i class="icon-layers m-auto text-primary"></i> -->
<!--             </div> -->
<!--             <h3>Bootstrap 4 Ready</h3> -->
<!--             <p class="lead mb-0">Featuring the latest build of the new Bootstrap 4 framework!</p> -->
<!--           </div> -->
<!--         </div> -->
<!--         <div class="col-lg-4"> -->
<!--           <div class="features-icons-item mx-auto mb-0 mb-lg-3"> -->
<!--             <div class="features-icons-icon d-flex"> -->
<!--               <i class="icon-check m-auto text-primary"></i> -->
<!--             </div> -->
<!--             <h3>Easy to Use</h3> -->
<!--             <p class="lead mb-0">Ready to use with your own content, or customize the source files!</p> -->
<!--           </div> -->
<!--         </div> -->
<div class="embed-responsive embed-responsive-16by9">
  <iframe class="embed-responsive-item" src="../images/test.mp4"></iframe>
</div>
      </div>
    </div>

  <!-- Image Showcases -->
  <section class="showcase">
    <div class="container-fluid p-0">
      <div class="row no-gutters">

        <div class="col-lg-6 order-lg-2 text-white showcase-img" style="background-image: url('img/bg-showcase-1.jpg');"></div>
        <div class="col-lg-6 order-lg-1 my-auto showcase-text">
          <h2>안드로이드</h2>
          <p class="lead mb-0">출시준비중</p>
        </div>
      </div>
      <div class="row no-gutters">
        <div class="col-lg-6 text-white showcase-img" style="background-image: url('img/bg-showcase-2.jpg');"></div>
        <div class="col-lg-6 my-auto showcase-text">
          <h2>편리한 프로젝트</h2>
          <p class="lead mb-0">글작성</p>
        </div>
      </div>
      <div class="row no-gutters">
        <div class="col-lg-6 order-lg-2 text-white showcase-img" style="background-image: url('img/bg-showcase-3.jpg');"></div>
        <div class="col-lg-6 order-lg-1 my-auto showcase-text">
          <h2>쉬운사용 &amp; 협력</h2>
          <p class="lead mb-0">글작성</p>
        </div>
      </div>
    </div>
  </section>

  <!-- Testimonials -->
  <section class="testimonials text-center bg-light">
    <div class="container">
      <h2 class="mb-5">What people are saying...</h2>
      <div class="row">
        <div class="col-lg-4">
          <div class="testimonial-item mx-auto mb-5 mb-lg-0">
            <img class="img-fluid rounded-circle mb-3" src="img/testimonials-1.jpg" alt="">
            <h5>Margaret E.</h5>
            <p class="font-weight-light mb-0">"This is fantastic! Thanks so much guys!"</p>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="testimonial-item mx-auto mb-5 mb-lg-0">
            <img class="img-fluid rounded-circle mb-3" src="img/testimonials-2.jpg" alt="">
            <h5>Fred S.</h5>
            <p class="font-weight-light mb-0">"Bootstrap is amazing. I've been using it to create lots of super nice landing pages."</p>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="testimonial-item mx-auto mb-5 mb-lg-0">
            <img class="img-fluid rounded-circle mb-3" src="img/testimonials-3.jpg" alt="">
            <h5>Sarah W.</h5>
            <p class="font-weight-light mb-0">"Thanks so much for making these free resources available to us!"</p>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Call to Action -->
  <section class="call-to-action text-white text-center">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-xl-9 mx-auto">
          <h2 class="mb-4">Ready to get started? Sign up now!</h2>
        </div>
        <div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
          <form>
            <div class="form-row">
              <div class="col-12 col-md-9 mb-2 mb-md-0">
                <input type="email" class="form-control form-control-lg" placeholder="Enter your email...">
              </div>
              <div class="col-12 col-md-3">
                <button type="submit" class="btn btn-block btn-lg btn-primary">Sign up!</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </section>

  <!-- Footer -->
  <footer class="footer bg-light">
    <div class="container">
      <div class="row">
        <div class="col-lg-6 h-100 text-center text-lg-left my-auto">
          <ul class="list-inline mb-2">
            <li class="list-inline-item">
              <a href="#">About</a>
            </li>
            <li class="list-inline-item">&sdot;</li>
            <li class="list-inline-item">
              <a href="#">Contact</a>
            </li>
            <li class="list-inline-item">&sdot;</li>
            <li class="list-inline-item">
              <a href="#">Terms of Use</a>
            </li>
            <li class="list-inline-item">&sdot;</li>
            <li class="list-inline-item">
              <a href="#">Privacy Policy</a>
            </li>
          </ul>
          <p class="text-muted small mb-4 mb-lg-0">&copy; Your Website 2019. All Rights Reserved.</p>
        </div>
        <div class="col-lg-6 h-100 text-center text-lg-right my-auto">
          <ul class="list-inline mb-0">
            <li class="list-inline-item mr-3">
              <a href="#">
                <i class="fab fa-facebook fa-2x fa-fw"></i>
              </a>
            </li>
            <li class="list-inline-item mr-3">
              <a href="#">
                <i class="fab fa-twitter-square fa-2x fa-fw"></i>
              </a>
            </li>
            <li class="list-inline-item">
              <a href="#">
                <i class="fab fa-instagram fa-2x fa-fw"></i>
              </a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </footer>

  <!-- Bootstrap core JavaScript -->
  
  <script src="./vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
