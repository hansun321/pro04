<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path1" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
  <title>수정</title>
  <!-- 헤드 부분 인클루드 -->
  <jsp:include page="../include/head.jsp" />
  <script type="text/javascript" src="${path1 }/resources/ckeditor/ckeditor.js"></script>
  <%--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />--%>

</head>
<style>
  @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap');

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
        <li><a style="color: black;" href="${path1}"><i class="xi-home is-size-3"></i></a></li>
        <li><a style="color: black;">커뮤니티</a></li>
        <li><a style="color: black; " href="${path1}/notice/list.do">공지사항</a></li>
    </ul>
    <p class="title has-text-centered mt-1 mb-2">공지사항</p>
</nav>

<%--<div class="container is-fullhd">
    <div class="content" id="contents">
        <div class="row column1 text-center">
            &lt;%&ndash;<h2 class="h2">공지사항 수정</h2>
            <hr>&ndash;%&gt;
            <div class="container">
                <form action="${path1 }/notice/edit.do" method="post">
                    <table id="table1">
                        <tbody>
                        <tr>
                            <th style="background-color:#dcdcdc">제목</th>
                            <td>
                                <input type="hidden" name="no" id="no" value="${domain.no }">
                                <input type="text" name="title" id="title" class="input" placeholder="제목 입력"
                                       value="${domain.title }"
                                       maxlength="98" required>
                            </td>
                        </tr>
                        <tr>
                            <th style="background-color:#dcdcdc">내용</th>
                            <td>
                            <textarea name="content" class="textarea" id="content" placeholder="내용 입력" rows="8" cols="100"  maxlength="800"  required>
                                ${domain.content }
                            </textarea>
                            <script>
                                CKEDITOR.replace('content', {filebrowserUploadUrl: '${path1}/notice/imageUpload.do'});
                            </script>
                            </td>
                        </tr>

                        <tr>
                            <td colspan="2">
                                <input type="submit" class="button3" value="수정">
                                <a class="button" href="${path1 }/notice/list.do">목록으로</a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
    </div>
</div>--%>
<div class="container">
    <div class="columns">
        <div class="column is-10 is-offset-1">
            <form action="${path1 }/notice/edit.do" method="post">
                <table class="table is-centered is-fullwidth">
                    <tbody>
                    <tr class="border-top">
                        <th class="has-text-centered">제목</th>
                        <td>
                            <input type="hidden" name="no" id="no" value="${domain.no }">
                            <input type="text" name="title" id="title" class="input" placeholder="제목 입력"
                                   value="${domain.title }"
                                   maxlength="98" required>
                        </td>
                    </tr>
                    <tr class="border-bottom">
                        <th class="has-text-centered">내용</th>
                        <td>
                            <textarea name="content" class="textarea" id="content" placeholder="내용 입력" rows="8" cols="100"  maxlength="800"  required>
                                ${domain.content }
                            </textarea>
                            <script>
                                CKEDITOR.replace('content', {filebrowserUploadUrl: '${path1}/notice/imageUpload.do'});
                            </script>
                        </td>
                    </tr>
                    <%--<tr>
                        <td colspan="2">
                            <input type="submit" class="button3" value="수정">
                            <a class="button" href="${path1 }/notice/list.do">목록으로</a>
                        </td>
                    </tr>--%>
                    </tbody>
                </table>
                <div class="has-text-centered mb-5">
                    <button type="submit" class="button is-link p-5" style="border-radius: 1.5rem;">수정하기</button>
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