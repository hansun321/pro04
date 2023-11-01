<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path1" value="${pageContext.servletContext.contextPath }" />
<!DOCTYPE html>
<html>
<head>
    <title>메인</title>
    <jsp:include page="../include/head.jsp" />

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
    <!-- Bulma Version 0.9.0-->
    <%--<link rel="stylesheet" href="https://unpkg.com/bulma@0.9.4/css/bulma.min.css" />--%>
    <link rel="stylesheet" type="text/css" href="${path1 }/resources/css/admin.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap');

        .column.is-6 { width:100%; }
        *{
            font-family: "Montserrat", sans-serif;
        }
        .card-header { font-size: 1.2em; font-family: "Nanum Gothic Coding"; font-weight: bolder; color:#00A2FF; margin-top:20px; margin-bottom: 20px; }
        .table td, .table th { font-size: 0.8em; }
        .hero.welcome .title, .hero.welcome .subtitle { font-family: "Nanum Gothic Coding";  }

        .table td { vertical-align: middle; }

        .card:hover {
            transform: none;
            border-top: 0;
        }
        .pagination-link.is-current {
            background-color: #00A2FF;
            border-color: #00A2FF;
            color: #fff;
        }
        .pagination-link, .pagination-next, .pagination-previous {
            border-color: #00A2FF;
            color: #00A2FF;
            min-width: 2.5em;
        }
    </style>
</head>
<body>
<jsp:include page="../include/header.jsp" />
<div class="container">
    <div class="columns">
        <div class="column is-3 ">
            <jsp:include page="../include/asideBar.jsp" />
        </div>
        <div class="column is-9" >
            <section class="hero is-info welcome is-small">
                <div class="hero-body">
                    <div class="container">
                        <h1 class="title">
                            관리자 페이지
                        </h1>
                    </div>
                </div>
            </section>
            <div class="columns">
                <div class="column is-6">
                    <header class="card-header">
                        「 강의목록 관리 」
                    </header>
                    <form action="${path1 }/admin/courseList" method="get" class="field has-addons has-addons-right">
                        <p class="control">
                                <span class="select">
                                    <select id="type" name="type">
                                        <option value="title">강의명</option>
                                        <option value="content">내용</option>
                                    </select>
                                </span>
                        </p>
                        <p class="control">
                            <input class="input" type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요" value="${keyword }">
                        </p>
                        <p class="control">
                            <input type="submit" class="button" value="검색" />
                        </p>
                    </form>
                    <div class="card events-card">
                        <div>
                    <br>
                        <table class="table" style="width: 100%;">
                            <thead>
                            <tr>
                                <th class="has-text-centered">강의명</th>
                                <th class="has-text-centered">수강기간</th>
                                <th class="has-text-centered">강사명</th>
                                <th class="has-text-centered">교재명</th>
                                <th class="has-text-centered">강의가격</th>
                                <th class="has-text-centered">교재가격</th>
                                <th class="has-text-centered">관리</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="course" items="${courseList }" varStatus="status">
                            <tr>
                                <td class="has-text-centered">${course.course_name }</td>
                                <td class="has-text-centered">${course.start_date }~${course.end_date } </td>
                                <td class="has-text-centered">${course.teacher_name }</td>
                                <td class="has-text-centered">${course.book_name }</td>
                                <td class="has-text-centered"><fmt:formatNumber value="${course.price }" pattern="#,###" />원</td>
                                <td class="has-text-centered"><fmt:formatNumber value="${course.book_price }" pattern="#,###" />원</td>
                                <td class="has-text-centered">
                                    <a href="${path1 }/admin/courseEdit?cno=${course.cno }"><button class="button is-info is-rounded" style="scale: 70%;">수정</button></a>
                                    <a href="${path1 }/admin/courseDelete?cno=${course.cno }"><button class="button is-danger is-rounded" style="scale: 70%;">삭제</button></a>
                                </td>
                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        </div>
                    </div>
                    <br>
                    <nav class="pagination is-rounded is-centered mb-6" role="navigation" aria-label="pagination">
                        <c:if test="${curPage > page.pageCount }">
                            <a href="${path1 }/admin/courseList?page=${page.blockStartNum - 1 }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-previous">Previous</a>
                        </c:if>
                        <c:if test="${page.blockLastNum < page.totalPageCount }">
                            <a href="${path1 }/admin/courseList?page=${page.blockLastNum + 1 }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-next">Next page</a>
                        </c:if>

                        <ul class="pagination-list">
                            <c:forEach var="i" begin="${page.blockStartNum }" end="${page.blockLastNum }">
                                <c:choose>
                                    <c:when test="${i == curPage }">
                                        <li>
                                            <a href="${path1 }/admin/courseList?page=${i }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-link is-current" aria-label="Page ${i }" aria-current="page" >${i }</a>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li>
                                            <a href="${path1 }/admin/courseList?page=${i }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-link" aria-label="Page ${i }" aria-current="page">${i }</a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <br>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>
    <script async type="text/javascript" src="${path1 }/resources/js/bulma.js"></script>
<jsp:include page="../include/footer.jsp" />
</body>
</html>