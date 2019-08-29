<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>엔코아 교육센터 방문을 환영합니다.</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


  <link href="https://fonts.googleapis.com/css?family=Muli:300,400,700,900" rel="stylesheet">
  <link rel="stylesheet" href="fonts/icomoon/style.css">

  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/jquery-ui.css">
  <link rel="stylesheet" href="css/owl.carousel.min.css">
  <link rel="stylesheet" href="css/owl.theme.default.min.css">
  <link rel="stylesheet" href="css/owl.theme.default.min.css">

  <link rel="stylesheet" href="css/jquery.fancybox.min.css">

  <link rel="stylesheet" href="css/bootstrap-datepicker.css">

  <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">

  <link rel="stylesheet" href="css/aos.css">
  <link href="css/jquery.mb.YTPlayer.min.css" media="all" rel="stylesheet" type="text/css">

  <link rel="stylesheet" href="css/style.css">



</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

  <div class="site-wrap">

    <div class="site-mobile-menu site-navbar-target">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close mt-3">
          <span class="icon-close2 js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
    </div>


    <div class="py-2 bg-light">
      <div class="container">
        <div class="row align-items-center">
          <div class="col-lg-9 d-none d-lg-block">
                                    <c:choose>
                 <c:when test="${not empty sessionScope.teacher.teacherName}">
                <li>
                    <a href="contactList.jsp" class="small mr-3"><span class="icon-question-circle-o mr-2"></span>문의보기</a>
                                <a href="#" class="small mr-3"><span class="icon-phone2 mr-2"></span> 02 754 7305 </a> 
            <a href="#" class="small mr-3"><span class="icon-envelope-o mr-2"></span> info@encore.com</a> 
                  </li>
                  </c:when>
                  <c:otherwise>
                   <li>
                   <a href="contact.jsp" class="small mr-3"><span class="icon-question-circle-o mr-2"></span>문의하기</a>
                               <a href="#" class="small mr-3"><span class="icon-phone2 mr-2"></span> 02 754 7305 </a> 
            <a href="#" class="small mr-3"><span class="icon-envelope-o mr-2"></span> info@encore.com</a>  
                  </li>
                  </c:otherwise>
                </c:choose>
          </div>
          <div class="col-lg-3 text-right">
<c:choose>
	<c:when test="${not empty sessionScope.teacher.teacherName}">
          <span class="icon-unlock-alt"></span>${sessionScope.teacher.teacherName}
        <a href="Logout" class="small btn btn-primary px-4 py-2 rounded-0"><span class="icon-users"></span>로그아웃</a>
	</c:when>
	<c:when test="${not empty sessionScope.student.studentName}">
 		<span class="icon-unlock-alt"></span>${sessionScope.student.studentName}
		<a href="Logout" class="small btn btn-primary px-4 py-2 rounded-0"><span class="icon-users"></span>로그아웃</a>
	</c:when>
	<c:otherwise>
	           <a href="login.html" class="small mr-3"><span class="icon-unlock-alt"></span>로그인 하기</a>
          <a href="register.html" class="small btn btn-primary px-4 py-2 rounded-0"><span class="icon-users"></span>회원 가입</a>
	</c:otherwise>
</c:choose>
          </div>
        </div>
      </div>
    </div>
<%@ include file="header.jsp" %>

   <div class="site-section ftco-subscribe-1 site-blocks-cover pb-4" style="background-image: url('images/bg_1.jpg')">
        <div class="container">
          <div class="row align-items-end">
            <div class="col-lg-7">
              <h2 class="mb-0">엔코아 교육센터</h2>
              <p>대한민국 최고의 IT교육센터로 도약하는 기업</p>
            </div>
          </div>
        </div>
      </div> 
    

    <div class="custom-breadcrumns border-bottom">
      <div class="container">
        <a href="#">메인</a>
        <span class="mx-3 icon-keyboard_arrow_right"></span>
        <span class="current">교육센터 소개</span>
      </div>
    </div>

    <div class="container pt-5 mb-5">
            <div class="row">
              <div class="col-lg-4">
                <h2 class="section-title-underline">
                  <span>기업 연혁</span>
                </h2>
              </div>
              <div class="history">
               <img src="images/history.JPG" alt="Image" class="img-fluid" width="600" height="800">
              </div>
             
            </div>
    </div> 

    <div class="site-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <h2 class="section-title-underline mb-5">
                        <span>왜 IT가 중요한가?</span>
                    </h2>
                    <a href="https://youtu.be/hlxY4JBULJM" class="video-1 mb-4" data-fancybox="" data-ratio="4">
             		 <span class="play">
              		  <span class="icon-play"></span>
             		 </span>
              		<img src="images/whyIT.JPG" alt="Image" class="img-fluid" width="500" height="400">
            		</a>
                    
                </div>
            </div>
        </div>
    </div>

