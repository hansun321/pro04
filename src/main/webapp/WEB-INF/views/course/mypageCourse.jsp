<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path1" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${path0}/resources/css/styles2.css" />
    <title>마이페이지 - 수강 </title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
    <!-- Bulma Version 0.9.0-->
    <link rel="stylesheet" href="https://unpkg.com/bulma@0.9.4/css/bulma.min.css" />
    <link rel="stylesheet" type="text/css" href="${path1 }/resources/css/admin.css" />
    <link rel="stylesheet" type="text/css" href="${path1 }/resources/css/hero.css" />
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <jsp:include page="../include/head.jsp"></jsp:include>
    <style>
        .card-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: flex-start;
            min-width: 100%;
        }
        p {
            font-size: 1.294rem;
            color: #222;
            font-weight: 500;
            letter-spacing: -0.7pt;
            line-height: 1;
            margin: 0 0 22px;

        }
        .menu-list li{
            padding: 5px;
            border: 1px solid #ccc;
            margin: 1px 0;
            border-radius: 20px;
            background-color: #f1f4f9;
        }
        .form_button {
            display: flex;
            flex-direction: row;
        }
    </style>
</head>

<body>

<!-- START NAV -->
<jsp:include page="../include/header.jsp"></jsp:include>

<!-- END NAV -->
<div class="container">
    <div class="columns" style="min-height:100vh">
        <div class="column is-3 ">
            <aside class="menu is-hidden-mobile">
                <ul class="menu-list">
                    <li>
                        <a>수강 현황</a>
                        <ul>
                            <li><a href="${path1 }/course/mypageCourse?complete=0">수강 중인 과정</a></li>
                            <li><a href="${path1 }/course/mypageCourse?complete=1">종료된 과정</a></li>
                        </ul>
                    </li>
                </ul>
            </aside>
        </div>
        <div class="column is-9">
            <section class="hero is-info welcome is-small">
                <div class="hero-body">
                    <div class="container">
                        <h1 class="title">
                            Hello, ${user.name }님!!
                        </h1>
                        <h2 class="subtitle">
                            I hope you are having a great day!
                        </h2>
                    </div>
                </div>
            </section>
            <section class="info-tiles">
                <c:if test="${enrollNum ne null}">
                    <p>학습 현황 그래프</p>
                    <progress class="progress  is-large is-success" style="height:2rem;" value="${100 - enrollNum*size }" max="100"></progress>
                    <c:if test="${100 - enrollNum*size >= 100 }">
                        <p>❤️👍💖💫모든 강좌를 수강완료하였습니다!💝🎉🎊🎇</p>
                    </c:if>
                </c:if>
            </section>
            <div class="columns" style="margin:0; padding:0">
                <div class="columns features" style="margin:0; padding:0">
                    <div class="card-container">
                        <c:forEach var="enroll" items="${getEnrollList }">
                            <div class="column is-4">
                                <div class="card is-shady">
                                    <div class="card-image">
                                        <figure class="image is-4by3">
                                            <img src="${path1 }/resources/upload/${enroll.imgsrc1 }" alt="Placeholder image" class="modal-button" data-target="modal-image2">
                                        </figure>
                                    </div>
                                    <div class="card-content">
                                        <div class="content">
                                            <h4>${enroll.course_name }</h4>
                                            <h4 class="enddate">수강 종료일 | ${enroll.end_date }</h4>
                                            <h4 class="date"></h4>
                                            <c:if test="${enroll.cancel == true }">
                                                <div class="form_button">
                                                        <p style="color: #ff0000; margin:38px 0 0px; ">철회 신청 대기 중</p>
                                                </div>
                                            </c:if>
                                            <c:if test="${enroll.cancel == false }">
                                                <div class="form_button">
                                                    <form action="${path1 }/course/complete" method="post" style="margin-right:10px;">
                                                        <button id="confettiButton" class="button is-link modal-button " data-target="modal-image2">수강 완료</button>
                                                        <input type="hidden" id="eno" name="eno" value="${enroll.eno }" >
                                                    </form>
                                                    <form action="${path1 }/course/cancel" method="post">
                                                        <button id="confettiButton2" class="button is-danger modal-button " data-target="modal-image2">수강 철회</button>
                                                        <input type="hidden" id="eno2" name="eno" value="${enroll.eno }" >
                                                    </form>
                                                </div>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <c:if test="${empty getEnrollList and enrollNum eq null}">
                            <tr>
                                <td colspan="4">수강 중인 강좌가 없습니다.</td>
                            </tr>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
<script async type="text/javascript" src="${path1 }/resources/js/bulma.js"></script>
<script>
    $(document).ready(function() {
        // 오늘 날짜를 가져오는 함수
        function getToday() {
            const today = new Date();
            return today;
        }

        // 날짜 차이를 계산하는 함수
        function calculateDateDifference(endDate) {
            const today = getToday();
            const end = new Date(endDate);
            const timeDiff = end - today;
            const daysDiff = Math.ceil(timeDiff / (1000 * 60 * 60 * 24));
            return daysDiff;
        }

        // forEach 루프를 사용하여 남은 일 수를 각 enroll 항목에 추가
        $(".is-shady").each(function() {
            const endDateElement = $(this).find(".enddate");
            const dateElement = $(this).find(".date");
            const endDate = new Date(endDateElement.text().trim());
            const daysRemaining = calculateDateDifference(endDate);
            const remainingText = `남은 수강일 | `+daysRemaining+ `일`;
            dateElement.text(remainingText);
        });
    });
</script>
</body>

</html>