<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList,registration.model.dto.ChartDTO"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

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
		<%@ include file="header.jsp" %>

		<div class="site-section ftco-subscribe-1 site-blocks-cover pb-4"
			style="background-image: url('images/bg_1.jpg')">
			<div class="container">
				<div class="row align-items-end">
					<div class="col-lg-7">
						<h2 class="mb-0">수강 신청</h2>
						<p>본인을 위한 최고의 강의를 찾아주세요.</p>
					</div>
				</div>
			</div>
		</div>


		<div class="custom-breadcrumns border-bottom">
			<div class="container">
				<a href="index.jsp">메인</a> <span
					class="mx-3 icon-keyboard_arrow_right"></span> <span
					class="current">수강 신청</span>
			</div>
		</div>


		<div class="site-section">
			<div class="container">


				<div class="row mb-5 justify-content-center text-center">
					<div class="col-lg-6 mb-5">
						<h2 class="section-title-underline mb-3">
							<span>엔코아 대표 강의</span>
						</h2>
						<p>Choose the best one for yourself</p>
					</div>
				</div>

				<div class="site-section">
					<div class="container">
						<div class="row">
							<div class="col-lg-4 col-md-6 mb-4">
								<div class="course-1-item">
									<figure class="thumnail">
										<a href="course-single.jsp"><img src="images/course_1.jpg"
											alt="Image" class="img-fluid"></a>
										<div class="price">10만원</div>
										<div class="category">
											<h3>초급 자바 알고리즘</h3>
										</div>
									</figure>
									<div class="course-1-content pb-4">
										<h2>자바 문법을 배운적이 없다면?</h2>
										<div class="rating text-center mb-3">
											<span class="icon-star2 text-warning"></span> <span
												class="icon-star2 text-warning"></span> <span
												class="icon-star2 text-warning"></span>
										</div>
										<p class="desc mb-4">이해하기 쉬운 기초 자바 강의를 통해 기본적인 알고리즘 해결력과
											사고력을 동시에 기를 수 있습니다.</p>
										<p>
											<a href="CourseCheck?command=evaluation&classCode=A1"
												class="btn btn-primary rounded-0 px-4">강의평가보기</a><br>
											<br> <a href="Controller?command=getClass&classCode=A1"  
												class="btn btn-primary rounded-0 px-4">수강신청하기</a>
												
										</p>
									</div>
								</div>
							</div>

							<div class="col-lg-4 col-md-6 mb-4">
								<div class="course-1-item">
									<figure class="thumnail">
										<a href="course-single.jsp"><img src="images/course_2.jpg"
											alt="Image" class="img-fluid"></a>
										<div class="price">15만원</div>
										<div class="category">
											<h3>중급 자바 알고리즘</h3>
										</div>
									</figure>
									<div class="course-1-content pb-4">
										<h2>깊은 알고리즘의 이해를 향해</h2>
										<div class="rating text-center mb-3">
											<span class="icon-star2 text-warning"></span> <span
												class="icon-star2 text-warning"></span> <span
												class="icon-star2 text-warning"></span> <span
												class="icon-star2 text-warning"></span>
										</div>
										<p class="desc mb-4">일상생활에서 발생하는 문제들을 알고리즘을 통해 해결함으로써 복잡하고
											반복된 계산과정을 줄일 수 있습니다.</p>
										<p>
											<a href="CourseCheck?command=evaluation&classCode=A2"
												class="btn btn-primary rounded-0 px-4">강의평가보기</a><br>
											<br> <a href="Controller?command=getClass&classCode=A2"  
												class="btn btn-primary rounded-0 px-4">수강신청하기</a>
										</p>
									</div>
								</div>
							</div>

							<div class="col-lg-4 col-md-6 mb-4">
								<div class="course-1-item">
									<figure class="thumnail">
										<a href="course-single.jsp"><img src="images/course_3.jpg"
											alt="Image" class="img-fluid"></a>
										<div class="price">20만원</div>
										<div class="category">
											<h3>고급 자바 알고리즘</h3>
										</div>
									</figure>
									<div class="course-1-content pb-4">
										<h2>알고리즘의 선구자가 되려면?</h2>
										<div class="rating text-center mb-3">
											<span class="icon-star2 text-warning"></span> <span
												class="icon-star2 text-warning"></span> <span
												class="icon-star2 text-warning"></span> <span
												class="icon-star2 text-warning"></span> <span
												class="icon-star2 text-warning"></span>
										</div>
										<p class="desc mb-4">고급 알고리즘을 통해 뛰어난 알고리즘 해결력과 사고력으로 기존에
											없던 알고리즘을 발견하세요.</p>
										<p>
											<a href="CourseCheck?command=evaluation&classCode=A3"
												class="btn btn-primary rounded-0 px-4">강의평가보기</a><br>
											<br> <a href="Controller?command=getClass&classCode=A3"  
												class="btn btn-primary rounded-0 px-4">수강신청하기</a>
										</p>
									</div>
								</div>
							</div>


							<div class="col-lg-4 col-md-6 mb-4">
								<div class="course-1-item">
									<figure class="thumnail">
										<a href="course-single.jsp"><img src="images/course_4.jpg"
											alt="Image" class="img-fluid"></a>
										<div class="price">10만원</div>
										<div class="category">
											<h3>기초 통계 분석</h3>
										</div>
									</figure>
									<div class="course-1-content pb-4">
										<h2>계산기 하나로 할 수 있는 통계학</h2>
										<div class="rating text-center mb-3">
											<span class="icon-star2 text-warning"></span> <span
												class="icon-star2 text-warning"></span> <span
												class="icon-star2 text-warning"></span> <span
												class="icon-star2 text-warning"></span>
										</div>
										<p class="desc mb-4">수학을 잘하지 못 하더라도 계산기 하나만 가지고 있다면 누구나 할
											수 있는 쉬운 통계학</p>
										<p>
											<a href="CourseCheck?command=evaluation&classCode=S1"
												class="btn btn-primary rounded-0 px-4">강의평가보기</a><br>
											<br> <a href="Controller?command=getClass&classCode=S1"
												class="btn btn-primary rounded-0 px-4">수강신청하기</a>
										</p>
									</div>
								</div>
							</div>

							<div class="col-lg-4 col-md-6 mb-4">
								<div class="course-1-item">
									<figure class="thumnail">
										<a href="course-single.jsp"><img src="images/course_5.jpg"
											alt="Image" class="img-fluid"></a>
										<div class="price">25만원</div>
										<div class="category">
											<h3>파이썬으로 배우는 물리학</h3>
										</div>
									</figure>
									<div class="course-1-content pb-4">
										<h2>현실에서 실험할 수 없다면?</h2>
										<div class="rating text-center mb-3">
											<span class="icon-star2 text-warning"></span> <span
												class="icon-star2 text-warning"></span> <span
												class="icon-star2 text-warning"></span> <span
												class="icon-star2 text-warning"></span> <span
												class="icon-star2 text-warning"></span>
										</div>
										<p class="desc mb-4">강의를 수강하고 현실에서 발생하지만 실험 불가능한 물리현상을
											연구하고 실험하여 보세요.</p>
										<p>
											<a href="CourseCheck?command=evaluation&classCode=P1"
												class="btn btn-primary rounded-0 px-4">강의평가보기</a><br>
											<br> <a href="Controller?command=getClass&classCode=P1"
												class="btn btn-primary rounded-0 px-4">수강신청하기</a>
										</p>
									</div>
								</div>
							</div>

							<div class="col-lg-4 col-md-6 mb-4">
								<div class="course-1-item">
									<figure class="thumnail">
										<a href="course-single.jsp"><img src="images/course_6.jpg"
											alt="Image" class="img-fluid"></a>
										<div class="price">30만원</div>
										<div class="category">
											<h3>데이터 분석 전문가</h3>
										</div>
									</figure>
									<div class="course-1-content pb-4">
										<h2>데이터 과학자의 마지막 길</h2>
										<div class="rating text-center mb-3">
											<span class="icon-star2 text-warning"></span> <span
												class="icon-star2 text-warning"></span> <span
												class="icon-star2 text-warning"></span> <span
												class="icon-star2 text-warning"></span> <span
												class="icon-star2 text-warning"></span>
										</div>
										<p class="desc mb-4">R을 활용한 데이터 분석과 시각화 툴을 활용하여 기존에 존재하지
											않던 데이터 가치를 창출할 수 있습니다.</p>
										<p>
											<a href="CourseCheck?command=evaluation&classCode=D3"
												class="btn btn-primary rounded-0 px-4">강의평가보기</a><br>
											<br> <a href="Controller?command=getClass&classCode=D3"
												class="btn btn-primary rounded-0 px-4">수강신청하기</a>
										</p>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>


		<div class="row mb-5 justify-content-center text-center">
			<div class="col-lg-6 mb-5">
				<h2 class="section-title-underline mb-3">
					<span>엔코아 강의 전체보기</span>
				</h2>
				<p>자신에게 맞는 최고의 강의를 찾아주세요.</p>
			</div>
		</div>





