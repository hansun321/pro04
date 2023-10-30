<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path1" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
    <title>${course.course_name } 수강신청</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp" />
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <style>
        .content ul {
            list-style-type: none;
        }
        .content ul >li {
            list-style-type: none;
        }
        .icon {
            color: #2B3A55;
        }
        .pagination-link.is-current {
            background-color:#2B3A55;
            border-color: #2B3A55;
        }
        .pagination-link {
            background-color: #ffffff;
        }
        .select:not(.is-multiple):not(.is-loading)::after {
            border-color: #2B3A55;
        }
        form.field.has-addons.has-addons-right {
            float: right;
            padding-top: 3px;
        }
        aside.menu {
            width: 100%;
        }
        .card {
            border-radius: 20px;
            border: 1px solid #008CD6;
        }
        .menu .box {
            border: 1px solid #008CD6;
            border-radius: 20px;
            padding: 10px;
            color: black;
            width: 93%;
            margin: -10px 30px;
            background-color: #fff;
        }
        .view_info h4 {
            font-size: 1.294rem;
            color: #222;
            font-weight: 500;
            letter-spacing: -0.7pt;
            line-height: 1;
            margin: 0 0 22px;
        }
        .view_info dl {
            display: table;
            width: 100%;
            margin: 0 0 17px;
            padding: 0px 30px;
        }
        .view_info dl dt {
            display: table-cell;
            font-weight: 400;
            color: #222;
            letter-spacing: -0.5pt;
            width: 85px;
            vertical-align: top;
            line-height: 1;
        }
        .view_info dl dd {
            letter-spacing: -0.5pt;
            display: table-cell;
            width: calc(100% - 85px);
            vertical-align: top;
            line-height: 1;
            color: black;
            text-align: left;
            padding-left: 21px;
        }
        .conwrap .box {
            margin-bottom: 50px;
            background-color: #008CD6;
        }
        .card:hover {
            transform: initial;
            border-top: 0;
        }
        .price_h4 {
            position: relative;
            font-weight: 400;
            letter-spacing: -0.7pt;
            line-height: 1;
            color: #222;
            margin: 15px 12px 20px;
        }
        #price{
            text-align: right;
            margin: 0 0 20px;
            font-size: 1rem;
            letter-spacing: -0.5pt;
            font-weight: 400;
            line-height: 1;
            display: block;
            color: #008CD6;
        }
        .price_in {
            padding: 30px 30px 0px 30px;
        }
        #course_price {
            color: #008CD6;
        }
        .total {
            background: #fff;
            padding: 25px 30px;
            border-radius: 20px;
            text-align: right;
            margin: 0 30px 30px 30px;
        }
        .total p {
            display: block;
            text-align: left;
            padding: 0;
            border: 0;
            font-size: 0;
            margin: 0 0 14px;
        }
        .total i {
            display: inline-block;
            font-size: 1rem;
            width: 115px;
            font-style: normal;
            line-height: 1;
            letter-spacing: -0.5pt;
            text-align: left;
            vertical-align: top;
        }
        .total p b {
            display: inline-block;
            margin: 0;
            width: calc(100% - 115px);
            text-align: right;
            line-height: 1;
            vertical-align: top;
            font-size: 1rem;
        }
        .total h4 {
            font-size: 0;
            padding: 15px 0 0;
            margin: 15px 0 0;
            border-top: 1px solid #ddd;
        }
        .total h4 .pointColor .price {
            display: inline-block;
            font-size: 1rem;
            width: calc(100% - 115px);
            text-align: right;
            margin-left: 0;
        }
        #total_price {
            font-size: 1.14rem;
            color: #008CD6;
        }
        .applyBtn {
            clear: both;
            margin: 13px 0;
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .menu-list .applyBtn a {
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
            background-color: #fff;
            color: #008CD6;
            white-space: nowrap;
            font-size: 16px;
        }
        .applyBtn a.cart {
            margin-right: 4px;
        }
        .applyBtn button.apply {
            margin-right: 4px;
            background-color: rgb(127, 140, 141);;
            color: #fff;
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
            white-space: nowrap;
            font-size: 16px;
            border:0;
        }
        .breadcrumb a {
            color: #464646;
        }
        .menu-list li{
            padding: 5px;
            border: 1px solid #ccc;
            margin: 1px 0;
            border-radius: 20px;
            background-color: #f1f4f9;
        }
        .agree_fr { width: auto; white-space:pre-wrap; margin: 75px auto;
            padding: 24px; height:300px; overflow-y:auto; }
        .form-check {
            margin: 0 30px 0px 30px;
        }
        .table {
            background-color: #fff;
            color: #363636;
            min-width: 100%;
        }
    </style>
</head>
<body>
<!-- 헤더 부분 인클루드 -->
<jsp:include page="../include/header.jsp" />
<nav class="breadcrumb has-succeeds-separator is-medium is-right mt-3 p-4" style="background: #f1f4f9" aria-label="breadcrumbs">
    <ul class="mr-5">
        <li><a href="${path1}"><i class="xi-home is-size-3"></i></a></li>
        <li><a href="${path1}/course/list.do">강의수강</a></li>
        <li><a href="${path1 }/course/getCourse?cno=${course.cno }" aria-current="page">수강신청</a></li>
        <li><a href="${path1}/course/signIn?cno=${course.cno}&book=${book }" aria-current="page">결제하기</a></li>
    </ul>

    <p class="title has-text-centered mt-1 mb-2">결제하기</p>
</nav>
<div class="container is-fullhd" style="min-height: 1000px;">
    <div class="columns">
        <div class="column is-8">
            <div class="conwrap">
                <div class="box">
                    <span class="title" style="color: #ffffff; ">${course.course_name } 결제하기 </span>
                </div>
            </div>
            <div class="card article">
                <div class="card-content">
                    <div class="media">
                        <div class="media-content has-text-centered">
                            <span class="title article-title">${course.course_name } 수강신청</span>
                        </div>
                    </div>
                    <hr>

                    <div class="content article-body" style="min-height: 220px">
                        <article class="agree_fr">
                            <strong style="font-size: 30px;">[이용약관]</strong>
                            제 1 조 (목적)
                            이 약관은 (주)스마트 해법(이하 “회사”라 함)이 제공하는 제반 서비스의 이용에 관한 조건 및 절차에 관한 기본적인 사항과 기타 필요한 사항을 규정함을 목적으로 한다.

                            제 2 조 (정의)
                            ① 이 약관에서 사용하는 용어의 정의는 다음과 같다.
                            1.서비스 : 구현되는 단말기(PC, TV, 휴대형단말기 등의 각종 유무선 장치를 포함)와 상관없이 회원이 이용할 수 있는 회사에서 제공하는 관련 제반 서비스를 의미한다.
                            2.회 원 : 회사의 서비스에 접속하여 이 약관에 따라 회사와 이용계약을 체결하고 회사가 제공하는 서비스를 이용하는 고객을 말한다.
                            3.아이디(ID) : 회원의 식별과 서비스 이용을 위하여 회원이 정하고 회사가 승인하는 문자와 숫자의 조합을 의미한다.
                            4.비밀번호 : 회원이 부여 받은 아이디와 일치되는 회원임을 확인하고 비밀보호를 위해 회원 자신이 정한 문자 또는 숫자의 조합을 의미한다.
                            5.콘텐츠 : 회사이 웹사이트에서 제공하는 회사가 저작권을 일체 가지고 있는 온라인 강좌 및 기타 관련 모든 정보를 의미한다.
                            6.운영자 : 서비스의 전반적인 관리와 원활한 운영을 위하여 회사에서 선정한 사람을 의미한다.
                            7.해 지 : 회사 또는 회원이 서비스 개통 이후 이용계약을 종료시키는 의사 표시를 의미한다.
                            ② 제1항의 용어를 제외한 용어의 정의는 거래 관행 및 관계 법령에 따른다.
                            제 3 조 (약관의 게시와 개정)
                            ①회사는 이 약관의 내용을 회원이 쉽게 알 수 있도록 서비스 초기 화면에 게시한다.
                            ②회사는 ‘약관의 규제에 관한 법률’, ‘정보통신망 이용촉진 및 정보보호 등에 관한 법률(이하 “정보통신망법”이라 함)’ 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있다.
                            ③회사가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 제1항의 방식에 따라 그 개정약관의 적용일자 30일 전부터 적용일자 전일까지 공지한다. 단 회원의 권리, 의무에 중대한 영향을 주는 변경이 아닌 경우에는 적용일자 7일 전부터 공지하도록 한다.
                            ④제3항에 따라 시행일 이후에 회원이 서비스를 이용하는 경우에는 개정약관에 동의한 것으로 간주한다. 회원은 변경된 약관에 동의하지 않을 경우 이용계약을 해지할 수 있다.
                            ⑤유료서비스를 이용하는 회원이 이 약관의 개정에 대해 동의하지 않아 이용계약을 해지할 경우에는 유료서비스약관이 정한 환불정책에 따른다.
                            제 4 조 (약관의 해석)
                            ①회사는 유료서비스 및 개별서비스에 대해서는 별도의 이용약관 및 정책(이하 “유료서비스약관 등”이라 함)을 둘 수 있으며, 해당 내용이 이 약관과 상충할 경우에는 유료서비스약관 등이 우선하여 적용된다.
                            ②이 약관에서 정하지 아니한 사항이나 해석에 대해서는 유료서비스약관 등 및 관계법령 또는 관례에 따른다.
                            제 5 조 (이용계약 체결)
                            ①이용계약은 회원이 되고자 하는 자(이하 “가입신청자”이라 함)가 약관의 내용에 대하여 동의를 한 다음 회원가입신청을 하고 회사가 이러한 신청에 대하여 승낙함으로써 체결된다.
                            ②회사는 가입신청자의 신청에 대하여 서비스 이용을 승낙함을 원칙으로 한다. 다만, 회사는 다음 각 호에 해당하는 신청에 대하여는 승낙을 하지 않거나 사후에 이용계약을 해지할 수 있다.
                            1.가입신청자가 이 약관에 의하여 이전에 회원자격을 상실한 적이 있는 경우다만, 회원자격 상실 후 1년이 경과한 자로서 회사의 회원 재가입 승낙을 얻은 경우에는 예외로 함.
                            2.실명이 아니거나 타인의 명의를 이용한 경우
                            3.허위의 정보를 기재하거나, 회사가 제시하는 내용을 기재하지 않은 경우
                            4.14세 미만 아동이 법정대리인(부모 등)의 동의를 얻지 아니한 경우
                            5.이용자의 귀책사유로 인하여 승인이 불가능하거나 기타 규정한 제반 사항을 위반하며 신청하는 경우
                            ③제1항에 따른 신청에 있어 회사는 회원의 종류에 따라 전문기관을 통한 실명확인 및 본인인증을 요청할 수 있다.
                            ④회사는 서비스 관련 설비의 여유가 없거나, 기술상 또는 업무상 문제가 있는 경우에는 승낙을 유보할 수 있다.
                            ⑤제2항과 제4항에 따라 회원가입 신청의 승낙을 하지 아니하거나 유보한 경우, 회사는 원칙적으로 이를 가입신청자에게 알리도록 한다.
                            ⑥이용계약의 성립 시기는 회사는 신청절차 상 가입완료를 한 시점으로 한다.
                            ⑦회사는 회원에 대해 정책에 따라 등급별로 구분하여 이용시간, 이용횟수, 서비스 메뉴 등을 세분하여 이용에 차등을 둘 수 있다.
                            ⑧회사는 회원에 대하여 ‘영화 및 비디오물의 진흥에 관한 법률’ 및 ‘청소년 보호법’ 등에 따른 등급 및 연령 준수를 위해 이용제한이나 등급별 제한을 할 수 있다.
                            제 6 조 (회원정보의 변경)
                            ①회원은 개인정보관리화면을 통하여 언제든지 본인의 개인정보를 열람하고 수정할 수 있다. 다만, 서비스 관리를 위해 필요한 실명, 주민등록번호, 아이디 등은 수정이 불가능하다.
                            ②회원은 회원가입신청 시 기재한 사항이 변경되었을 경우 온라인으로 수정을 하거나 전자우편 등 기타 방법으로 회사에 대하여 그 변경사항을 알려야 한다.
                            ③제2항의 변경사항을 회사에 알리지 않아 발생한 불이익에 대하여 회사는 책임지지 않는다.
                            제 7 조 (개인정보보호 의무)
                            회사는 정보통신망법 등 관계 법령이 정하는 바에 따라 회원의 개인정보를 보호하기 위해 노력한다. 개인정보의 보호 및 사용에 대해서는 관련법 및 회사의 개인정보취급방침이 적용된다. 다만, 회사의 공식 사이트 이외의 링크된 사이트에서는 회사의 개인정보취급방침이 적용되지 않는다.



                        </article>
                        <article class="agree_fr">
                            <strong style="font-size: 30px;">[환불규정]</strong>
                            1.단과(정규과정)
                            ① 수강시작 후 7일 미만 & 5강 미만 수강 시에는 100% 환불 가능
                            ② 수강시작 후 7일 이상 또는 5강 이상 수강 시에는 잔여일에 대한 일할 계산 환불 가능
                            ③ 수강시작 후 수강기간 또는 수강한 강의수가 전체의 50% 이상 경과한 경우 환불 불가
                            ※ 환불금액 = 결제금액-{정상가*(실제 수강일/전체 수강일)}
                            단, 할인적용 등록 시 정상가를 기준으로 환불됨을 숙지해주세요.
                            ※전체 수강일은 복습기간을 제외한 수강일입니다.
                            정상수강 예시) 판매가격 104,000원 [카르페디엠1] 결제하고, 전체 수강일 30일 중 14일을 수강 하였을 경우,
                            -환불금액 = 104,000 - {104,000*(14일/30일)}
                            -최종 환불 금액 = 55,500원(십원 단위 버림)
                            할인수강 예시) 정상가격 104,000원에 20%할인 83,200원에 [카르페디엠1] 결제하고, 전체 수강일 30일 중 14일을 수강 하였을 경우,
                            -환불금액 = 83,200 - {104,000*(14일/30일)}
                            -최종 환불 금액 = 34,700원(십원 단위 버림)
                            2. 단기완성(패키지) 상품 환불정책
                            ① 수강시작 후 7일 미만, 5강 미만 수강 시에는 100% 환불 가능
                            ② 수강시작 후 7일 이상 또는 5강 이상 수강 시 잔여일에 대한 환불이 가능
                            ※ 환불금액 = 결제금액 - {정상가*(실제 수강일/전체 수강일)}
                            *패키지 상품의 경우 할인율이 선적용 되어 있는 상품으로
                            환불시에는 정상가가 적용됨을 필히 숙지부탁드립니다
                            ※ 전체 수강일은 복습기간을 제외한 수강일입니다.
                            [단기완성(패키지) 상품 수강기간 정책]
                            </article>
                        <p style="padding: 20px 100px; min-height: 100px; font-size: 18px;">
                            ${course.content }
                        </p>
                    </div>
                </div>
            </div>

        </div>
        <div class="column is-4">
            <aside class="menu">
                <!-- <span class="box has-text-white has-text-weight-semibold has-text-centered is-size-5" style="color: black;">
                    과정정보
                </span> -->
                <ul class="menu-list">
                    <li>
                        <!-- 수강료 안내 -->
                        <div class="price_in">
                            <div class="price_scroll mCustomScrollbar _mCS_1 mCS_no_scrollbar">
                                <div id="mCSB_1" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" style="max-height: none;" tabindex="0">
                                    <div id="mCSB_1_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position:relative; top:0; left:0;" dir="ltr">
                                        <p class="price_h4">결제상세</p>
                                        <span class="pointColor price" id="price"><strong id="course_price" class="eng"></strong></span>
                                    </div>
                                    <!--<div id="mCSB_1_scrollbar_vertical" class="mCSB_scrollTools mCSB_1_scrollbar mCS-light mCSB_scrollTools_vertical" style="display: none;">
                                        <div class="mCSB_draggerContainer"><div id="mCSB_1_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 30px; height: 0px; top: 0px;">
                                            <div class="mCSB_dragger_bar" style="line-height: 30px;">
                                            </div>
                                        </div>
                                            <div class="mCSB_draggerRail">
                                            </div>
                                        </div>
                                    </div>-->
                                </div>
                            </div>
                        </div>
                        <!-- 최종 금액 -->
                        <div class="total">
                            <p>
                                <i>강의금액</i>
                                <b id="sum_price"><fmt:formatNumber value="${course.price }" pattern="#,###" />원</b>
                            </p>
                            <p>
                                <i>교재금액</i>
                                <b id="book_price">
                                    <c:if test="${book == 1}">
                                        <fmt:formatNumber value="${course.book_price }" pattern="#,###" />원
                                    </c:if>
                                    <c:if test="${book == 0}">
                                        0원
                                    </c:if>
                                </b>
                            </p>
                            <!--<p>
                                <i>할인금액</i>
                                <b id="discount_price" class="red">0원</b>
                            </p>-->
                            <p style="border-top: 1px solid #ddd;"><i style="margin-top: 8px; margin-right: 16px;">총 결제금액</i><span class="pointColor price" style="float: right; ">
                                <strong id="total_price" class="eng">
                                    <c:if test="${book == 1}">
                                        <fmt:formatNumber value="${course.book_price +course.price }" pattern="#,###" />원
                                    </c:if>
                                    <c:if test="${book == 0}">
                                        <fmt:formatNumber value="${course.price }" pattern="#,###" />원
                                    </c:if>
                                </strong></span></p>
                            <p>
                                <i>포인트 결제</i>
                                <b id="point_price">
                                    <c:if test="${book == 1 && user.pt > course.book_price +course.price }">
                                        <input type="number" name="pt_price" id="pt_price" placeholder="사용할 포인트" value="0" class="input" max="${course.book_price +course.price }" required>
                                    </c:if>
                                    <c:if test="${book == 1 && user.pt <= course.book_price +course.price }">
                                        <input type="number" name="pt_price" id="pt_price" placeholder="사용할 포인트" value="0" class="input" max="${user.pt }" required>
                                    </c:if>
                                    <c:if test="${book == 0 && user.pt > course.price }">
                                        <input type="number" name="pt_price" id="pt_price" placeholder="사용할 포인트" value="0" class="input" max="${course.price }" required>
                                    </c:if>
                                    <c:if test="${book == 0 && user.pt <= course.price }">
                                        <input type="number" name="pt_price" id="pt_price" placeholder="사용할 포인트" value="0" class="input" max="${user.pt }" required>
                                    </c:if>
                                </b>
                            </p>
                            <p>
                                <i>실결제 금액</i>
                                <b id="cash_price2">
                                    <strong id="cash_price" class="eng">
                                        <c:if test="${book == 1}">
                                            <fmt:formatNumber value="${course.book_price +course.price }" pattern="#,###" />원
                                        </c:if>
                                        <c:if test="${book == 0}">
                                            <fmt:formatNumber value="${course.price }" pattern="#,###" />원
                                        </c:if>
                                    </strong>
                                </b>
                            </p>
                        </div>
                        <div class="form-check">
                            <input type="checkbox" id="ck_item1" name="ck_item" class="form-check-input">
                            <label for="ck_item1" class="form-check-label">이용약관에 동의합니다.</label><br><br>
                        </div>
                        <div class="form-check">
                            <input type="checkbox" id="ck_item2" name="ck_item2" class="form-check-input">
                            <label for="ck_item2" class="form-check-label">환불규정에 동의합니다.</label><br><br>
                        </div>
                        <!-- 신청 버튼-->
                        <div class="total">
                            <table class="table">
                                <tbody>
                                <tr>
                                    <th>결제 수단</th>
                                    <td>
                                        <select name="pmethod" id="pmethod" class="form-control">
                                            <option value="신용카드">신용카드</option>
                                            <option value="체크카드">체크카드</option>
                                            <option value="계좌이체">계좌이체</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>결제사</th>
                                    <td>
                                        <select name="pcom" id="pcom" class="form-control">
                                            <option value="선택안함">선택안함</option>
                                        </select>
                                        <input type="hidden" name="pcom2" id="pcom2" value="">
                                    </td>
                                </tr>
                                <tr>
                                    <th>결제 번호</th>
                                    <td>
                                        <p id="cnum" style="font-weight:800; font-size: 16px;"></p>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <input type="button" id="pay" value="결제진행" class="btn btn-primary">
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <form action="${path1 }/course/signIn" method="post" id="applyForm">
                            <div class="applyBtn">
                                <a href="${path1 }/course/getCourse?cno=${course.cno }" class="cart pointColor pointBorder"><i class="fa-solid fa-cart-shopping"></i>취소</a>
                                <button id="apply" class="apply bgColor"><i class="icofont-credit-card"></i> 결제완료</button>
                            </div>
                            <!-- hidden으로 form 넘기기 -->
                                <input type="hidden" id="enroll_price" name="enroll_price" value="0">
                                <input type="hidden" id="pt" name="pt" value="${user.pt}">
                            <input type="hidden" id="cno" name="cno" value="${course.cno }">
                            <input type="hidden" id="id" name="id" value="${sid }">
                            <input type="hidden" id="book_name" name="book_name" value="${course.book_name }">

                            <c:if test="${book == 1}">
                                <input type="hidden" id="enroll_cash" name="enroll_cash" value="${course.book_price +course.price }">
                                <input type="hidden" id="book" name="book" value="true">
                            </c:if>
                            <c:if test="${book == 0}">
                                <input type="hidden" id="enroll_cash" name="enroll_cash" value="${course.price }">
                                <input type="hidden" id="book" name="book" value="false">
                            </c:if>
                        </form>
                        <div class="container">
                            <p id="paymentResult" style="color:red;font-size:28px;font-weight:800;">결제 전</p>
                        </div>
                    </li>
                </ul>
            </aside>
        </div>
    </div>
