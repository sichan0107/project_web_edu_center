<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>엔코아 교육센터 방문을 환영합니다.</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="https://fonts.googleapis.com/css?family=Muli:300,400,700,900"
	rel="stylesheet">
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
<link href="css/jquery.mb.YTPlayer.min.css" media="all" rel="stylesheet"
	type="text/css">

<link rel="stylesheet" href="css/style.css">



</head>

<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">

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
		<header class="site-navbar py-4 js-sticky-header site-navbar-target"
			role="banner">

			<div class="container">
				<div class="d-flex align-items-center">
					<div class="site-logo">
						<a href="index.jsp" class="d-block"> <img
							src="images/logo.jpg" alt="Image" class="img-fluid">
						</a>
					</div>
					<div class="mr-auto">
						<nav class="site-navigation position-relative text-right"
							role="navigation">
							<ul
								class="site-menu main-menu js-clone-nav mr-auto d-none d-lg-block">
								<li><a href="index.jsp" class="nav-link text-left">메인</a></li>
								<li><a href="about.jsp" class="nav-link text-left">교육센터
										소개</a></li>
                <li>
                  <a href="CourseCheck?command=admissions" class="nav-link text-left">수강 신청</a>
                </li>
                <c:choose>
                <c:when test="${not empty sessionScope.student.studentName}">
                <li>
 <a href='CourseCheck?command=coursesById&studentId=${sessionScope.student.studentId}' class="nav-link text-left">수강 내역</a>
                </li>
                </c:when>
                <c:when test="${not empty sessionScope.teacher.teacherName}">
                <li>
                  <a href='CourseCheck?command=courseList&teacherName=${sessionScope.teacher.teacherName}' class="nav-link text-left">나의 강의</a>
                </li>
                </c:when>
                 <c:otherwise>
                <li>
                  <a href="CourseCheck?command=courses" class="nav-link text-left">수강 내역</a>
                </li>
                </c:otherwise>
                </c:choose>
              <c:choose>
                 <c:when test="${not empty sessionScope.teacher.teacherName}">
                <li>
                    <a href="Controller?command=getAllQuestion" class="nav-link text-left">문의보기</a>
                  </li>
                  </c:when>
                  <c:otherwise>
                                  <li>
                    <a href="contact.jsp" class="nav-link text-left">문의하기</a>
                  </li>
                  </c:otherwise>
                </c:choose>
							</ul>
							</ul>
						</nav>

					</div>
					<div class="ml-auto">
						<div class="social-wrap">
							<a href="#"><span class="icon-facebook"></span></a> <a href="#"><span
								class="icon-twitter"></span></a> <a href="#"><span
								class="icon-linkedin"></span></a> <a href="#"
								class="d-inline-block d-lg-none site-menu-toggle js-menu-toggle text-black"><span
								class="icon-menu h3"></span></a>
						</div>
					</div>

				</div>
			</div>

		</header>

		<div class="site-section ftco-subscribe-1 site-blocks-cover pb-4"
			style="background-image: url('images/bg_1.jpg')">
			<div class="container">
				<div class="row align-items-end">
					<div class="col-lg-7">
						<h2 class="mb-0">강의 평가 보기</h2>
						<p></p>
					</div>
				</div>
			</div>
		</div>


		<div class="custom-breadcrumns border-bottom">
			<div class="container">
				<a href="index.jsp">메인</a> <span
					class="mx-3 icon-keyboard_arrow_right"></span> <a
					href="admissions.jsp">수강신청</a> <span
					class="mx-3 icon-keyboard_arrow_right"></span> <span
					class="current">강의 평가 보기</span>
			</div>
		</div>


		<!--  평가내역 내역 리스트 보여주기 -->

		<table align="center" border="0" cellpadding="5" cellspacing="2"
			width="100%" bordercolordark="white" bordercolorlight="black">
			<tr>
				<td bgcolor="#336699">
					<p align="center">
						<font color="white"><b><span style="font-size: 9pt;">작성자</span></b></font>
					</p>
				</td>
				<td bgcolor="#336699">
					<p align="center">
						<font color="white"><b><span style="font-size: 9pt;">평가
									내용</span></b></font>
					</p>
				</td>
				<td bgcolor="#336699">
					<p align="center">
						<font color="white"><b><span style="font-size: 9pt;">작성일</span></b></font>
					</p>
				</td>
			</tr>

			<c:if test="${empty list || fn:length(list) == 0}">
				<tr>
					<td colspan="5">
						<p align="center">
							<b><span style="font-size: 9pt;">평가내역이 없습니다.</span></b>
						</p>
					</td>
				</tr>
			</c:if>

			<c:forEach items="${requestScope.list}" var="data">
				<tr>

					<td bgcolor="">
						<p align="center">
							<span style="font-size: 9pt;"> ${data.studentId}</span>
						</p>
					</td>
					<td bgcolor="">
						<p align="center">
							<span style="font-size: 9pt;"> 
									${data.evaluationContent}
							</span>
						</p>
					</td>
					<td bgcolor="">
						<p align="center">
							<span style="font-size: 9pt;">  ${data.evaluationDay}
							</span>
						</p>
					</td>
				</tr>
			</c:forEach>

			<tr>
				<td bgcolor="">
					<p align="center">
						<span style="font-size: 9pt;"></span>
					</p>
				</td>
				<td bgcolor="">
					<p align="center">
						<span style="font-size: 9pt;"></span>
					</p>
				</td>
				<td bgcolor="">
					<p align="center">
						<span style="font-size: 9pt;"></span>
					</p>
				</td>
			</tr>

		</table>





		<a href="CourseCheck?command=writeEvaluation&classCode=${requestScope.classCode}"
			class="small btn btn-primary px-4 py-2 rounded-0"><span
			class="icon-users"></span>수강평 쓰기</a>

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
						<p class="mb-4">
							<img src="images/logo.png" alt="Image" class="img-fluid">
						</p>
						<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
							Beatae nemo minima qui dolor, iusto iure.</p>
						<p>
							<a href="#">Learn More</a>
						</p>
					</div>
					<div class="col-lg-3">
						<h3 class="footer-heading">
							<span>Our Campus</span>
						</h3>
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
						<h3 class="footer-heading">
							<span>Our Courses</span>
						</h3>
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
						<h3 class="footer-heading">
							<span>Contact</span>
						</h3>
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
								Copyright &copy;
								<script>
									document.write(new Date().getFullYear());
								</script>
								All rights reserved | This template is made with <i
									class="icon-heart" aria-hidden="true"></i> by <a
									href="https://colorlib.com" target="_blank">Colorlib</a>
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
	<div id="loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#51be78" /></svg>
	</div>

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