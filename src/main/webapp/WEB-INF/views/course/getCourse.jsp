<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path1" value="${pageContext.request.contextPath }" />
<c:set var="total_price" value="${course.price + course.book_price }"/>

<!DOCTYPE html>
<html>
<head>
    <title>${course.course_name }</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp" />
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

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
        .menu .menu-list {
            position: fixed;
            padding: 30px;
            width: 28%;
        }
        .conwrap .box {
            margin-bottom: 50px;
            background-color: #008CD6;
        }
        .card:hover {
            transform: initial;
            /*border-top: 0;*/
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
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            text-align: left;
            padding: 0;
            border: 0;
            font-size: 0;
            margin: 0 0 14px;
        }
        .total i {
            display: inline-block;
            font-size: 1rem;
            width: 87px;
            font-style: normal;
            line-height: 1;
            letter-spacing: -0.5pt;
            text-align: left;
            vertical-align: top;
        }
        .total p b {
            display: inline-block;
            margin: 0;
            width: calc(100% - 40px);
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
            display: flex;
            flex-direction: row;
            justify-content: space-between;
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
        .menu-list .applyBtn input {
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
        .applyBtn #apply {
            margin-right: 4px;
            background-color: #008CD6;
            color: #fff;
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
        .textbook-price {
            font-size: 1rem;
            color: #008CD6;
            margin-left: 0.1rem;
            font-weight: 600;
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
        <li class="is-active"><a href="${path1 }/course/getCourse?cno=${course.cno }" aria-current="page">수강신청</a></li>
    </ul>
    <p class="title has-text-centered mt-1 mb-2">수강신청</p>
</nav>
<div class="container is-fullhd" style="min-height: 1000px;">
    <div class="columns">
        <div class="column is-8">
            <div class="conwrap">
                <div class="box">
                    <span class="title" style="color: #ffffff; ">${course.course_name }</span>
                </div>
            </div>
            <div class="card article">
                <div class="card-content">
                    <div class="media">
                        <div class="media-content has-text-centered">
                            <img src="${path1 }/resources/upload/${course.imgsrc1 }" alt="강의사진" style="border-radius: 20px; width:300px; max-height: 200px;" >
                        </div>
                    </div>
                    <hr>

                    <div class="content article-body">
                        <p style="padding: 20px 100px; min-height: 100px; font-size: 18px;">
                            <br>
                            ${course.content }
                        </p>
                    </div>
                </div>
            </div>

            <div class="book-info mt-6 ml-2">
                <span class="has-text-black is-size-5 has-text-weight-semibold">교재 정보</span>
                <div class="columns mt-4 is-vcentered">
                    <div class="column is-3">
                        <img src="${path1 }/resources/upload/${course.imgsrc2 }" alt="교재사진" style="border-radius: 20px; width:300px; max-height: 200px;" >
                    </div>
                    <div class="column is-9 ml-1">
                        <p class="has-text-weight-semibold has-text-black is-size-5">${course.book_name}</p>
                        <br>
                        <p class="textbook-price"><fmt:formatNumber value="${course.book_price }" pattern="#,###" />원</p>
                    </div>
                </div>

            </div>


        </div>
        <div class="column is-4">
            <aside class="menu">
                <!-- <span class="box has-text-white has-text-weight-semibold has-text-centered is-size-5" style="color: black;">
                    과정정보
                </span> -->
                <div class="box view_info has-text-white has-text-weight-semibold has-text-centered is-size-5">
                    <span class="course" style="color: black;">과정정보</span>
                    <dl>
                        <dt>강사명</dt>
                        <dd>${course.teacher_name }</dd>
                    </dl>
                    <dl>
                        <dt>개강일</dt>
                        <dd>${course.start_date }</dd>
                    </dl>
                    <dl>
                        <dt>종강일</dt>
                        <dd>${course.end_date }</dd>
                    </dl>
                    <dl>
                        <dt>신청인원/총 인원</dt>
                        <dd>${course.curr_num }/${course.total_num }</dd>
                    </dl>
                </div>
                <ul class="menu-list">
                    <li>
                        <!-- 수강료 안내 -->
                        <div class="price_in">
                            <div class="price_scroll mCustomScrollbar _mCS_1 mCS_no_scrollbar">
                                <div id="mCSB_1" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" style="max-height: none;" tabindex="0">
                                    <div id="mCSB_1_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position:relative; top:0; left:0;" dir="ltr">
                                        <p class="price_h4">수강료</p>
                                        <span class="pointColor price" id="price"><strong id="course_price" class="eng"><fmt:formatNumber value="${course.price }" pattern="#,###" />원</strong></span>
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
                                <i>판매금액</i>
                                <b id="sum_price"><fmt:formatNumber value="${course.price }" pattern="#,###" />원</b>
                            </p>
                            <p style="display: flex">
                                <input type="checkbox" id="book_price" name="book_price" checked >
                                <label for="book_price"><i> 교재금액</i></label>
                                <b id="delivery_price"><fmt:formatNumber value="${course.book_price }" pattern="#,###" />원</b>
                            </p>
                            <!--<p>
                                <i>할인금액</i>
                                <b id="discount_price" class="red">0원</b>
                            </p>-->
                            <h4><i style="margin-top: 8px;">총 결제금액</i><span class="pointColor price"><strong id="total_price" class="eng"><fmt:formatNumber value="${total_price }" pattern="#,###" />원</strong></span></h4>
                        </div>
                        <!-- 신청 버튼 -->
                        <div class="applyBtn">
                            <a id="apply" class="apply bgColor"><i class="icofont-pencil"></i> 수강신청</a>
                        </div>
                    </li>

                </ul>
            </aside>
        </div>
    </div>
</div>
<script>
    $(window).scroll(function(){
        $(".menu-list").css("margin-top",Math.max(-250,0-$(this).scrollTop()));
    });
    $(document).ready(function(){
        $("#book_price").change(function(){
            if($("#book_price").is(":checked")){
                $('#total_price').text((${course.book_price +course.price })+'원');
            } else {
                $('#total_price').text(${course.price }+'원');
            }
        });
    });
    $(document).ready(function(){
        // 숫자 포맷 함수
        function formatNumber(number) {
            return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        }

        $("#book_price").change(function(){
            if($("#book_price").is(":checked")){
                $('#total_price').text(formatNumber(${course.book_price + course.price }) + '원');
            } else {
                $('#total_price').text(formatNumber(${course.price }) + '원');
            }
        });
    });
    /*$(document).ready(function(){
            var price=$("#total_price").val();
            let fn3 = () =>  $.ajax({
                type:"get",                     // type:"get" => @RequestParam 으로 받는 경우
                url:"${path1}/course/signIn?price="+price+"&cno=${course.cno }", // url:"./insertForm?num="+$("#num").val()+"&title="+$("#title").val();
                success: function(t){ console.log("성공", t); },
                //success: function(t){ var t1 = JSON.parse(t); },
                error:function(err){ console.log("실패", err); }
            });
            $("#apply").on("click", function() { fn3() });
    });
 */
    $(document).ready(function(){
        $("#apply").click(function(){
            // 회원만 수강 신청 가능
            if(${sid eq null }){
                alert("수강신청은 로그인 후 가능합니다.");
                window.location.href = '${path1}/user/loginForm';
            } else if (${sid ne null && isEnroll eq false }){
                if (new Date('${course.end_date}') < new Date()) {
                    alert("이미 종강한 강의입니다.");
                    window.location.href = '${path1}/course/list.do';
                } else if (${course.curr_num == course.total_num }) {
                    alert("모집이 마감된 강의입니다.");
                    window.location.href = '${path1}/course/list.do';
                } else {
                    if($("#book_price").is(":checked")){
                        window.location.href = '${path1}/course/signIn?cno=${course.cno}&book=1';
                    } else {
                        window.location.href = '${path1}/course/signIn?cno=${course.cno}&book=0';
                    }
                }
            } else {
                //if (${sid ne null && isEnroll eq true })
                alert("이미 수강신청한 강의입니다. ");
                window.location.href = '${path1 }/course/mypageCourse?complete=0';
            }
        });
    });
</script>
<!-- 푸터 부분 인클루드 -->
<jsp:include page="../include/footer.jsp" />
</body>
</html>