</div>
<script>
    // DOM 요소를 가져오는 함수
    function getElement(id) {
        return document.getElementById(id);
    }

    // pt_price 입력란을 가져옵니다.
    var ptPriceInput = getElement("pt_price");

    // cash_price를 업데이트하는 함수
    function updateCashPrice() {
        // pt_price 입력란에서 값을 가져옵니다.
        var ptPrice = parseInt(ptPriceInput.value, 10) || 0; // 값이 숫자가 아니면 0으로 설정

        // total_price를 가져옵니다. 이 부분은 HTML에 따라 다를 수 있으므로 실제 ID를 사용하세요.
        var total_price = parseFloat(getElement("total_price").innerText.replace(",", "").replace("원", "")) || 0;

        // cash_price를 계산합니다.
        var cashPrice = total_price - ptPrice;

        // cash_price를 HTML에 업데이트합니다.
        getElement("cash_price").innerText = formatPrice(cashPrice); // formatPrice 함수는 숫자를 특정 형식에 맞게 포맷하는 함수입니다.
    }

    // pt_price 입력란에 이벤트 리스너를 추가합니다.
    ptPriceInput.addEventListener("input", updateCashPrice);

    // 초기로드 시 cash_price 업데이트
    updateCashPrice();

    // 숫자를 특정 형식에 맞게 포맷하는 함수 (예: 천 단위 쉼표)
    function formatPrice(price) {
        return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }
