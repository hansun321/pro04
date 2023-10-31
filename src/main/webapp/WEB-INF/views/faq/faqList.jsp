<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path1" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
    <title>자주 묻는 질문</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp" />
    <link href="https://cdn.jsdelivr.net/npm/bulma-accordion@2.0.1/dist/css/bulma-accordion.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <style>
        .breadcrumb a { color: #464646; }
        *{
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

        .wrapper {
            max-width: 75%;
            margin: auto;
        }

        .wrapper > h1 {
            text-align: center;
        }

        .accordion {
            background-color: white;
            color: rgba(0, 0, 0, 0.8);
            cursor: pointer;
            font-size: 20px;
            width: 100%;
            padding: 2rem 2.5rem;
            border: none;
            outline: none;
            transition: 0.4s;
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-weight: bold;
        }

        .accordion i {
            font-size: 1.6rem;
        }

        .active,
        .accordion:hover {
            background-color: #f1f7f5;
        }

        .pannel {
            padding: 0 2rem 2.5rem 2rem;
            background-color: white;
            overflow: hidden;
            background-color: #f1f7f5;
            display: none;
        }

        .pannel p{
            color: rgba(0, 0, 0, 0.7);
            font-size: 18px;
            line-height: 1.4;
        }

        .faq {
            border: 1px solid rgba(0, 0, 0, 0.2);
        }
    </style>

</head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src=https://cdn.jsdelivr.net/npm/bulma-accordion@2.0.1/dist/js/bulma-accordion.min.js"></script>
<body>
<!-- 헤더 부분 인클루드 -->
<jsp:include page="../include/header.jsp" />
<nav class="breadcrumb has-succeeds-separator is-medium is-right mt-3 p-4" style="background: #f1f4f9" aria-label="breadcrumbs">
    <ul class="mr-5">
        <li><a href="${path1}"><i class="xi-home is-size-3"></i></a></li>
        <li><a>커뮤니티</a></li>
        <li><a href="${path1}/faq/list.do">자주 묻는 질문</a></li>
    </ul>
    <p class="title has-text-centered mt-1 mb-2">자주 묻는 질문</p>
<%--    <h3 class="contents">고객님들과 학생들이 자주 묻는 질문들을 한 눈에 볼 수 있는 해법의 FAQ입니다.</h3>--%>
</nav>
<div class="wrapper">
    <c:forEach var="faq" items="${faqList }" varStatus="status">
    <div class="faq active">
        <button class="accordion">
                ${status.count }. &nbsp;&nbsp; ${faq.question }
            <i class="fa-solid fa-chevron-circle-down"></i>
        </button>
        <div class="pannel">
            <p>${faq.answer}</p>
        </div>
    </div>
        <br>
        <br>
    </c:forEach>
    <br>
    <br>
    <br>
</div>

<script>
    var acc = document.getElementsByClassName("accordion");
    var i;

    for(i=0; i<acc.length; i++){
        acc[i].addEventListener("click", function (){
           this.classList.toggle("active");
           this.parentElement.classList.toggle("active");

           var pannel = this.nextElementSibling;

           if(pannel.style.display === "block"){
               pannel.style.display = "none";
           } else {
               pannel.style.display = "block";
           }
        });
    }
</script>

<!-- 푸터 부분 인클루드 -->
<jsp:include page="../include/footer.jsp" />
</body>
</html>
