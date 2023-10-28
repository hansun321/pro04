<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>시범 강의 상세보기</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <c:set var="path1" value="<%=request.getContextPath() %>" />

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap');

        *{
            font-family: 'Nanum Gothic Coding', monospace;
        }

        .h2{
            font-family: 'Nanum Gothic Coding', monospace;
            font-weight: 400;
            line-height: 110px;
            text-align: center;
            font-size: 1.75em;
            margin-bottom: 0.5714em;
        }

        .content h2 {
            height: 80px;
            margin-top: 155px;
            text-align: center;
            font-size: 30px;
            margin-bottom: 0.5714em;
            color: #363636;
            font-weight: 540;
            line-height: 40px;
        }

        .column1 {
            margin-top: -125px;
            text-align: center;
            display: block;
            flex-basis: 0;
            flex-grow: 1;
            flex-shrink: 1;
            padding: 0.75rem;
        }

        .p {
            line-height: 35px;
        }

        .button {
            text-decoration: none;
            border-radius: 20px;
            margin: 15px;
            padding: 10px;
            float: right;
            background-color: #008CD6;
            border-color: #008CD6;
            color: #ffffff;
        }


        .video-container {
            display: inline-block;
            width: 60%;
            margin-left: 20px;
        }

        .info-container {
            display: inline-block;
            width: 30%;
        }

        .applyBtn {
            clear: both;
            margin: 13px 0;
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .button3 {
            clear: both;
            margin: 13px;
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .applyBtn a {
            clear: both;
            width: 115px;
            height: 47px;
            line-height: 32px;
            border-radius: 55px;
            vertical-align: middle;
            background-repeat: no-repeat;
            box-sizing: border-box;
            letter-spacing: -0.5pt;
            font-weight: bold;
            background-color: #008CD6;
            color: #ffffff;
            white-space: nowrap;
            font-size: 16px;
            margin-right: 4px;
        }

        .button3 a {
            clear: both;
            width: 115px;
            height: 47px;
            line-height: 47px;
            border-radius: 55px;
            vertical-align: middle;
            background-repeat: no-repeat;
            box-sizing: border-box;
            letter-spacing: -0.5pt;
            font-weight: bold;
            background-color: #FFA500;
            white-space: nowrap;
            font-size: 16px;
            margin-right: 4px;
        }


    </style>
<%--    <video src="${path1}/resources/video/${domain.videofile}" controls></video>--%>
</head>
<body>
<!-- 헤더 부분 인클루드 -->
<jsp:include page="../include/header.jsp"></jsp:include>
<nav class="breadcrumb has-succeeds-separator is-medium is-right mt-3 p-4" style="background: #f1f4f9" aria-label="breadcrumbs">
    <ul class="mr-5">
        <li><a style="color: black;" href="${path1}"><i class="xi-home is-size-3"></i></a></li>
        <li><a style="color: black;" href="${path1}/video/list.do">시범강의</a></li>
        <li><a style="color: black; ">${domain.title }</a></li>
    </ul>
</nav>
<div class="container is-fullhd">
    <div class="content" id="contents">
        <div class="row column1 text-center" style="margin-bottom: 80px;">
            <h2 class="h2" style="font-weight: 400;">${domain.title }</h2>
            <hr>
            <div class="video-container">
                <video class="video" src="${path1}/resources/video/${domain.videofile}" controls></video>
            </div>
            <div class="info-container">
                <div class="info">
                    <table id="table1">
                        <colgroup>
                            <col style="width: 20%">
                            <col style="width: auto">
                        </colgroup>
                        <tbody>
                        <tr>
                            <th style="background-color:#dcdcdc">내용</th>
                            <td class="p"><p style="word-break: keep-all;">${domain.content }</p></td>
                        </tr>
                        <tr>
                            <th style="background-color:#dcdcdc">강사</th>
                            <td>${domain.teacher }</td>
                        </tr>
                        <tr>
                            <th style="background-color:#dcdcdc">작성일</th>
                            <td>${domain.resdate }</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="applyBtn" style="float: right; ">
                <a href="${path1 }/course/getCourse?cno=${domain.no }" id="apply" class="apply bgColor button"><i class="icofont-pencil"></i> 수강신청</a>
                <a href="${path1 }/video/list.do" class="button">목록으로</a>
                <div class="button3">
                    <c:if test= "${sid.equals('admin')}">
                        <a href="${path1 }/video/delete.do?no=${domain.no}">삭제</a>
                    </c:if>
                </div>
            </div>

        </div>
    </div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>
