<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
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

    
    <div class="hero-slide owl-carousel site-blocks-cover">
      <div class="intro-section" style="background-image: url('images/hero_1.jpg');">
        <div class="container">
          <div class="row align-items-center">
            <div class="col-lg-12 mx-auto text-center" data-aos="fade-up">
              <h1>Welcome Ncore</h1>
            </div>
          </div>
        </div>
      </div>

      <div class="intro-section" style="background-image: url('images/hero_1.jpg');">
        <div class="container">
          <div class="row align-items-center">
            <div class="col-lg-12 mx-auto text-center" data-aos="fade-up">
              <h1>Become Data Master</h1>
            </div>
          </div>
        </div>
      </div>

    </div>
    

    <div></div>

    <div class="site-section">
      <div class="container">
        <div class="row mb-5 justify-content-center text-center">
          <div class="col-lg-4 mb-5">
            <h2 class="section-title-underline mb-5">
              <span>Why N core?</span>
            </h2>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-4 col-md-6 mb-4 mb-lg-0">

            <div class="feature-1 border">
              <div class="icon-wrapper bg-primary">
                <span class="flaticon-mortarboard text-white"></span>
              </div>
              <div class="feature-1-content">
                <h2>개인을 위한 맞춤 교육</h2>
                <p>철처한 원생관리로 낙오자 없는 교육을 하겠습니다.</p>
                <p><a href="#" class="btn btn-primary px-4 rounded-0">Learn More</a></p>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
            <div class="feature-1 border">
              <div class="icon-wrapper bg-primary">
                <span class="flaticon-school-material text-white"></span>
              </div>
              <div class="feature-1-content">
                <h2>수준 높은 교육</h2>
                <p>죽은 지식이 아닌 현업에서 사용될 기술들을 가르치겠습니다.</p>
                <p><a href="#" class="btn btn-primary px-4 rounded-0">Learn More</a></p>
              </div>
            </div> 
          </div>
          <div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
            <div class="feature-1 border">
              <div class="icon-wrapper bg-primary">
                <span class="flaticon-library text-white"></span>
              </div>
              <div class="feature-1-content">
                <h2>IT 맞춤 첨단 교육 환경</h2>
                <p>빠르게 변화하는 IT 업계의 트렌드를 반영한 커리큘럼으로 진행합니다.</p>
                <p><a href="#" class="btn btn-primary px-4 rounded-0">Learn More</a></p>
              </div>
            </div> 
          </div>
        </div>
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

        <div class="row">
          <div class="col-12">
              <div class="owl-slide-3 owl-carousel">
                  <div class="course-1-item">
                    <figure class="thumnail">
                      <a href="course-single.jsp"><img src="images/course_1.jpg" alt="Image" class="img-fluid"></a>
                      <div class="price">10만원</div>
                      <div class="category"><h3>초급 자바 알고리즘 </h3></div>  
                    </figure>
                    <div class="course-1-content pb-4">
                      <h2>자바 문법을 배운적이 없다면?</h2>
                      <div class="rating text-center mb-3">
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                      </div>
                      <p class="desc mb-4">이해하기 쉬운 기초 자바 강의를 통해 기본적인 알고리즘 해결력과 사고력을 동시에 기를 수 있습니다.</p>
                      <p><a href="CourseCheck?command=courseSingle" class="btn btn-primary rounded-0 px-4">수강신청하기</a></p>
                    </div>
                  </div>
      
                  <div class="course-1-item">
                    <figure class="thumnail">
                      <a href="course-single.jsp"><img src="images/course_2.jpg" alt="Image" class="img-fluid"></a>
                      <div class="price">15만원</div>
                      <div class="category"><h3>중급 자바 알고리즘</h3></div>  
                    </figure>
                    <div class="course-1-content pb-4">
                      <h2>깊은 알고리즘의 이해를 향해</h2>
                      <div class="rating text-center mb-3">
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                      </div>
                      <p class="desc mb-4">일상생활에서 발생하는 문제들을 알고리즘을 통해 해결함으로써 복잡하고 반복된 계산과정을 줄일 수 있습니다.</p>
                      <p><a href="CourseCheck?command=courseSingle" class="btn btn-primary rounded-0 px-4">수강신청하기</a></p>
                    </div>
                  </div>
      
                  <div class="course-1-item">
                    <figure class="thumnail">
                      <a href="course-single.jsp"><img src="images/course_3.jpg" alt="Image" class="img-fluid"></a>
                      <div class="price">20만원</div>
                      <div class="category"><h3>고급 자바 알고리즘</h3></div>  
                    </figure>
                    <div class="course-1-content pb-4">
                      <h2>알고리즘의 선구자가 되려면?</h2>
                      <div class="rating text-center mb-3">
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                      </div>
                      <p class="desc mb-4">고급 알고리즘을 통해 뛰어난 알고리즘 해결력과 사고력으로 기존에 없던 알고리즘을 발견하세요.</p>
                      <p><a href="CourseCheck?command=courseSingle" class="btn btn-primary rounded-0 px-4">수강신청하기</a></p>
                    </div>
                  </div>

                  <div class="course-1-item">
                    <figure class="thumnail">
                        <a href="course-single.jsp"><img src="images/course_4.jpg" alt="Image" class="img-fluid"></a>
                      <div class="price">10만원</div>
                      <div class="category"><h3>기초 통계 분석</h3></div>  
                    </figure>
                    <div class="course-1-content pb-4">
                      <h2>계산기 하나로 할 수 있는 통계학</h2>
                      <div class="rating text-center mb-3">
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                      </div>
                      <p class="desc mb-4">수학을 잘하지 못 하더라도 계산기 하나만 가지고 있다면 누구나 할 수 있는 쉬운 통계학</p>
                      <p><a href="CourseCheck?command=courseSingle" class="btn btn-primary rounded-0 px-4">수강신청하기</a></p>
                    </div>
                  </div>
      
                  <div class="course-1-item">
                    <figure class="thumnail">
                        <a href="course-single.jsp"><img src="images/course_5.jpg" alt="Image" class="img-fluid"></a>
                      <div class="price">10만원</div>
                      <div class="category"><h3>파이썬으로 배우는 물리학</h3></div>  
                    </figure>
                    <div class="course-1-content pb-4">
                      <h2>현실에서 실험할 수 없다면?</h2>
                      <div class="rating text-center mb-3">
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                      </div>
                      <p class="desc mb-4">강의를 수강하고 현실에서 발생하지만 실험 불가능한 물리현상을 연구하고 실험하여 보세요.</p>
                      <p><a href="CourseCheck?command=courseSingle" class="btn btn-primary rounded-0 px-4">수강신청하기</a></p>
                    </div>
                  </div>
      
                  <div class="course-1-item">
                    <figure class="thumnail">
                        <a href="course-single.jsp"><img src="images/course_6.jpg" alt="Image" class="img-fluid"></a>
                      <div class="price">30만원</div>
                      <div class="category"><h3>데이터 분석 전문가</h3></div>  
                    </figure>
                    <div class="course-1-content pb-4">
                      <h2>데이터 과학자의 마지막 길</h2>
                      <div class="rating text-center mb-3">
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                      </div>
                      <p class="desc mb-4">R을 활용한 데이터 분석과 시각화 툴을 활용하여 기존에 존재하지 않던 데이터 가치를 창출할 수 있습니다.</p>
                      <p><a href="CourseCheck?command=courseSingle" class="btn btn-primary rounded-0 px-4">수강신청하기</a></p>
                    </div>
                  </div>
      
              </div>
      
          </div>
        </div>

        
        
      </div>
    </div>

    


    <div class="section-bg style-1" style="background-image: url('images/about_1.jpg');">
      <div class="container">
        <div class="row">
          <div class="col-lg-4">
            <h2 class="section-title-underline style-2">
              <span>엔코아 교육센터 이념</span>
            </h2>
          </div>
          <div class="col-lg-8">
            <p class="lead">"삽질을 많이 합시다."</p>
            <p class="lead">- 김혜경 선생님 -</p>
          </div>
        </div>
      </div>
    </div>

    <!-- // 05 - Block -->
  <div class="site-section">
      <div class="container">
        <div class="row mb-5">
          <div class="col-lg-4">
            <h2 class="section-title-underline">
              <span>센터 강사진 소개</span>
            </h2>
          </div>
        </div>


        <div class="owl-slide owl-carousel">

          <div class="ftco-testimonial-1">
            <div class="ftco-testimonial-vcard d-flex align-items-center mb-4">
              <img src="images/hyunmin.jpg" alt="Image" class="img-fluid mr-3">
              <div>
                <h3>박현민</h3>
                <span>알고리즘 중독자</span>
              </div>
            </div>
            <div>
              <p>&ldquo;알고리즘, 무엇이든 물어보세요. 물어만 보세요.&rdquo;</p>
            </div>
          </div>

          <div class="ftco-testimonial-1">
            <div class="ftco-testimonial-vcard d-flex align-items-center mb-4">
              <img src="images/person_2.jpg" alt="Image" class="img-fluid mr-3">
              <div>
                <h3>송시찬</h3>
                <span>파이썬이뭐지? 프로토슨가?</span>
              </div>
            </div>
            <div>
              <p>&ldquo;파알못을 위한 수박 겉핥는 강의&rdquo;</p>
            </div>
          </div>

          <div class="ftco-testimonial-1">
            <div class="ftco-testimonial-vcard d-flex align-items-center mb-4">
              <img src="images/person_4.jpg" alt="Image" class="img-fluid mr-3">
              <div>
                <h3>한우석</h3>
                <span>배워서 남주는 PL/SQL</span>
              </div>
            </div>
            <div>
              <p>&ldquo;어깨너머로 배우는 PL/SQL&rdquo;</p>
            </div>
          </div>

          <div class="ftco-testimonial-1">
            <div class="ftco-testimonial-vcard d-flex align-items-center mb-4">
              <img src="images/person_3.jpg" alt="Image" class="img-fluid mr-3">
              <div>
                <h3>강민웅</h3>
                <span>알고리즘 감시탑</span>
              </div>
            </div>
            <div>
              <p>&ldquo;프로그래머스 2000등 미만은 진실의 방으로&rdquo;</p>
            </div>
          </div>

          <div class="ftco-testimonial-1">
            <div class="ftco-testimonial-vcard d-flex align-items-center mb-4">
              <img src="images/person_2.jpg" alt="Image" class="img-fluid mr-3">
              <div>
                <h3>김혜경</h3>
                <span>교육센터장</span>
              </div>
            </div>
            <div>
              <p>&ldquo;최고의 원생관리!!<br>지각  1초도 허용안함&rdquo;</p>
            </div>
          </div>

          <div class="ftco-testimonial-1">
            <div class="ftco-testimonial-vcard d-flex align-items-center mb-4">
              <img src="images/person_4.jpg" alt="Image" class="img-fluid mr-3">
              <div>
                <h3>신용기</h3>
                <span>부산 총잡이</span>
              </div>
            </div>
            <div>
              <p>&ldquo;트리거 고수여서 붙은 별명.. &rdquo;</p>
            </div>
          </div>

        </div>
        
      </div>
    </div>
    

    <div class="section-bg style-1" style="background-image: url('images/hero_1.jpg');">
      <div class="container">
        <div class="row">
          <div class="col-lg-4 col-md-6 mb-5 mb-lg-0">
            <span class="icon flaticon-mortarboard"></span>
           <h3>교육 철학</h3>
						<p>아름다운 보석도 무가치한 돌덩이에 불과할 때가 있었습니다. 사람이 정성들여 가공한 후 <br> 가치가 생기는 것입니다.
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
              <h2 class="text-black">개발자 채용정보</h2>
              <a href="https://playdata.io/playincruit">모두 보기</a>
            </div>
            <div class="row">
              <div class="col-lg-6">
                <div class="post-entry-big">
                  <a href="https://playdata.io/playincruit" class="img-link"><img src="images/requirement.JPG" alt="Image" class="img-fluid"></a>
                  <div class="post-content">
                    <div class="post-meta"> 
                      <a href="#">June 8, 2019</a>
                      <span class="mx-1">/</span>
                      <a href="#">employment information</a>, <a href="#">Updates</a>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-lg-6">
                <div class="post-entry-big horizontal d-flex mb-4">
                  <a href="https://playdata.io/playincruit" class="img-link mr-4"><img src="images/musinsa_info.JPG" alt="Image" class="img-fluid"></a>
                  <div class="post-content">
                    <div class="post-meta">
                      <a href="#">June 8, 2019</a>
                      <span class="mx-1">/</span>
                      <a href="#">employment information</a>, <a href="#">Updates</a>
                    </div>
                    <h3 class="post-heading"><a href="news-single.jsp">무신사 안드로이드 앱 개발자 모집</a></h3>
                  </div>
                </div>

                <div class="post-entry-big horizontal d-flex mb-4">
                  <a href="https://playdata.io/playincruit" class="img-link mr-4"><img src="images/modusign_info.JPG" alt="Image" class="img-fluid"></a>
                  <div class="post-content">
                    <div class="post-meta">
                      <a href="#">June 8, 2019</a>
                      <span class="mx-1">/</span>
                      <a href="#">employment information</a>, <a href="#">Updates</a>
                    </div>
                    <h3 class="post-heading"><a href="news-single.jsp">웹 프론트엔드 개발자 모집</a></h3>
                  </div>
                </div>

                <div class="post-entry-big horizontal d-flex mb-4">
                  <a href="https://playdata.io/playincruit" class="img-link mr-4"><img src="images/bitnine_info.JPG" alt="Image" class="img-fluid"></a>
                  <div class="post-content">
                    <div class="post-meta">
                      <a href="#">June 8, 2019</a>
                      <span class="mx-1">/</span>
                      <a href="#">employment information</a>, <a href="#">Updates</a>
                    </div>
                    <h3 class="post-heading"><a href="news-single.jsp">빅 데이터 개발자 모집</a></h3>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-3">
            <div class="section-heading">
              <h2 class="text-black">자습용 추천 강의</h2>
              <a href="#">모두보기</a>
            </div>
            <a href="https://youtu.be/PZIPsKgWJiw" class="video-1 mb-4" data-fancybox="" data-ratio="2">
              <span class="play">
                <span class="icon-play"></span>
              </span>
              <img src="images/recommand1.jpg" alt="Image" class="img-fluid">
            </a>
            <a href="https://youtu.be/1ttLx9MbrCI" class="video-1 mb-4" data-fancybox="" data-ratio="2">
                <span class="play">
                  <span class="icon-play"></span>
                </span>
                <img src="images/recommand2.jpg" alt="Image" class="img-fluid">
              </a>
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

<%@ include file="footer.jsp" %>

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