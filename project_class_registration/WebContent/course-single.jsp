<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

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
              <h2 class="mb-0"></h2>
              <p></p>
            </div>
          </div>
        </div>
      </div> 
    

    <div class="custom-breadcrumns border-bottom">
      <div class="container">
        <a href="index.jsp">메인</a>
        <span class="mx-3 icon-keyboard_arrow_right"></span>
        <a href="admissions.jsp">수강 신청</a>
        <span class="mx-3 icon-keyboard_arrow_right"></span>
        <span class="current">과목</span>
      </div>
    </div>

    <div class="site-section">
        <div class="container">
            <div class="row">
                <div class="col-md-6 mb-4">
                    <p>
                        <img src="images/course_5.jpg" alt="Image" class="img-fluid">
                    </p>
                </div>
                <div class="col-lg-5 ml-auto align-self-center">
                        <h2 class="section-title-underline mb-5">
                            <span>과목 소개</span>
                        </h2>
                        <p><strong class="text-black d-block">과목명 :</strong>${getClass.className}</p>
                        <p><strong class="text-black d-block">수강료 : </strong>${getClass.classPrice}</p>
                        <p><strong class="text-black d-block">강사 :</strong>${getClass.teacherName}</p>
                        <p class="mb-5"><strong class="text-black d-block">요일 :</strong> ${getClass.classTime}</p>
                        <p class="mb-5"><strong class="text-black d-block">제한인원 :</strong> ${getClass.maxStudent}</p>
                        <p class="mb-5"><strong class="text-black d-block">소개 :</strong> ${getClass.simpleIntro}</p>
                        <p class="mb-5"><strong class="text-black d-block">세부사항 :</strong> ${getClass.detailIntro}</p>
    
                        <ul class="ul-check primary list-unstyled mb-5">
                            <p class="mb-5"><strong class="text-black d-block">시작일 :</strong> ${getClass.startDay}</p>
                            <br>
                            <br>
                            <p class="mb-5"><strong class="text-black d-block">종료일 :</strong> ${getClass.endDay}</p>
                            <br>
                        </ul>

                        <p>
                            <a href="Controller?command=createRegistration&classCode=${getClass.classCode}&studentId=${sessionScope.student.studentId}&startDay=${getClass.startDay}&endDay= ${getClass.endDay}" class="btn btn-primary rounded-0 btn-lg px-5">신청하기</a>
                        </p>
    
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

      

    <div class="footer">
      <div class="container">
        <div class="row">
          <div class="col-lg-3">
            <p class="mb-4"><img src="images/logo.png" alt="Image" class="img-fluid"></p>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Beatae nemo minima qui dolor, iusto iure.</p>  
            <p><a href="#">Learn More</a></p>
          </div>
          <div class="col-lg-3">
            <h3 class="footer-heading"><span>Our Campus</span></h3>
            <ul class="list-unstyled">
                <li><a href="#">Acedemic</a></li>
                <li><a href="#">News</a></li>
                <li><a href="#">Our Interns</a></li>
                <li><a href="#">Our Leadership</a></li>
                <li><a href="#">Careers</a></li>
                <li><a href="#">Human Resources</a></li>
            </ul>
          </div>
          <div class="col-lg-3">
              <h3 class="footer-heading"><span>Our Courses</span></h3>
              <ul class="list-unstyled">
                  <li><a href="#">Math</a></li>
                  <li><a href="#">Science &amp; Engineering</a></li>
                  <li><a href="#">Arts &amp; Humanities</a></li>
                  <li><a href="#">Economics &amp; Finance</a></li>
                  <li><a href="#">Business Administration</a></li>
                  <li><a href="#">Computer Science</a></li>
              </ul>
          </div>
          <div class="col-lg-3">
              <h3 class="footer-heading"><span>Contact</span></h3>
              <ul class="list-unstyled">
                  <li><a href="#">Help Center</a></li>
                  <li><a href="#">Support Community</a></li>
                  <li><a href="#">Press</a></li>
                  <li><a href="#">Share Your Story</a></li>
                  <li><a href="#">Our Supporters</a></li>
              </ul>
          </div>
        </div>

        <div class="row">
          <div class="col-12">
            <div class="copyright">
                <p>
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank" >Colorlib</a>
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    </p>
            </div>
          </div>
        </div>
      </div>
    </div>
    

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