<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path1" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
    <title>로그인</title>
    <jsp:include page="../include/head.jsp" />

    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
    <style>
        .breadcrumb a { color: #464646; }

        .hero .nav, .hero.is-success .nav {
            -webkit-box-shadow: none;
            box-shadow: none;
        }

        .avatar {
            margin-top: -70px;
            padding-bottom: 20px;
        }
        .avatar img {
            padding: 5px;
            background: #fff;
            border-radius: 50%;
            -webkit-box-shadow: 0 2px 3px rgba(10,10,10,.1), 0 0 0 1px rgba(10,10,10,.1);
            box-shadow: 0 2px 3px rgba(10,10,10,.1), 0 0 0 1px rgba(10,10,10,.1);
        }

        .field{
            padding-bottom: 10px;
        }

        .field .input {
            font-size: 1rem;
        }
    </style>
</head>
<body>
<jsp:include page="../include/header.jsp" />

<nav class="breadcrumb has-succeeds-separator is-medium is-right mt-3 p-4" style="background: #f1f4f9" aria-label="breadcrumbs">
    <ul class="mr-5">
        <li><a href="${path1}"><i class="xi-home is-size-3"></i></a></li>
        <li><a href="${path1}/user/loginForm">로그인</a></li>
    </ul>
    <p class="title has-text-centered mt-1 mb-2">로그인</p>
</nav>

<section class="section-sm">
    <div class="container">
        <div class="column is-4 is-offset-4">
            <div class="box has-text-centered">
                <figure class="avatar">
                    <a href="${path1 }/"><img src="${path1 }/resources/images/smarthb.png" alt="해법로고 "></a>
                </figure>
                <form action="${path1 }/user/login" method="post" name="loginForm">
                    <div class="field">
                        <div class="control">
                            <input class="input is-large" type="text" name="id" id="id" placeholder="아이디" autofocus="">
                        </div>
                    </div>

                    <div class="field">
                        <div class="control">
                            <input class="input is-large" type="password" name="pw" id="pw" placeholder="비밀번호">
                        </div>
                    </div>
                    <button class="button is-block is-info is-medium is-fullwidth" type="submit">로그인</button>
                </form>
            </div>
            <div style="display: flex; justify-content: space-between;">
                <span class="has-text-grey">ㆍ 아직 회원이 아니라면?</span>
                <a class="join has-text-grey is-underlined" href="${path1 }/user/agree">회원가입</a>
            </div>
        </div>
    </div>
</section>

<jsp:include page="../include/footer.jsp" />

</body>
</html>