</script>

<script>
    var ck_item1 = document.getElementById("ck_item1");
    var ck_item2 = document.getElementById("ck_item2");
    var apply = document.getElementById("apply");
    var paymentResult = document.getElementById("paymentResult");

    apply.addEventListener("click", function(){
        if (ck_item1.checked && ck_item2.checked ) {
            if(paymentResult.textContent === "결제 전"){
                alert("결제를 먼저 진행하세요.");
                event.preventDefault();
            } else {
                document.getElementById("applyForm").submit();
            }
        } else {
            alert("약관 및 환불 규정에 동의하지 않으셨습니다.");
            event.preventDefault();
        }
    });

    function protocol() {
        if (allagr.checked) {
            ck_item1.checked = true;
            ck_item2.checked = true;
        } else {
            ck_item1.checked = false;
            ck_item2.checked = false;
        }
    }
    //$(".form-check").click(function () {
    //    if(ck_item1.checked && ck_item2.checked){
    //        $("#apply").css("background-color","#0078e7");
    //    } else {
    //        $("#apply").css("background-color","#7f8c8d");
    //    }
    //});

        if(paymentResult.textContent === "결제 전"){
            $("#apply").css("background-color","#7f8c8d");
        } else {
            $("#apply").css("background-color","#0078e7");
        }

    //결제모듈 API 연동
    $(document).ready(function(){
        var totalPay=0;
        var proName;
        $("#pay").click(function(){
            if (ck_item1.checked && ck_item2.checked ) {
                var priceText = document.getElementById("cash_price").textContent; // 예시로 "12,000" 문자열
                var priceWithoutCommas = priceText.replace(/,/g, ''); // 쉼표(,) 제거
                var price = parseInt(priceWithoutCommas, 10); // 정수로 변환
                proName = "상품";
                totalPay = price
                alert("결제할 금액 : " + totalPay);
                //상품명_현재시간
                var d = new Date();
                var date = d.getFullYear() + '' + (d.getMonth() + 1) + '' + d.getDate() + '' + d.getHours() + '' + d.getMinutes() + '' + d.getSeconds();
                IMP.init('imp11164187'); // 결제 API를 사용하기 위한 코드 입력!
                IMP.request_pay({		//결제 요청
                    merchant_uid: '상품명_' + date, //상점 거래 ID
                    name: proName,				// 결제 명
                    amount: totalPay,					// 결제금액호
                }, function (rsp) {
                    if (rsp.success) {
                        console.log(rsp);
                        var msg = '결제가 완료 되었습니다.';
                        var r1 = '고유 아이디 : ' + rsp.imp_uid;
                        var r2 = '상점 거래 아이디 : ' + rsp.merchant_uid;
                        var r3 = '결제 금액 : ' + rsp.paid_amount;
                        var r4 = '카드 승인 번호 : ' + rsp.apply_num;

                        //$("#payCk").val("yes");
                        //$("#payAmount").val(rsp.paid_amount);
                        //$("#pmethod").val(rsp.pay_method);
                        //$("#pcom").val(rsp.pg_provider);
                        //$("#cnum").val(rsp.apply_num);
                        //alert(msg);
                        //$("#paymentResult").html(r1+"<br>"+r2+"<br>"+r3+"<br>"+r4);
                    } else {
                        //$("#paymentResult").html('결제실패<br>'+'에러내용 : ' +rsp.error_msg);
                    }
                    //테스트용이므로 실패시에도 그냥 통과시킴
                    $("#payCk").val("yes");
                    $("#payAmount").val(totalPay);
                    $("#pmethod").val("신용카드");
                    $("#pcom").val("삼성카드");
                    $("#cnum").text("123-1234-1234-1278");
                    $("#paymentResult").text("결제 완료 : " + totalPay);
                    $("#apply").css("background-color", "#0078e7");
                    //포인트 결제 금액 저장
                    var ptPriceInput = document.getElementById("pt_price");
                    var enrollPriceInput = document.getElementById("enroll_price");
                    enrollPriceInput.value = ptPriceInput.value;

                    //실결제 금액 저장
                    var enrollCashInput = document.getElementById("enroll_cash");
                    enrollCashInput.value = price;

                });
            } else {
                alert("약관 및 환불 규정에 동의하지 않으셨습니다.");
                event.preventDefault();
            }
        });

    });