<table align="center" border="0" cellpadding="5" cellspacing="2" width="100%" bordercolordark="white" bordercolorlight="black">
	<tr>
 
        <td bgcolor="#336699">
            <p align="center"><font color="white"><b><span style="font-size:13pt;">과목 명</span></b></font></p>
        </td>
        <td bgcolor="#336699">
            <p align="center"><font color="white"><b><span style="font-size:13pt;">강사명</span></b></font></p>
        </td>
                <td bgcolor="#336699">
            <p align="center"><font color="white"><b><span style="font-size:13pt;">시작일</span></b></font></p>
        </td>
                      <td bgcolor="#336699">
            <p align="center"><font color="white"><b><span style="font-size:13pt;">종료일</span></b></font></p>
        </td>
                <td bgcolor="#336699">
            <p align="center"><font color="white"><b><span style="font-size:13pt;">강의 평가</span></b></font></p>
        </td>
                <td bgcolor="#336699">
            <p align="center"><font color="white"><b><span style="font-size:13pt;">수강 신청</span></b></font></p>
        </td>
    </tr>
    
 	<c:if test="${empty list || fn:length(list) == 0}">
		<tr>
	        <td colspan="5">
	            <p align="center"><b><span style="font-size:13pt;">신청 가능한 과목이 없습니다.</span></b></p>
	        </td>
	    </tr>
	</c:if>

	<%-- ArrayList에  GuestBookBean 객체를 하나하나 data라는 반복 대입해서 사용 --%>
	<c:forEach items="${requestScope.list}" var="data">
		    <tr>
	

		        <td bgcolor="">
		        <a href="Controller?command=getClass&classCode=${data.classCode}" >
		            <p align="center"><span style="font-size:13pt;">
						 ${data.className}
					</span></p></a>
		        </td>
		        		        <td bgcolor="">
		            <p align="center"><span style="font-size:13pt;">
					
						 ${data.teacherName}
					</span></p>
		        </td>
		        		        <td bgcolor="">
		            <p align="center"><span style="font-size:13pt;">
					
						 ${data.startDay}
					</span></p>
		        </td>
		        		        <td bgcolor="">
		            <p align="center"><span style="font-size:13pt;">
					
						 ${data.endDay}
					</span></p>
		        </td>
		        		        <td bgcolor="">
		            <p align="center"><span style="font-size:13pt;">
						<a href="CourseCheck?command=evaluation&classCode=${data.classCode}">
						 강의평가보기</a>
					</span></p>
		        </td>
		        		        <td bgcolor="">
		            <p align="center"><span style="font-size:13pt;">
						<a href="Controller?command=getClass&classCode=${data.classCode}" >
						 수강신청하기</a>
					</span></p>
		        </td>

		    </tr>
	</c:forEach>
 	
    <tr>
        <td bgcolor="">
            <p align="center"><span style="font-size:9pt;"></span></p>
        </td>
        <td bgcolor="">
			<p><span style="font-size:9pt;"><a href="ReadAContent.jsp?num= "></a></span></p>
        </td>
        <td bgcolor="">
            <p align="center"><span style="font-size:9pt;">
				<a href="mailto:"></a>
			</span></p>
        </td>
        <td bgcolor="">
            <p align="center"><span style="font-size:9pt;"></span></p>
        </td>
        <td bgcolor="">
            <p align="center"><span style="font-size:9pt;"></span></p>
        </td>
    </tr>

