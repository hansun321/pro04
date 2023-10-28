<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path1" value="${pageContext.servletContext.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
    <title>자료실 관리자 페이지</title>
    <jsp:include page="../../include/head.jsp"/>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
    <%--<link rel="stylesheet" href="https://unpkg.com/bulma@0.9.4/css/bulma.min.css" />--%>
    <link rel="stylesheet" type="text/css" href="${path1 }/resources/css/admin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap');
         *{ font-family: "Montserrat", sans-serif; }
        .title {font-family: 'Nanum Gothic Coding', monospace; font-weight: 700;}
        .notice-list th:nth-child(1) {width: 12%;}
        .box_wrap thead th {padding: 15px 5px;border-bottom: 1px solid #d0cfd5;text-align: center;}
        .box_wrap tbody td {padding: 15px 5px;border-bottom: 1px solid #d0cfd5;text-align: center;}
        .item2 .al{text-decoration-line: none;color: black;display: block;text-overflow: ellipsis;max-height: 2.8em;line-height: 1.4em;word-wrap: break-word;overflow: hidden;display: -webkit-box;-webkit-line-clamp: 2;-webkit-box-orient: vertical;word-break: keep-all;}
        .paginate {list-style-type: none;width: 100%;margin-top: 40px;text-align: center;display: flex;justify-content: center;align-items: center;}
        .item1, .item2, .item3 {font-size: 15px;}
        #tb1 { margin:40px auto; }
        #tb1 th {text-align: center;font-size: 17px;}
        .item1 {width:20%;}
        .item2 { width:60%; }
        .item2 .al {text-decoration-line: none;color: black;display: block;text-overflow: ellipsis;max-height: 2.8em;line-height: 3.4em;word-wrap: break-word;overflow: hidden;display: -webkit-box;-webkit-line-clamp: 2;-webkit-box-orient: vertical;word-break: keep-all;}
        .button2 {text-decoration: none;border-radius: 20px;padding: 10px;float: right;background-color: #008CD6 ;border-color: #008CD6; color: #FFFFFF;}
        .button3 {text-decoration: none;border-radius: 20px;padding: 10px;float: right;background-color: #FF968A;border-color: #FF968A;color: #ffffff;}
    </style>
</head>
<body>
<jsp:include page="../../include/header.jsp"/>

<div class="container">
    <div class="columns">
        <div class="column is-3 ">
            <%-- 관리자 네비게이션 바 --%>
            <jsp:include page="../../include/asideBar.jsp" />
        </div>
        <div class="column is-9" style="overflow: hidden;">
            <section class="hero is-info welcome is-small">
                <div class="hero-body">
                    <div class="container">
                        <h1 class="title">
                            관리자 페이지
                        </h1>
                    </div>
                </div>
            </section>
            <div class="" style="width: 100%;">
                <div class="card events-card mb-5 px-3" style="height: auto;">
                    <div>
                        <p style="text-align: center; font-size: 30px; line-height: 100px;">
                            「 자료실 」
                        </p>

                        <form action="${path1 }/file/list.do" method="get" class="field has-addons has-addons-right">
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
                        <p>
                        <table class="table" id="tb1">
                            <thead>
                            <th>번호</th>
                            <th>제목</th>
                            <th>
                                <a class="button2" href="${path1}/file/fileupload1.do">파일 자료 등록</a>
                            </th>
                            </thead>
                            <tbody>
                            <c:forEach var="board" items="${fileboardList}" varStatus="status">
                                <tr>
                                    <td class="item1" style="text-align: center; line-height: 50px;">${board.fileBoard.postNo}</td>
                                    <td class="item2" style="text-align: center; line-height: 50px;">
                                        <a href="${path1}/file/getFileboard.do?postNo=${board.fileBoard.postNo}" class="al">${board.fileBoard.title}</a>
                                    </td>
                                    <td class="item3">
                                        <div class="btn-group">
                                            <a href="${path1}/admin/removeFileboard.do?postNo=${board.fileBoard.postNo}" class="button2">자료 삭제</a>

                                            <a href="${path1}/file/modifyFileboard.do?postNo=${board.fileBoard.postNo}" class="button3">자료 수정</a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <nav class="pagination is-rounded is-centered mb-6" role="navigation" aria-label="pagination">
                        <c:if test="${curPage > page.pageCount }">
                            <a href="${path1 }/admin/file/filelist1.do?page=${page.blockStartNum - 1 }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-previous">Previous</a>
                        </c:if>
                        <c:if test="${page.blockLastNum < page.totalPageCount }">
                            <a href="${path1 }/admin/file/filelist1.do?page=${page.blockLastNum + 1 }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-next">Next page</a>
                        </c:if>

                        <ul class="pagination-list">
                            <c:forEach var="i" begin="${page.blockStartNum }" end="${page.blockLastNum }">
                                <c:choose>
                                    <c:when test="${i == curPage }">
                                        <li>
                                            <a href="${path1 }/admin/file/fileList.do?page=${i }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-link is-current" aria-label="Page ${i }" aria-current="page" >${i }</a>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li>
                                            <a href="${path1 }/admin/file/filelist.do?page=${i }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-link" aria-label="Page ${i }" aria-current="page">${i }</a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <br>
                            <br>
                        </ul>
                    </nav>
                    <br>
                </div>
            </div>
        </div>
    </div>

    </div>
<script>
    function checkLogin() {
        var confirmLogin = confirm("글 작성은 로그인이 필요해요! 로그인하시겠어요?");
        if (confirmLogin) {
            location.href = '${path1 }/user/loginForm';
        }
    }
</script>

<jsp:include page="../../include/footer.jsp" />
<script async type="text/javascript" src="${path1 }/resources/js/bulma.js"></script>
</body>
</html>