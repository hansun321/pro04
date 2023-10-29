<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path1" value="${pageContext.servletContext.contextPath }" />
<!DOCTYPE html>
<html>
<head>
  <title>메인</title>
  <jsp:include page="../include/head.jsp" />

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">

  <!-- Bulma Version 0.9.0-->
  <%--<link rel="stylesheet" href="https://unpkg.com/bulma@0.9.4/css/bulma.min.css" />--%>
  <link rel="stylesheet" type="text/css" href="${path1 }/resources/css/admin.css">

  <style>

    @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap');

    *{
      font-family: "Montserrat", sans-serif;
    }

    .title, .hero, .hero, .welcome, .subtitle{
      font-family: 'Nanum Gothic Coding', monospace;
      font-weight: 700;
    }

    .column.is-6 { width:100%; }
    .card-header { font-size: 1.2em; font-weight: bolder; color:#00A2FF; margin-top:20px; margin-bottom: 20px; }
    .table td, .table th { font-size: 0.8em; }


    .item1 { width : 10%; }
    .item2 { width : 10%; }
    .item3 { width : 10%; }
    .item4 { width : 10%; }
    .item5 { width : 15%; }
    .item6 { width : 35%; }
    .item7 { width : 10%; }
    .item8 { width : 10%; }
    .item9 { width : 10%; }
    .item10 { width : 5%; }
    .item11 { width : 5%; }

    .paginate .page-item {
      margin: 0 5px;
    }

    .paginate .page-link {
      display: inline-block;
      width: 34px;
      height: 34px;
      border: 1px solid #ddd;
      background-color: #f8f9fa;
      color: #333;
      font-size: 14px;
      line-height: 32px;
      text-align: center;
      text-decoration: none;
      transition: background-color 0.3s, color 0.3s;
    }

    .paginate .page-link:hover {
      background-color: #333;
      color: #fff;
      cursor: pointer;
    }

  </style>
</head>
<body>
<jsp:include page="../include/header.jsp" />
<div class="container" style="min-height: 62vh; ">
  <div class="columns">
    <div class="column is-3 ">
      <%-- 관리자 네비게이션 바 --%>
      <jsp:include page="../include/asideBar.jsp" />
    </div>
    <div class="column is-9">
      <section class="hero is-info welcome is-small">
        <div class="hero-body">
          <div class="container">
            <h1 class="title">
              관리자 페이지
            </h1>
            <h2 class="subtitle">

            </h2>
          </div>
        </div>
      </section>
      <div class="columns">
        <div class="column is-6">
          <header class="card-header">
            회원 목록
          </header>
          <div class="card events-card">
            <div>
              <form action="${path1 }/admin/userList.do" method="get" class="field has-addons has-addons-right">
                <p class="control">
                                <span class="select">
                                    <select id="type" name="type">
                                        <option value="id">아이디</option>
                                        <option value="name">이름</option>
                                      <option value="tel">전화번호</option>
                                      <option value="email">이메일</option>
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
              <p>
              <table class="table">
                <thead>
<%--                  <th>번호</th>--%>
                  <th>아이디</th>
                  <th>이름</th>
                  <th>이메일</th>
                  <th>전화번호</th>
                  <th>주소</th>
<%--                  <th>가입일</th>--%>
<%--                  <th>생년월일</th>--%>
                  <th>포인트</th>
                  <th>회원수정</th>
                  <th>회원삭제</th>

                </thead>
                <tbody>
                <c:forEach var="user" items="${userList }" varStatus="status">
                  <tr>
<%--                    <td class="item1">${status.count }</td>--%>
                    <td class="item2">${user.id }</td>
                    <td class="item3">${user.name }</td>
                    <td class="item4">${user.email }</td>
                    <td class="item5">${user.tel }</td>
                    <td class="item6">(${user.postcode }) ${user.addr1 } ${user.addr2 } </td>
<%--                    <td class="item7">${user.regdate }</td>--%>
<%--                    <td class="item8">${user.birth }</td>--%>
                    <td class="item9">${user.pt }</td>
                    <td class="item10"><a href="${path1 }/admin/aGetUser?id=${user.id }"><button class="button is-primary is-rounded" style="scale: 70%;">수정</button></a></td>
                  <c:if test="${(user.id != 'admin') }">
                    <td class="item11"><a href="${path1 }/admin/userDelete.do?id=${user.id }"><button class="button is-danger is-rounded" style="scale: 70%;">삭제</button></a></td>
                  </c:if>
                  </tr>
                </c:forEach>
                </tbody>
              </table>
              <nav class="pagination is-rounded is-centered mb-6" role="navigation" aria-label="pagination">
<%--                <c:if test="${curPage > page.pageCount }">--%>
                    <c:if test="${(page.blockStartNum - 1) > 0}">
                  <a href="${path1 }/admin/userList.do?page=${page.blockStartNum - 1 }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-previous">Previous</a>
                    </c:if>
<%--                </c:if>--%>
                <c:if test="${page.blockLastNum < page.totalPageCount }">
                  <a href="${path1 }/admin/userList.do?page=${page.blockLastNum + 1 }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-next">Next page</a>
                </c:if>

                <ul class="pagination-list">
                  <c:forEach var="i" begin="${page.blockStartNum }" end="${page.blockLastNum }">
                    <c:choose>
                      <c:when test="${i == curPage }">
                        <li>
                          <a href="${path1 }/admin/userList.do?page=${i }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-link is-current" aria-label="Page ${i }" aria-current="page" >${i }</a>
                        </li>
                      </c:when>
                      <c:otherwise>
                        <li>
                          <a href="${path1 }/admin/userList.do?page=${i }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-link" aria-label="Page ${i }" aria-current="page">${i }</a>
                        </li>
                      </c:otherwise>
                    </c:choose>
                  </c:forEach>
                </ul>
              </nav>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script async type="text/javascript" src="${path1 }/resources/js/bulma.js"></script>
</div>
<jsp:include page="../include/footer.jsp" />
</body>
</html>