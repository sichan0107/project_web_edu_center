<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<title>header.jsp</title>
</head>
<body>
<header class="site-navbar py-4 js-sticky-header site-navbar-target" role="banner">

      <div class="container">
        <div class="d-flex align-items-center">
          <div class="site-logo">
            <a href="index.jsp" class="d-block">
              <img src="images/logo.jpg" alt="Image" class="img-fluid" height="75px" width="250px">
            </a>
          </div>
          <div class="mr-auto">   
            <nav class="site-navigation position-relative text-right" role="navigation">
              <ul class="site-menu main-menu js-clone-nav mr-auto d-none d-lg-block">
                <li class="active">
                  <a href="index.jsp" class="nav-link text-left">메인</a>
                </li>
                <li>
                  <a href="about.jsp" class="nav-link text-left">교육센터 소개</a>
                </li>
                <li>
                  <a href="CourseCheck?command=admissions" class="nav-link text-left">수강 신청</a>
                </li>
                <c:choose>
                <c:when test="${not empty sessionScope.student.studentName}">
                <li>
                  <a href='CourseCheck?command=courses&studentId=${sessionScope.student.studentId}' class="nav-link text-left">수강 내역</a>
                </li>
                </c:when>
                <c:when test="${not empty sessionScope.teacher.teacherName}">
                <li>
                  <a href='CourseCheck?command=courseList&teacherName=${sessionScope.teacher.teacherName}' class="nav-link text-left">나의 강의</a>
                </li>
                </c:when>
                 <c:otherwise>
                <li>
                  <a href='CourseCheck?command=courses' class="nav-link text-left">수강 내역</a>
                </li>
                </c:otherwise>
                </c:choose>
                <c:choose>
                 <c:when test="${not empty sessionScope.teacher.teacherName}">
                <li>
                    <a href="questionsList.jsp" class="nav-link text-left">문의보기</a>
                  </li>
                  </c:when>
                  <c:otherwise>
                   <li>
                    <a href="contact.jsp" class="nav-link text-left">문의하기</a>
                  </li>
                  </c:otherwise>
                </c:choose>
              </ul>                                                                                                                                                                                                                                                                                          </ul>
            </nav>

          </div>
          <div class="ml-auto">
            <div class="social-wrap">
              <a href="#"><span class="icon-facebook"></span></a>
              <a href="#"><span class="icon-twitter"></span></a>
              <a href="#"><span class="icon-linkedin"></span></a>

              <a href="#" class="d-inline-block d-lg-none site-menu-toggle js-menu-toggle text-black"><span
                class="icon-menu h3"></span></a>
            </div>
          </div>
         
        </div>
      </div>

    </header>

</body>
</html>