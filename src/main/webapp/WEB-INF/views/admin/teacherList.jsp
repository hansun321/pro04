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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
            <jsp:include page="../include/asideBar.jsp"/>
        </div>
        <div class="column is-9">
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
                        「 강사 관리 」
                    </header>
                    <form action="${path1 }/admin/teacherList" method="get" class="field has-addons has-addons-right">
                        <p class="control">
                            <span class="select">
                              <select id="type" name="type">
                                  <option value="tid">강사명</option>
                                  <option value="tel">전화번호</option>
                              </select>
                            </span>
                        </p>
                        <p class="control">
                            <input class="input" type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요"
                                   value="${keyword }">
                        </p>
                        <p class="control">
                            <input type="submit" class="button" value="검색"/>
                        </p>
                    </form>
                    <div class="card events-card">
                        <div>
                            <br>
                            <table class="table" style="width: 100%;">
                                <thead>
                                <tr>
                                    <th class="has-text-centered">강사명</th>
                                    <th class="has-text-centered">전화번호</th>
                                    <th class="has-text-centered">이메일</th>
                                    <th class="has-text-centered">관리</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="teacher" items="${teacherList }" varStatus="status">
                                    <tr>
                                        <td class="has-text-centered">${teacher.teacher_name }</td>
                                        <td class="has-text-centered">${teacher.tel }</td>
                                        <td class="has-text-centered">${teacher.email }</td>
                                        <td class="has-text-centered"><a href="${path1 }/admin/teacherDelete?tno=${teacher.tno }"><button class="button is-danger is-rounded" style="scale: 70%;">삭제</button></a></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                                <button id="teacherInsert" class="button is-link is-medium" style="scale: 70%;">강사 등록</button>
                            </table>
                        </div>
                    </div>
                    <div class="modal" id="myModal">
                        <div class="modal-background"></div>
                        <div class="modal-card">
                            <header class="modal-card-head" style="background-image: url('${path1}/resources/images/modal_bg.png'); ">
                                <p class="modal-card-title has-text-white">강사 등록</p>
                                <button class="delete" aria-label="close"></button>
                            </header>
                            <section class="modal-card-body">
                                <!-- 모달 내용 -->
                                <form action="${path1 }/admin/insertTeacher" id="teacherForm" method="post" >
                                    <table class="table is-centered is-fullwidth">
                                        <tbody>
                                        <tr class="border-top">
                                            <th class="has-text-centered">강사명</th>
                                            <td>
                                                <input type="text" name="teacher_name" id="teacher_name" placeholder="강사명" class="input" maxlength="98" required>
                                            </td>
                                        </tr>
                                        <tr class="border-top">
                                            <th class="has-text-centered">전화번호</th>
                                            <td>
                                                <input type="text" name="tel" id="tel" placeholder="전화번호" class="input" maxlength="98" required>
                                            </td>
                                        </tr>
                                        <tr class="border-top">
                                            <th class="has-text-centered">이메일</th>
                                            <td>
                                                <input type="email" name="email" id="email" placeholder="이메일" class="input" maxlength="98" required>
                                            </td>
                                        </tr>
                                        <%--<tr>
                                          <td colspan="2">
                                            <input type="submit" class="button2" value="등록" >
                                            <a class="button" href="${path1 }/video/list.do">목록으로</a>
                                          </td>
                                        </tr>--%>
                                        </tbody>
                                    </table>
                                    <div class="column is-4 is-offset-4 has-text-centered">
                                        <button type="submit" id="apply" class="button is-info" >등록하기</button>
                                    </div>
                                </form>

                            </section>
                        </div>
                    </div>

                    <br>
                    <nav class="pagination is-rounded is-centered mb-6" role="navigation" aria-label="pagination">
                        <c:if test="${curPage > page.pageCount }">
                            <a href="${path1 }/admin/courseList?page=${page.blockStartNum - 1 }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>"
                               class="pagination-previous">Previous</a>
                        </c:if>
                        <c:if test="${page.blockLastNum < page.totalPageCount }">
                            <a href="${path1 }/admin/courseList?page=${page.blockLastNum + 1 }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>"
                               class="pagination-next">Next page</a>
                        </c:if>

                        <ul class="pagination-list">
                            <c:forEach var="i" begin="${page.blockStartNum }" end="${page.blockLastNum }">
                                <c:choose>
                                    <c:when test="${i == curPage }">
                                        <li>
                                            <a href="${path1 }/admin/courseList?page=${i }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>"
                                               class="pagination-link is-current" aria-label="Page ${i }"
                                               aria-current="page">${i }</a>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li>
                                            <a href="${path1 }/admin/courseList?page=${i }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>"
                                               class="pagination-link" aria-label="Page ${i }"
                                               aria-current="page">${i }</a>
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
<!-- 버튼을 클릭했을 때 모달을 열도록 합니다 -->
<script>
    $(document).ready(function () {
        // 'teacherInsert' 버튼을 클릭할 때 모달을 엽니다.
        $('#teacherInsert').click(function () {
            // 모달 열기
            $('#myModal').addClass('is-active');
        });

        // '모달 닫기' 버튼을 클릭할 때 모달을 닫습니다.
        $('.delete').click(function () {
            // 모달 닫기
            $('#myModal').removeClass('is-active');
        });
        //
        // // 모달 외부를 클릭했을 때 모달을 닫습니다.
        // $('.modal-background').click(function () {
        //     // 모달 닫기
        //     $('#myModal').removeClass('is-active');
        // });
        //var apply = document.getElementById("apply");
        //apply.addEventListener("click", function(){
        //    document.getElementById("teacherForm").submit();
        //});
    });
</script>

<jsp:include page="../include/footer.jsp"/>
</body>
</html>