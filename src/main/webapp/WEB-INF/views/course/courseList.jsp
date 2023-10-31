<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path1" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
    <title>수강신청</title>
    <jsp:include page="../include/head.jsp" />
    <style>
        .breadcrumb a { color: #464646; }
        .select-box {
            margin-left: 0.9rem;
        }
        .select-box .select {
            min-width: 8rem;
            font-size: 1rem;
            box-shadow: inset 0 0.0625em 0.125em rgba(10,10,10,.05);
            background-color: #fff;
            border-color: #dbdbdb;
            border-radius: 4px;
            color: #363636;
            padding: calc(0.5em - 1px);
        }
        .checkboxes {
            margin-left: -0.5rem;
        }
        .cs-img {
            border-radius: 20px;
            width:300px;
            max-height: 200px;
            transition: transform 0.2s;
        }
        .cs-img:hover { box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15); transform: scale(1.02); }
        @keyframes blink {
            0% { opacity: 0; }
            50% { opacity: 1; }
            100% { opacity: 0; }
        }
        .blinking-text {
            animation: blink 1.1s infinite;
            white-space: nowrap;
        }
    </style>
</head>
<body>
<jsp:include page="../include/header.jsp" />

<nav class="breadcrumb has-succeeds-separator is-medium is-right mt-3 p-4" style="background: #f1f4f9" aria-label="breadcrumbs">
    <ul class="mr-5">
        <li><a href="${path1}"><i class="xi-home is-size-3"></i></a></li>
        <li><a href="${path1}/course/list.do">강의수강</a></li>
        <li><a href="${path1}/course/list.do">수강신청</a></li>
    </ul>
    <p class="title has-text-centered mt-1 mb-2">수강신청</p>
</nav>

<div class="container">
    <div class="columns is-multiline mt-1 mx-5">
        <div class="column is-4">
            <form action="${path1 }/course/list.do" method="get" class="field has-addons">
                <p class="control">
                    <span class="select">
                        <select id="type" name="type">
                            <option value="title">제목</option>
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
        </div>
        <div class="column is-2 is-offset-6 has-text-right">
            <c:if test="${sid.equals('admin')}">
                <a class="button is-link is-medium" href="${path1 }/course/insert.do">강의 등록</a>
            </c:if>
        </div>
        <div class="columns is-12 is-multiline is-vcentered">
            <div class="column is-3">
                <div class="select-box">
                    <form action="${path1 }/course/list.do" method="get">
                        <select name="sort" id="sortOption" class="select" onchange="this.form.submit()">
                            <option value="">정렬</option>
                            <option value="newest">최신 등록 순</option>
                            <option value="asc">가격 낮은 순</option>
                            <option value="desc">가격 높은 순</option>
                        </select>
                    </form>
                </div>
            </div>
            <div class="column is-9">
                <div class="checkboxes">
                    <form action="${path1}/course/list.do" method="post">
                        <label>
                            <input type="checkbox" name="excludeFull" value="true" class="checkbox ml-5" /> 마감된 강의 제외
                        </label>
                        <label>
                            <input type="checkbox" name="excludeFinished" value="true" class="checkbox ml-3" /> 종강한 강의 제외
                        </label>
                        <input type="submit" class="button is-small ml-2" style="font-size: 0.8rem;" value="적용" />
                    </form>
                </div>
            </div>
        </div>


        <div class="column is-12 border-top">
            <c:forEach items="${courseList }" var="course">
                <article class="columns is-multiline is-justify-content-center mb-3 border-bottom">
                    <div class="column is-3">
                        <c:set var="closingSoon" value="${csMap[course.cno]}" />
                        <div style="position: relative; display: inline-block;">
                            <c:choose>
                                <c:when test="${closingSoon}">
                                    <%-- 마감 임박 강의에 대한 처리 --%>
                                    <a href="${path1 }/course/getCourse?cno=${course.cno }">
                                        <img src="${path1 }/resources/upload/${course.imgsrc1 }" alt="강의사진" class="blinking cs-img"
                                             style=  >
                                        <div style="position: absolute; top: 0; left: 50%; transform: translateX(-50%); padding: 10px;">
                                            <a href="${path1 }/course/getCourse?cno=${course.cno }" class="button is-danger blinking-text has-text-weight-semibold">마감 임박</a>
                                        </div>
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <%-- 마감 임박하지 않은 강의에 대한 처리 --%>
                                    <a href="${path1 }/course/getCourse?cno=${course.cno }">
                                        <img src="${path1 }/resources/upload/${course.imgsrc1 }" alt="강의사진" class="cs-img"
                                             style="border-radius: 20px; width:300px; max-height: 200px;" >
                                    </a>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="column is-6" style="display: flex; flex-direction: column; justify-content: center;">
                        <p class="is-size-5" style="margin-top: -12px;">
                            <a href="${path1 }/course/getCourse?cno=${course.cno }">${course.course_name }</a>
                        </p>
                        <span>수강료 : <fmt:formatNumber value="${course.price }" pattern="#,###" />원</span>
                    </div>
                    <div class="column is-3" style="display: flex; flex-direction: column; justify-content: center;">
                        <p style="margin-top: -12px; text-align: center">
                            <a href="${path1 }/course/getCourse?cno=${course.cno }" class="button is-info is-medium" style="border-radius: 100px">
                                <i class="icofont-pencil"> 수강신청</i>
                            </a>
                        </p>
                    </div>
                </article>
            </c:forEach>
        </div>
    </div>
    <br>
</div>

<nav class="pagination is-rounded is-centered mb-6" role="navigation" aria-label="pagination">
    <c:if test="${curPage > page.pageCount }">
        <a href="${path1 }/course/list.do?page=${page.blockStartNum - 1 }&sort=${param.sort }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-previous">Previous</a>
    </c:if>
    <c:if test="${page.blockLastNum < page.totalPageCount }">
        <a href="${path1 }/course/list.do?page=${page.blockLastNum + 1 }&sort=${param.sort }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-next">Next page</a>
    </c:if>

    <ul class="pagination-list">
        <c:forEach var="i" begin="${page.blockStartNum }" end="${page.blockLastNum }">
            <c:choose>
                <c:when test="${i == curPage }">
                    <li>
                        <a href="${path1 }/course/list.do?page=${i }&sort=${param.sort }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-link is-current" aria-label="Page ${i }" aria-current="page" >${i }</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li>
                        <a href="${path1 }/course/list.do?page=${i }&sort=${param.sort }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-link" aria-label="Page ${i }" aria-current="page">${i }</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </ul>
</nav>

<jsp:include page="../include/footer.jsp" />
</body>
</html>
