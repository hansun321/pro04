<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path1" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
    <title>자료실 상세보기</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <c:set var="path" value="<%=request.getContextPath() %>" />
</head>

<style>
    .single-blog-item {
        min-height: 35vh;
    }

    .blog-item-content hr {
        margin-top: 0;
    }

    .blog-item-content p {
        color: black;
        font-size: 1.25rem;
    }
</style>

<body>
<!-- 헤더 부분 인클루드 -->
<jsp:include page="../include/header.jsp" />
<nav class="breadcrumb has-succeeds-separator is-medium is-right mt-3 p-4" style="background: #f1f4f9" aria-label="breadcrumbs">
    <ul class="mr-5">
        <li><a href="${path1}"><i class="xi-home is-size-3"></i></a></li>
        <li><a>자료실</a></li>
        <li><a href="${path1}/file/getFileboard.do"> 파일 상세보기 </a></li>
    </ul>
    <p class="title has-text-centered mt-1 mb-2">자료실</p>
</nav>
<div class="container is-fullhd">
    <div class="content" id="contents">
        <div class="row column1 text-center" style="margin-bottom: 80px;">
            <h2 class="h2">${fileboard.fileBoard.title}</h2>
            <hr>
            <div class="container">
                <table id="table1">
                    <tbody>
                    <tr>
                        <th style="text-align: center;background-color:#dcdcdc">내용</th>
                        <td class="p" style="text-align: center;"><p>${fileboard.fileBoard.content}</p></td>
                    </tr>
                    <tr>
                        <th style="text-align: center;background-color:#dcdcdc">작성일</th>
                        <td class="p" style="text-align: center;">${fileboard.fileBoard.regdate}</td>
                    </tr>
                    <tr>
                        <th style="text-align: center; background-color:#dcdcdc">첨부파일</th>
                        <td style="text-align: center;">
                            <ul style="list-style-type: none; /* 목록 스타일을 없앰 */ padding: 0; /* 왼쪽 여백을 없앰 */">
                                <c:forEach var="file" items="${fileboard.fileList}">
                                    <li>
                                        <a href="${path1}/resources/upload/${file.originFile}" title="${file.fileSize}" download>${file.originFile}</a>
                                    </li>
                                </c:forEach>
                            </ul>
                            <c:if test="${empty fileboard.fileList}">
                                첨부된 파일이 없습니다.
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <th style="text-align: center;background-color:#dcdcdc">조회수</th>
                        <td class="p" style="text-align: center;">${fileboard.fileBoard.visited}</td>
                    </tr>
                    </tbody>
                </table>

                <div class="button" style="float: right; ">
                    <a href="${path1 }/file/list.do" class="button">목록으로</a>
                </div>
            </div>

            <div class="btns has-text-centered">
                <c:choose>
                    <c:when test="${sid.equals('admin')}">
                        <a class="button mx-1" style="background-color: #2B3A55; color: #fff;" href="${path1 }/file/list.do">목록</a>
                            <a class="button is-info mx-1" href="${path1}/file/modifyFileboard.do?postNo=${fileboard.fileBoard.postNo}">수정</a>
                        <a class="button is-danger mx-1" href="${path1}/file/removeFileboard.do?postNo=${fileboard.fileBoard.postNo}">삭제</a>
                    </c:when>
                    <c:otherwise>
                        <a class="button mx-1" style="background-color: #2B3A55; color: #fff;" href="${path1 }/file/list.do">목록</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>


<!-- 푸터 부분 인클루드 -->
<jsp:include page="../include/footer.jsp" />
</body>
</html>