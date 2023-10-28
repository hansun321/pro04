<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path1" value="<%=request.getContextPath()%>" />
<c:set var="path2" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
    <title>후기 남기기</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp"></jsp:include>
    <script src="https://cdn.ckeditor.com/4.20.0/standard/ckeditor.js"></script>
    <script type="text/javascript" src="${path1 }/resources/ckeditor/ckeditor.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script>
        if (${not empty msg } ) {
            alert("${msg }");
        };
    </script>

</head>
<style>

    @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap');

    /*
    *{
        font-family: 'Nanum Gothic Coding', monospace;
    } */

/*    .h2{
        font-family: 'Nanum Gothic Coding', monospace;
        font-weight: 400;
        line-height: 110px;
        text-align: center;
        font-size: 1.75em;
        margin-bottom: 0.5714em;
    }

    .button {
        text-decoration: none;
        border-radius: 20px;
        margin: 15px;
        padding: 10px;
        float: right;
        background-color: #1D7151;
        border-color: #1D7151;
        color: #ffffff;
    }
    .button2 {
        text-decoration: none;
        border-radius: 20px;
        margin: 15px;
        padding: 10px;
        float: right;
        background-color: #FFA500;
        border-color: #FFA500;
        color: #ffffff;
    }

    .column1 {
        text-align: center;
        display: block;
        flex-basis: 0;
        flex-grow: 1;
        flex-shrink: 1;
        padding: 0.75rem;
    }*/

    .table th {
        white-space: nowrap;
        vertical-align: middle;
    }
</style>

<body>
<!-- 헤더 부분 인클루드 -->
<jsp:include page="../include/header.jsp"></jsp:include>
<nav class="breadcrumb has-succeeds-separator is-medium is-right mt-3 p-4" style="background: #f1f4f9" aria-label="breadcrumbs">
    <ul class="mr-5">
        <li><a href="${path1}"><i class="xi-home is-size-3"></i></a></li>
        <li><a>커뮤니티</a></li>
        <li><a href="${path1}/review/list.do">후기</a></li>
        <li><a href="${path1}/review/insert.do">후기 등록</a></li>
    </ul>
    <p class="title has-text-centered mt-1 mb-2">후기</p>
</nav>
<%--<div class="container is-fullhd">
    <div class="content" id="contents">
        <div class="row column1 text-center">
            &lt;%&ndash;<h2 class="h2">후기 남기기</h2>
            <hr>&ndash;%&gt;
            <div class="container">
                <form action="${path1 }/review/insert.do" method="post" >
                    <table id="table1">
                        <tbody>
                        <tr>
                            <th style="background-color:#dcdcdc">제목</th>
                            <td>
                                <input type="text" name="title" id="title" class="input" value="${title }" placeholder="제목 입력" maxlength="98" required>
                            </td>
                        </tr>
                        <tr>
                            <th style="background-color:#dcdcdc">내용</th>
                            <td>
                                <textarea name="content" id="content" class="textarea" placeholder="내용 입력" rows="8" cols="100" maxlength="1400" required>${content }</textarea>
                                <script>
                                    CKEDITOR.replace('content',	{filebrowserUploadUrl:'${path1}/review/imageUpload.do'});
                                </script>
                            </td>
                        </tr>

                        <tr>
                            <td colspan="2">
                                <input type="submit" class="button2" value="등록" >
                                <a class="button" href="${path1 }/review/list.do">목록으로</a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </form>
                <script>
                    if (${not empty msg } ) {
                        alert("${msg }");
                    };
                </script>
            </div>
        </div>
    </div>
</div>--%>

<div class="container">
    <div class="columns">
        <div class="column is-10 is-offset-1">
            <form action="${path1 }/review/insert.do" method="post" onsubmit="return ckbad(this)">
                <table class="table is-centered is-fullwidth">
                    <tbody>
                    <tr class="border-top">
                        <th class="has-text-centered">제목</th>
                        <td>
                            <input type="text" name="title" id="title" class="input" value="${title }"  placeholder="제목 입력" maxlength="98" required>
                        </td>
                    </tr>
                    <tr class="border-bottom">
                        <th class="has-text-centered">내용</th>
                        <td>
                            <textarea name="content" id="content" class="textarea" placeholder="내용 입력" rows="8" cols="100" maxlength="1400" required>${content }</textarea>
                            <script>
                                CKEDITOR.replace('content',	{filebrowserUploadUrl:'${path1}/review/imageUpload.do'});
                            </script>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <div class="has-text-centered">
                    <button type="submit" class="button is-link mb-5 p-5" style="border-radius: 1.5rem;">등록하기</button>
                </div>
            </form>
        </div>
        <div class="column is-1"></div>
    </div>
</div>

<!-- 푸터 부분 인클루드 -->
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>