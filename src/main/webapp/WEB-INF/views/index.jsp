<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path1" value="${pageContext.servletContext.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
    <title>스마트해법</title>
    <jsp:include page="./include/head.jsp" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <style>
        .swiper { width: 100%; max-height: 500px; }
        .swiper-slide { text-align: center; display: flex; justify-content: center; align-items: center; }

        .tab-pane {
            display: none;
            position: relative;
        }
        .tab-pane.is-active {
            display: block;
            position: relative;
        }
        .tabs { overflow: visible; }
        .tabs ul { border-bottom: none; }
        .tabs.is-boxed a {
            border: 2px solid;
            border-radius: 1.25rem;
            width: 15rem;
        }
        .tabs.is-boxed a:hover {
            border: 2px solid;
            border-bottom-color: #4a4a4a!important;
        }
        .tabs.is-boxed li.is-active a {
            border: 2px solid;
            border-bottom-color: #485fc7!important;
        }
        .tabs li.is-active a {
            border: 2px solid #dbdbdb;
        }

        .course-tit a { font-size: 1.3rem; }
        .course-tit a:hover { text-decoration: underline; color: initial }
        /*.blog-item img { transition: transform 0.4s; }*/
        .blog-item img:hover { box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15) }
    </style>
</head>
<body>
<!-- Header Start -->
<jsp:include page="./include/header.jsp" />
<!-- Header Close -->

<!-- Slider Start -->
<section style="background: #F1F4F9;">
    <div class="swiper my-swiper">
        <div class="swiper-wrapper">
            <div class="swiper-slide">
                <div class="slide_wrap">
                    <img class="bg1" src="${path1 }/resources/images/배너1.png" />
                </div>
            </div>
            <div class="swiper-slide">
                <div class="slide_wrap">
                    <img class="bg2" src="${path1 }/resources/images/배너2.png" />
                </div>
            </div>
            <div class="swiper-slide">
                <div class="slide_wrap">
                    <img class="bg2" src="${path1 }/resources/images/배너3.png" />
                </div>
            </div>
        </div>
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
        <div class="swiper-pagination"></div>
    </div>
</section>

<section>
    <div class="container">
        <div class="column">
            <div class="column lg-12">
                <div class="section-divider"></div>
            </div>
        </div>
    </div>
</section>

<div class="tabs is-boxed is-centered" id="nav">
    <ul>
        <li data-target="pane-1" id="1" class="is-active">
            <a>
                <span class="is-size-5 has-text-weight-semibold">개인 맞춤학습</span>
            </a>
        </li>
        <li data-target="pane-2" id="2">
            <a>
                <span class="is-size-5 has-text-weight-semibold">블렌디드러닝</span>
            </a>
        </li>
        <li data-target="pane-3" id="3">
            <a>
                <span class="is-size-5 has-text-weight-semibold">커리큘럼</span>
            </a>
        </li>
    </ul>
</div>
<div class="tab-content">
    <div class="tab-pane is-active" id="pane-1">
        <div class="container">
            <div class="has-text-centered my-6">
            <span class="has-text-weight-semibold" style="font-size: 2rem">
            1:1 맞춤학습 시스템을 기반으로<br>
            깊이 있는 개인 맞춤 학습이 완성됩니다.
            </span>
            </div>
            <hr>
            <div class="columns">
                <div class="column is-6 mt-4 has-text-centered">
                    <p class="title">1:1 수준별 맞춤문제</p>
                    <span class="has-text-grey-dark">
                        단순히 진단 테스트를 통해 파악된 레벨의 문제를<br>
                        제공하는 것은 진정한 맞춤학습 프로그램이 아닙니다.<br><br>
                        스마트해법은 천재교육의 빅데이터를<br>
                        활용하여 학생별로 다른 맞춤형 문제를 제공합니다.<br><br>
                        개인별 학습 수준에 따라 최적화된 맞춤 문제를 통해<br>
                        자기주도 학습을 완성할 수 있으며,<br>
                        본인의 취약점에 대한 완벽한 대비가 가능합니다.
                    </span>
                </div>
                <div class="column is-6 ml-6">
                    <img src="${path1}/resources/images/tab1.jpg" alt="탭 사진">
                </div>
            </div>
            <hr>
        </div>
    </div>
    <div class="tab-pane" id="pane-2">
        <div class="container">
            <div class="has-text-centered my-6">
            <span class="has-text-weight-semibold" style="font-size: 2rem">
            최적화된 학습환경을 혼합하여<br>
            더욱 효율적인 자기주도학습을 실현합니다.
            </span>
            </div>
            <hr>
            <div class="columns">
                <div class="column is-6 mt-4 has-text-centered">
                    <p class="title">블렌디드러닝(Blended Learning)</p>
                    <span class="has-text-grey-dark">
                        능동적인 학습 습관 형성과 실력 극대화를 위해<br>
                        스마트해법에서는 블렌디드 러닝이라는<br>
                        새로운 패러다임을 만들어가고 있습니다.<br><br>
                        오프라인에서의 밀도 높은 1:1 밀착 코칭에서부터<br>
                        디지털 디바이스를 이용한 최정상 강사의 동영상 강의,<br>
                        이해를 돕기 위한 다각적 학습 프로그램,<br>
                        흥미롭고 유익한 교육 콘텐츠를 제공합니다.<br><br>
                        단순히 한 공간에서의 강의를 넘어<br>
                        온·오프라인의 유기적 결합을 통해 학습의 완결성을 추구합니다.
                    </span>
                </div>
                <div class="column is-6 ml-6">
                    <img src="${path1}/resources/images/tab2.jpg" alt="탭 사진">
                </div>
            </div>
            <hr>
        </div>
    </div>

    <div class="tab-pane" id="pane-3">
        <div class="container">
            <div class="has-text-centered my-6">
            <span class="has-text-weight-semibold" style="font-size: 2rem">
            세분화된 커리큘럼을 바탕으로<br>
            체계적인 학습 습관을 형성합니다.
            </span>
            </div>
            <hr>
            <div class="columns">
                <div class="column is-6 mt-4 has-text-centered">
                    <p class="title">학습 커리큘럼</p>
                    <span class="has-text-grey-dark">
                        개념~심화에 이르기까지<br>
                        개인의 학습 습관 및 성취 수준뿐 아니라<br>
                        방학, 학기, 시험 등 시기별 목적에 따라<br>
                        커리큘럼이 세분화되어 있습니다.<br><br>
                        이를 통해 학생의 이해도에 따라<br>
                        1:1 맞춤학습이 가능하며,<br>
                        수학 실력을 향상시킵니다.
                    </span>
                </div>
                <div class="column is-6 ml-6">
                    <img src="${path1}/resources/images/tab3.jpg" alt="탭 사진">
                </div>
            </div>
            <hr>
        </div>
    </div>