</table>

<br><br><br><br>





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




		<div class="news-updates">
			<div class="container">

				<div class="row">
					<div class="col-lg-9">
						<div class="section-heading">
							<h2 class="text-black">엔코아 강의 분석 자료</h2>
							<a href="#">모두 보기</a>
						</div>
						<div id="chart_div" style="width: 800px; height: 400px;"></div>
						
					</div>
					<div class="col-lg-3">
						<div class="section-heading">
							<h2 class="text-black">추천 강의 동영상</h2>
							<a href="#">모두보기</a>
						</div>
						<a href="https://youtu.be/dPRtcRwKo-Y" class="video-1 mb-4"
							data-fancybox="" data-ratio="2"> <span class="play"> <span
								class="icon-play"></span>
						</span> <img src="images/recommand1.jpg" alt="Image" class="img-fluid">
						<h5 class="text-black">JavaScript 입문 강의</h4>
						</a> <a href="https://youtu.be/1ttLx9MbrCI" class="video-1 mb-4"
							data-fancybox="" data-ratio="2"> <span class="play"> <span
								class="icon-play"></span>
						</span> <img src="images/recommand2.jpg" alt="Image" class="img-fluid">
						</a>
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
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
     	google.charts.load('current', {packages: ['corechart', 'bar']});
		google.charts.setOnLoadCallback(drawBasic);
		
		function refresh(){
			setInterval(drawBasic(), 60000);
		}

		function drawBasic() {
			var dataForChart = "${requestScope.getAllChartData}";
			var dataForChart = eval(dataForChart);
			
			data = google.visualization.arrayToDataTable(dataForChart);
			var options = {
        		title: 'Population of Classes',
        		chartArea: {width: '50%'},
        		vAxis: { title: 'Class Name'},
        		hAxis: { title: 'Total Population', minValue: 0 },
        		legend: { position: 'top', alignment: 'center', textStyle: { fontSize: 14 } }
    	  	};

      		var chart = new google.visualization.BarChart(document.getElementById('chart_div'));

      		chart.draw(data, options); 
    	}
		</script>




	<script src="js/main.js"></script>

</body>

</html>