</script>

<script>
    $(document).ready(function(){
        var cardArr1 = ["현대카드","농협카드","BC카드","KB카드"];
        var cardArr2 = ["하나카드","농협카드","BC카드"];
        var bankArr = ["카카오뱅크","농협은행","신한은행","기업은행","국민은행"];
        $("#pmethod").change(function(){
            var th = $(this).val();
            if(th==="신용카드"){
                for(var i=0;i<cardArr1.length;i++) {
                    $("#pcom").append("<option value='" + cardArr1[i] + "'>" + cardArr1[i] + "</option>");
                }
            } else if(th==="체크카드"){
                for(var i=0;i<cardArr2.length;i++) {
                    $("#pcom").append("<option value='"+cardArr2[i]+"'>"+cardArr2[i]+"</option>");
                }
            } else {
                for(var i=0;i<bankArr.length;i++) {
                    $("#pcom").append("<option value='"+bankArr[i]+"'>"+bankArr[i]+"</option>");
                }
            }
        }).change();
        $("#pcom").change(function(){
            $("#pcom2").val($(this).val());
        });
    });
</script>
<script>
    function payCheck(f){
        var payCk = f.payCk.value;
        if(payCk!="yes"){
            alert("아직 결제 전 입니다.");
            return;
        }
    }
</script>

<!-- 푸터 부분 인클루드 -->
<jsp:include page="../include/footer.jsp" />
</body>
</html>

