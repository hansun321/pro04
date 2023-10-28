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
    <title>후기 상세보기</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp"></jsp:include>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <c:set var="path" value="<%=request.getContextPath() %>" />
    <%--  <%@ include file="../common.jsp"%>--%>
</head>
<style>
    .breadcrumb a { color: #464646; }
    @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap');
    /*
    *{
      font-family: 'Nanum Gothic Coding', monospace;
    } */
    /*  .h2{
        font-family: 'Nanum Gothic Coding', monospace;
        font-weight: 400;
        line-height: 110px;
        text-align: center;
        font-size: 1.75em;
        margin-bottom: 0.5714em;
      }
      .content h2 {
        line-height: 120px;
        font-size: 1.75em;
        margin-bottom: 0.5714em;
      }
      .button {
        text-decoration: none;
        border-radius: 20px;
        margin: 15px;
        padding: 10px;
        float: right;
        background-color: #008CD6;
        border-color: #008CD6;
        color: #FFFFFF;
      }
      column is-3 > a {
        text-decoration: none;
        border-radius: 20px;
        margin: 15px;
        padding: 10px;
        float: right;
        background-color: #008CD6;
        border-color: #008CD6;
        color: #FFFFFF;
      }
      .button3 {
        text-decoration: none;
        border-radius: 20px;
        margin: 15px;
        padding: 10px;
        float: right;
        background-color: #FFA500;
        border-color: #FFA500;
        color: #FFFFFF;
      }*/
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
    .btns .button {
        width: 6rem;
    }
    .content small {
        margin-left: 0.25rem;
    }
    .media {
        border-top: 1px solid rgba(219,219,219,.5);
        margin-top: 1rem;
        padding-top: 1rem;
    }
    /*.line hr {
        border: 1px solid rgba(219,219,219,.5);
    }*/
    .cmts {
        border-bottom: 1px solid rgba(219,219,219,.5);
        /*margin: 1px 1px 1px 1px;*/
        padding: 0 0 14px 0;
    }

</style>
<body>
<!-- 헤더 부분 인클루드 -->
<jsp:include page="../include/header.jsp"></jsp:include>
<nav class="breadcrumb has-succeeds-separator is-medium is-right mt-3 p-4" style="background: #F1F4F9" aria-label="breadcrumbs">
    <ul class="mr-5">
        <li><a href="${path1}"><i class="xi-home is-size-3"></i></a></li>
        <li><a>커뮤니티</a></li>
        <li><a href="${path1}/review/list.do">후기</a></li>
    </ul>
    <p class="title has-text-centered mt-1 mb-2">후기</p>
</nav>


<%--<div class="container is-fullhd">
  <div class="content" id="contents">
    <div class="row column1 text-center" style="margin-bottom: 80px;">
      <h2 class="h2">${domain.title}</h2>
      <hr>
      <div class="container">
        <table id="table1">
          <tbody>
          <tr>
            <th style="text-align: center; background-color:#dcdcdc">내용</th>
            <td class="p" style="text-align: center;"><p>${domain.content }</p></td>
          </tr>
          <tr>
            <th style="text-align: center; background-color:#dcdcdc">아이디</th>
            <td class="p" style="text-align: center;"><p>${domain.id }</p></td>
          </tr>
          <tr>
            <th style="text-align: center; background-color:#dcdcdc">작성일</th>
            <td style="text-align: center;">${domain.resdate }</td>
          </tr>
          <tr>
            <th style="text-align: center; background-color:#dcdcdc">조회수</th>
            <td style="text-align: center;">${domain.visit }</td>
          </tr>
          </tbody>
        </table>
        <div class="cmtwrap">
          <c:if test="${!empty sid}">
            <form action="${path1 }/comment/insert.do" method="post" class="columns mt-5">
              <div class="column is-10" style="margin-left: 60px;">
                <textarea class="textarea" name="content" id="content" placeholder="댓글을 입력해주세요!" rows="2" cols="30" maxlength="800" required style="left: 130px;margin-bottom: 50px;"></textarea>
                <input type="hidden" name="author" id="author" value="${sid }">
                <input type="hidden" name="par" id="par" value="${domain.no }">
              </div>
              <div class="column is-2">
                <button type="submit" class="button">등록</button>
              </div>
            </form>
          </c:if>
          <c:if test="${empty sid}">
            <div class="column is-10">
              <div class="commentnull"
                   style="margin-left: 400px;
                                 font-weight: 500;
                                 margin-bottom: 20px;
                                 font-size: 25px;">
                「 댓글을 작성하시려면 로그인을 해주세요 ! 」
              </div>
            </div>
          </c:if>
        </div>
        <c:forEach items="${commentList }" var="comment" varStatus="status">
          <article class="media">
            <figure class="media-left">
              <div class="image is-64x64" style="border-radius: 50%; background-color: #2B3A55; color: #FFFFFF; ">
                <p style=" color: #FFFFFF; text-align: center; padding: 20px 0px;">
                    ${comment.author }
                </p>
              </div>
            </figure>
            <div class="media-content">
              <div class="content">
                <p style="line-height: 1.3;">
                  <strong>${comment.author }</strong>
                  <small> ${comment.regdate }</small>
                  <br>
                <p style="color: black; font-size: 20px; line-height: 1.3;" >${comment.content }</p>
              </div>
            </div>
            <c:if test='${sid eq comment.author }'>
              <div class="media-right">
                <a class="delete" style="background-color: #2B3A55"
                   href="${path1 }/comment/delete.do?dno=${comment.dno}&no=${domain.no}">x</a>
              </div>
            </c:if>
          </article>
        </c:forEach>
&lt;%&ndash;        <div class="btn-group" style="float: right">&ndash;%&gt;
&lt;%&ndash;          <a href="${path1 }/review/list.do" class="button">목록으로</a>&ndash;%&gt;
&lt;%&ndash;          <br>&ndash;%&gt;
&lt;%&ndash;          <br>&ndash;%&gt;
&lt;%&ndash;        </div>&ndash;%&gt;
&lt;%&ndash;&lt;%&ndash;        <c:if test= "${sid.equals('admin')}">&ndash;%&gt;&ndash;%&gt;
&lt;%&ndash;          <div class="button-group">&ndash;%&gt;
&lt;%&ndash;            <a class="button" href="${path1 }/review/list.do">목록으로</a>&ndash;%&gt;
&lt;%&ndash;            <a class="button3" href="${path1 }/review/delete.do?no=${domain.no}">삭제</a>&ndash;%&gt;
&lt;%&ndash;            <a class="button3" href="${path1 }/review/edit.do?no=${domain.no}">수정</a>&ndash;%&gt;
&lt;%&ndash;          </div>&ndash;%&gt;
&lt;%&ndash;&lt;%&ndash;        </c:if>&ndash;%&gt;&ndash;%&gt;
        <c:choose>
          <c:when test="${not empty sid && sid eq 'admin'}">
            <div class="column">
              <a class="button3" href="${path1 }/review/delete.do?no=${domain.no}">삭제</a>
              <a class="button" href="${path1 }/review/list.do">목록으로</a>
            </div>
          </c:when>
          <c:when test="${not empty sid && sid eq domain.id}">
            <div class="column">
              <a class="button3" href="${path1 }/review/edit.do?no=${domain.no}">수정</a>
              <a class="button3" href="${path1 }/review/delete.do?no=${domain.no}">삭제</a>
              <a class="button" href="${path1 }/review/list.do">목록으로</a>
            </div>
          </c:when>
          <c:otherwise>
            <div class="column">
              <a class="button" href="${path1 }/review/list.do">목록으로</a>
            </div>
          </c:otherwise>
        </c:choose>
        <br>
      </div>
    </div>
  </div>
</div>--%>

<div class="container">
    <div class="columns is-multiline mt-1">
        <div class="column is-12 mb-5 border-top">
            <div class="single-blog-item">
                <div class="blog-item-content ml-6 mt-3">
                    <%--<h2 class="mt-4">A place where start new life with peace</h2>--%>
                    <p class="has-text-black has-text-weight-semibold mt-1" style="font-size: 1.75rem;">${domain.title }</p>
                    <div class="blog-item-meta py-2 mb-4">
                        <span class="is-size-6 mr-3">작성자
                            <span class="is-size-6 has-text-grey ml-1">${domain.id }</span>
                        </span> |
                        <span class="is-size-6 mx-3">작성일
                            <span class="is-size-6 has-text-grey ml-1">${domain.resdate }</span>
                        </span> |
                        <span class="is-size-6 mx-3">조회수
                            <span class="is-size-6 has-text-grey ml-1">${domain.visit }</span>
                        </span>
                    </div>
                    <hr>
                    <p>
                        ${domain.content }
                    </p>
                </div>
            </div>

            <div class="btns has-text-centered">
                <c:choose>
                    <c:when test="${not empty sid && sid eq 'admin'}">
                        <a class="button mx-1" style="background-color: #2B3A55; color: #fff;" href="${path1 }/review/list.do">목록</a>
                        <a class="button is-danger mx-1" href="${path1 }/review/delete.do?no=${domain.no}">삭제</a>
                    </c:when>
                    <c:when test="${not empty sid && sid eq domain.id}">
                        <a class="button mx-1" style="background-color: #2B3A55; color: #fff;" href="${path1 }/review/list.do">목록</a>
                        <a class="button is-info" href="${path1 }/review/edit.do?no=${domain.no}">수정</a>
                        <a class="button is-danger mx-1" href="${path1 }/review/delete.do?no=${domain.no}">삭제</a>
                    </c:when>
                    <c:otherwise>
                        <a class="button mx-1" style="background-color: #2B3A55; color: #fff;" href="${path1 }/review/list.do">목록</a>
                    </c:otherwise>
                </c:choose>
            </div>

            <div class="cmtwrap mt-6 <%--border-top--%>">
                <div class="cmts ml-6">
                    <c:forEach items="${commentList }" var="comment" varStatus="status">
                        <article class="media">
                            <figure class="media-left">
                                <div class="image is-64x64" style="border-radius: 50%; background-color: #2B3A55; color: #FFFFFF; ">
                                    <p style=" color: #FFFFFF; text-align: center; padding: 20px 0px;">
                                            ${comment.author }
                                    </p>
                                </div>
                            </figure>
                            <div class="media-content">
                                <div class="content">
                                    <p style="line-height: 1.3;">
                                        <strong>${comment.author }</strong>
                                        <small> ${comment.regdate }</small>
                                        <br>
                                    <p style="color: black; font-size: 20px; line-height: 1.3;" >${comment.content }</p>
                                </div>
                            </div>
                            <c:if test='${sid eq comment.author }'>
                                <div class="media-right">
                                    <a class="delete" style="background-color: #2B3A55"
                                       href="${path1 }/comment/delete.do?dno=${comment.dno}&no=${domain.no}">x</a>
                                </div>
                            </c:if>
                        </article>
                    </c:forEach>
                </div>



                <c:if test="${!empty sid}">
                    <form action="${path1 }/comment/insert.do" method="post" class="columns mt-5">
                        <div class="column is-10 ml-6" <%--style="margin-left: 60px;"--%>>
                            <textarea class="textarea" name="content" id="content" placeholder="댓글을 입력해주세요!" rows="2" cols="30" maxlength="800" required ></textarea>
                            <input type="hidden" name="author" id="author" value="${sid }">
                            <input type="hidden" name="par" id="par" value="${domain.no }">
                        </div>
                        <div class="column is-2 ml-3">
                            <button type="submit" class="button is-medium is-link" style="height: 4.25rem; width: 8.5rem;">등록</button>
                        </div>
                    </form>
                </c:if>
                <c:if test="${empty sid}">
                    <div class="column is-10">
                        <div class="commentnull"
                             style="margin-left: 400px;
                                 font-weight: 500;
                                 margin-bottom: 20px;
                                 font-size: 25px;">
                            「 댓글을 작성하시려면 로그인을 해주세요 ! 」
                        </div>
                    </div>
                </c:if>
            </div>

        </div>
    </div>
</div>
<!-- 푸터 부분 인클루드 -->
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>