<div class="section-bg style-1"
			style="background-image: url('images/hero_1.jpg');">
			<div class="container">
				<div class="row">
					<div class="col-lg-4 col-md-6 mb-5 mb-lg-0">
						<span class="icon flaticon-mortarboard"></span>
						<h3>교육 철학</h3>
						<p>아름다운 보석도 무가치한 돌덩이에 불과할 때가 있었습니다. 사람이 정성들여 가공한   후에야 가치가 생기는 것입니다.
							데이터 또한  그렇습니다. 세상에는 비정형한 데이터가 무척 많습니다. 그러나 개발자인 여러분의 손을 통해서 인간의 더 나은 삶에 기여할 귀중한 보석이 될 것입니다.
						</p>
					</div>
					<div class="col-lg-4 col-md-6 mb-5 mb-lg-0">
						<span class="icon flaticon-school-material"></span>
						<h3>교육 이해</h3>
						<p>수많은 비정형 데이터를 가치있는 데이터로 만드는 기술에 대해 배워나가야합니다. 탐색, 수집, 전처리, 정규화, 검증을 거쳐 데이터의 품질을 높이는것에 주안점을 두었습니다.</p>
					</div>
					<div class="col-lg-4 col-md-6 mb-5 mb-lg-0">
						<span class="icon flaticon-library"></span>
						<h3>성공의 길</h3>
						<p>여러분들만의 창의적인 생각으로 데이터를 다루어보세요. 어느 순간 데이터를 다루는 일을 즐기게 되고, 자신도 모르는 사이 전문가가 되어있을거에요.</p>
					</div>
				</div>
			</div>
		</div>

      

    <div class="site-section">
      <div class="container">
        <div class="row mb-5 justify-content-center text-center">
          <div class="col-lg-4 mb-5">
            <h2 class="section-title-underline mb-5">
              <span>강사 소개</span>
            </h2>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-4 col-md-6 mb-5 mb-lg-5">

            <div class="feature-1 border person text-center">
                <img src="images/hyunmin.jpg" alt="Image" class="img-fluid">
              <div class="feature-1-content">
                <h2>박현민</h2>
                <span class="position mb-3 d-block">알고리즘 강사</span>    
                <p>마약 알고리즘의 대가, 어느 순간 당신도 알고리즘 중독자</p>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 mb-5 mb-lg-5">
            <div class="feature-1 border person text-center">
                <img src="images/person_2.jpg" alt="Image" class="img-fluid">
              <div class="feature-1-content">
                <h2>송시찬</h2>
                <span class="position mb-3 d-block">파이썬 강사</span>    
                <p>변수 타입 선언 안해도 됨? 파이썬 꿀맛 ㅎ</p>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 mb-5 mb-lg-5">
            <div class="feature-1 border person text-center">
                <img src="images/person_3.jpg" alt="Image" class="img-fluid">
              <div class="feature-1-content">
                <h2>강민웅</h2>
                <span class="position mb-3 d-block">알고리즘, SQL 강사</span>    
                <p>찰진 입담으로 졸 틈이 없는 강사!!<br> 프로그래머스 2000등 이하 꿇어</p>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-5 mb-lg-5">

            <div class="feature-1 border person text-center">
                <img src="images/person_4.jpg" alt="Image" class="img-fluid">
              <div class="feature-1-content">
                <h2>한우석</h2>
                <span class="position mb-3 d-block">PL/SQL 강사</span>    
                <p>신용기 강사의 오른팔, 트리거 마법사</p>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 mb-5 mb-lg-5">
            <div class="feature-1 border person text-center">
                <img src="images/person_2.jpg" alt="Image" class="img-fluid">
              <div class="feature-1-content">
                <h2>신용기</h2>
                <span class="position mb-3 d-block">PL/SQL 강사</span>    
                <p>힙해지고 싶다면 그의 강의를 들으세요.</p>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 mb-5 mb-lg-5">
            <div class="feature-1 border person text-center">
                <img src="images/person_3.jpg" alt="Image" class="img-fluid">
              <div class="feature-1-content">
                <h2>김혜경</h2>
                <span class="position mb-3 d-block">교육센터장</span>    
                <p>믿고 듣는 혜경쌤 ㅎㅎ </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>


    
    


    

    
    <div class="site-section ftco-subscribe-1" style="background-image: url('images/bg_1.jpg')">
      <div class="container">
        <div class="row align-items-center">
          <div class="col-lg-7">
            <h2>구독하고 다양한 소식을 알림받으세요.</h2>
            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia,</p>
          </div>
          <div class="col-lg-5">
            <form action="" class="d-flex">
              <input type="text" class="rounded form-control mr-2 py-3" placeholder="Enter your email">
              <button class="btn btn-primary rounded py-3 px-4" type="submit">Send</button>
            </form>
          </div>
        </div>
      </div>
    </div> 


    <%@ include file="header.jsp" %>
    

  </div>
  <!-- .site-wrap -->

  <!-- loader -->
  <div id="loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#51be78"/></svg></div>

  <script src="js/jquery-3.3.1.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/jquery-ui.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/jquery.countdown.min.js"></script>
  <script src="js/bootstrap-datepicker.min.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/aos.js"></script>
  <script src="js/jquery.fancybox.min.js"></script>
  <script src="js/jquery.sticky.js"></script>
  <script src="js/jquery.mb.YTPlayer.min.js"></script>




  <script src="js/main.js"></script>

</body>

</html>