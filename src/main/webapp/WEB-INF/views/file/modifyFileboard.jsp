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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<style>
    .breadcrumb a { color: #464646; }
    @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap');
    .table th {white-space: nowrap;vertical-align: middle;}
</style>

<body>
<!-- 헤더 부분 인클루드 -->
<jsp:include page="../include/header.jsp" />
<nav class="breadcrumb has-succeeds-separator is-medium is-right mt-3 p-4" style="background: #f1f4f9" aria-label="breadcrumbs">
    <ul class="mr-5">
        <li><a href="${path1}"><i class="xi-home is-size-3"></i></a></li>
        <li><a href="${path1}/file/list.do">자료실</a></li>
        <li><a href="${path1}/file/list.do">파일 자료 수정</a></li>
    </ul>
    <p class="title has-text-centered mt-1 mb-2">자료실</p>
</nav>
<div class="container is-fullhd">
    <div class="content" id="contents">
        <div class="row column1 text-center">
            <%--<h2 class="h2">파일 자료 수정하기</h2>
            <hr>--%>
            <div class="container">
                <form enctype="multipart/form-data" method="post" action="${path1}/file/modifyFileboard.do">
                    <input type="hidden" name="postNo" value="${postNo}" />
                    <table id="table1">
                        <tbody>
                            <tr>
                                <th style="background-color:#dcdcdc">제목 </th>
                                <td>
                                    <input type="hidden" name="no" id="no" value="${fileboard.fileBoard.title}">
                                    <input type="text" name="title" id="title" class="input" placeholder="제목 입력" value="${fileboard.fileBoard.title}" maxlength="98" required>
                                </td>
                            </tr>
                            <tr>
                                <th style="background-color:#dcdcdc">내용</th>
                                <td>
                                    <textarea name="content" class="textarea" id="content" placeholder="내용 입력" rows="8" cols="100" maxlength="800" required>${fileboard.fileBoard.content}</textarea>
                                    <script>
                                        CKEDITOR.replace('content',	{filebrowserUploadUrl:'${path1}/file/imageUpload.do'});
                                    </script>
                                </td>
                            </tr>
                            <tr>
                                <th style="background-color:#dcdcdc">내용</th>
                                <td>
                                    <div class="control" style="text-align: left;">
                                        <h4 class="has-text-weight-bold">현재 파일</h4>
                                        <c:forEach var="file" items="${fileboard.fileList}">
                                            <a href="${path1}/resources/upload/${file.originFile}" title="${file.fileSize}" download>${file.originFile}</a>
                                            <button type="button" class="remove_btn" style="display:inline-block;padding:0;background-color: black;color:#fff;width:18px;height:18px;font-size:12px;line-height:18px;text-align:center;border-radius:10px;" data1="${file.no}" data2="${file.postNo}">x</button><br>
                                        </c:forEach>
                                        <c:if test="${empty fileboard.fileList}">
                                            첨부된 파일이 없습니다.
                                        </c:if>
                                    </div>
                                <br>
                                <br>
                                    <h4 class="has-text-weight-bold" style="text-align: left">새로운 파일</h4>
                                    <div class="control">
                                        <label for="file1" class="file-label">
                                            <span style="padding: 5px; margin: 5px">파일1 : </span>
                                            <input type="file" name="file1" id="file1" class="file-input" required>
                                            <span class="file-cta">
                                                <span class="file-icon">
                                                    <i class="fas fa-upload"></i>
                                                </span>
                                                <span class="file-label">
                                                    <span id="file1Name">파일을 첨부해주세요</span>
                                                </span>
                                            </span>
                                </label>
                            </div>
                            <div class="control">
                                <label for="file2" class="file-label">
                                    <span style="padding: 5px; margin: 5px">파일2 : </span>
                                    <input type="file" name="file2" id="file2" class="file-input" required>
                                    <span class="file-cta">
                                                    <span class="file-icon">
                                                        <i class="fas fa-upload"></i>
                                                    </span>
                                                <span class="file-label">
                                                    <span id="file2Name">파일을 첨부해주세요</span>
                                                </span>
                                            </span>
                                </label>
                            </div>
                            <div class="control">
                                <label for="file3" class="file-label">
                                    <span style="padding: 5px; margin: 5px">파일3 : </span>
                                    <input type="file" name="file3" id="file3" class="file-input" required>
                                    <span class="file-cta">
                                                    <span class="file-icon">
                                                        <i class="fas fa-upload"></i>
                                                    </span>
                                                <span class="file-label">
                                                    <span id="file3Name">파일을 첨부해주세요</span>
                                                </span>
                                            </span>
                                </label>
                                <script>
                                    document.getElementById('file1').addEventListener('change', function () {
                                        document.getElementById('file1Name').textContent = this.files[0].name;
                                    });

                                    document.getElementById('file2').addEventListener('change', function () {
                                        document.getElementById('file2Name').textContent = this.files[0].name;
                                    });

                                    document.getElementById('file3').addEventListener('change', function () {
                                        document.getElementById('file3Name').textContent = this.files[0].name;
                                    });
                                </script>
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <div class="has-text-centered">
                    <button type="submit" class="button is-link mb-5 p-5" style="border-radius: 1.5rem;">수정하기</button>
                </div>
            </form>
        </div>
        <div class="column is-1"></div>
    </div>
</div>--%>

<div class="container">
    <div class="columns">
        <div class="column is-10 is-offset-1">
            <form enctype="multipart/form-data" method="post" action="${path1}/file/modifyFileboard.do">
                <input type="hidden" name="postNo" value="${postNo}" />
                <table class="table is-centered is-fullwidth">
                    <tbody>
                    <tr class="border-top">
                        <th class="has-text-centered">제목</th>
                        <td>
                            <input type="hidden" name="no" id="no" value="${fileboard.fileBoard.title}">
                            <input type="text" name="title" id="title" class="input" placeholder="제목 입력" value="${fileboard.fileBoard.title}" maxlength="98" required>
                        </td>
                    </tr>
                    <tr>
                        <th class="has-text-centered">내용</th>
                        <td>
                            <textarea name="content" class="textarea" id="content" placeholder="내용 입력" rows="8" cols="100" maxlength="800" required>${fileboard.fileBoard.content}</textarea>
                            <script>
                                CKEDITOR.replace('content',	{filebrowserUploadUrl:'${path1}/file/imageUpload.do'});
                            </script>
                        </td>
                    </tr>
                    <tr class="border-bottom">
                        <th class="has-text-centered">파일</th>
                        <td>
                            <div class="control" style="text-align: left;">
                                <%--<h4 class="has-text-weight-bold">현재 파일</h4>--%>
                                <p class="has-text-black">「현재 파일」</p>
                                <c:forEach var="file" items="${fileboard.fileList}">
                                    <a href="${path1}/resources/upload/${file.originFile}" title="${file.fileSize}" download>${file.originFile}</a>
                                    <button type="button" class="remove_btn" style="display:inline-block;padding:0;background-color: black;color:#fff;width:18px;height:18px;font-size:12px;line-height:18px;text-align:center;border-radius:10px;" data1="${file.no}" data2="${file.postNo}">x</button><br>
                                </c:forEach>
                                <c:if test="${empty fileboard.fileList}">
                                    첨부된 파일이 없습니다.
                                </c:if>
                            </div>
                            <br>
                            <%--<br>--%>
                            <p class="has-text-black">「새로운 파일」</p>
                            <div class="control">
                                <label for="file1" class="file-label">
                                    <span style="padding: 5px; margin: 5px">파일1 : </span>
                                    <input type="file" name="file1" id="file1" class="file-input" required>
                                    <span class="file-cta">
                                                <span class="file-icon">
                                                    <i class="fas fa-upload"></i>
                                                </span>
                                                <span class="file-label">
                                                    <span id="file1Name">파일을 첨부해주세요</span>
                                                </span>
                                            </span>
                                </label>
                            </div>
                            <div class="control">
                                <label for="file2" class="file-label">
                                    <span style="padding: 5px; margin: 5px">파일2 : </span>
                                    <input type="file" name="file2" id="file2" class="file-input" required>
                                    <span class="file-cta">
                                                    <span class="file-icon">
                                                        <i class="fas fa-upload"></i>
                                                    </span>
                                                <span class="file-label">
                                                    <span id="file2Name">파일을 첨부해주세요</span>
                                                </span>
                                            </span>
                                </label>
                            </div>
                            <div class="control">
                                <label for="file3" class="file-label">
                                    <span style="padding: 5px; margin: 5px">파일3 : </span>
                                    <input type="file" name="file3" id="file3" class="file-input" required>
                                    <span class="file-cta">
                                                    <span class="file-icon">
                                                        <i class="fas fa-upload"></i>
                                                    </span>
                                                <span class="file-label">
                                                    <span id="file3Name">파일을 첨부해주세요</span>
                                                </span>
                                            </span>
                                </label>
                                <script>
                                    document.getElementById('file1').addEventListener('change', function () {
                                        document.getElementById('file1Name').textContent = this.files[0].name;
                                    });

                                    document.getElementById('file2').addEventListener('change', function () {
                                        document.getElementById('file2Name').textContent = this.files[0].name;
                                    });

                                    document.getElementById('file3').addEventListener('change', function () {
                                        document.getElementById('file3Name').textContent = this.files[0].name;
                                    });
                                </script>
                            </div>
                        </td>
                    </tr>
                    <%--<tr>
                        <td colspan="2">
                            <input type="submit" class="button3" value="수정" >
                            <a class="button" href="${path1 }/file/list.do">목록으로</a>
                        </td>
                    </tr>--%>
                    </tbody>
                </table>
                <div class="has-text-centered">
                    <button type="submit" class="button is-link mb-5 p-5" style="border-radius: 1.5rem;">수정하기</button>
                </div>
            </form>
        </div>
        <div class="column is-1"></div>
    </div>
</div>

<!-- 푸터 부분 인클루드 -->
<jsp:include page="../include/footer.jsp" />
<!-- 푸터 부분 끝 -->
</body>
</html>