</div>


<div class="container my-6">
    <div class="columns is-justify-content-center is-desktop">
        <div class="column is-7-desktop has-text-centered">
            <p class="text-color is-size-3 has-text-weight-semibold">신규 강의</p>
        </div>
    </div>

    <div class="columns is-multiline is-justify-content-center">
        <c:choose>
            <c:when test="${empty newCourseList}">
                <p>신규 강의가 존재하지 않습니다.</p>
            </c:when>
            <c:otherwise>
                <c:forEach items="${newCourseList}" var="course" varStatus="status">
                    <c:if test="${status.index < 3}">
                        <%--<a href="${path1 }/course/getCourse?cno=${course.cno }">
                            <div>
                                <i class="fa fa-solid fa-seedling"></i>
                                    ${course.course_name }
                            </div>
                        </a>--%>
                        <div class="column is-4-desktop is-6-tablet">
                            <div class="blog-item">
                                <div class="has-text-centered">
                                    <a href="${path1 }/course/getCourse?cno=${course.cno }">
                                        <img src="${path1 }/resources/upload/${course.imgsrc1 }" alt="강의사진" style="width: 350px; height: 230px;">
                                    </a>
                                </div>
                                <div class="my-2 ml-6">
                                    <p class="course-tit mb-1">
                                        <a href="${path1 }/course/getCourse?cno=${course.cno }" class="">${course.course_name }</a>
                                    </p>
                                    <span class="is-size-6 text-color has-text-weight-semibold">
                                        ${course.start_date } ~ ${course.end_date }
                                    </span>
                                    <p class="mb-4 has-text-grey-darker"><fmt:formatNumber value="${course.price }" pattern="#,###" />원</p>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </c:otherwise>
        </c:choose>


        <%--<div class="column is-4-desktop is-6-tablet">
            <div class="blog-item">
                <img src="${path1}/resources/images/blog/blog_1.jpg" alt="" class="">

                <div class="card-body mt-2">
                    <span class="text-sm text-color is-uppercase has-text-weight-bold">January 3, 2019</span>
                    <h3 class="mb-3"><a href="blog-single.html" class="">We can make a difference in families lives</a></h3>
                    <p class="mb-4">Aspernatur obcaecati unde, quasi nihil neque, voluptatem. Consectetur.</p>
                </div>
            </div>
        </div>--%>
        <%--
        <div class="column is-4-desktop is-6-tablet">
            <div class="blog-item">
                <img src="${path1}/resources/images/blog/blog_2.jpg" alt="" class="">

                <div class="card-body mt-2">
                    <span class="text-sm text-color is-uppercase has-text-weight-bold">January 3, 2019</span>
                    <h3 class="mb-3"><a href="blog-single.html" class="">A place where start new life with peace</a></h3>
                    <p class="mb-4">Aspernatur obcaecati unde, quasi nihil neque, voluptatem. Consectetur.</p>
                </div>
            </div>
        </div>

        <div class="column is-4-desktop is-6-tablet">
            <div class="blog-item">
                <img src="${path1}/resources/images/blog/blog_3.jpg" alt="" class="">

                <div class="card-body mt-2">
                    <span class="text-sm text-color is-uppercase has-text-weight-bold">January 3, 2019</span>
                    <h3 class="mb-3"><a href="blog-single.html" class="">Build school for poor childrens</a></h3>
                    <p class="mb-4">Aspernatur obcaecati unde, quasi nihil neque, voluptatem. Consectetur.</p>
                </div>
            </div>
        </div>
        --%>
    </div>
</div>
<script src="${path1 }/resources/js/tabs.js"></script>

<!-- Footer Start -->
<jsp:include page="./include/footer.jsp" />
<!-- Footer Close -->
<!-- Swiper JS -->
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<!-- Initialize Swiper -->
<script>
    document.addEventListener('DOMContentLoaded', function () {
        // Swiper 초기화
        var mySwiper = new Swiper(".my-swiper", {
            loop: true,
            spaceBetween: 30,
            centeredSlides: true,
            autoplay: {
                delay: 3500,
                disableOnInteraction: false,
            },
            pagination: {
                el: ".swiper-pagination",
                clickable: true,
            },
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
        });
    });
</script>
</body>
</html>