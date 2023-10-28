<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*" %>
<%@ page import="kr.ed.haebeop.domain.Course" %>
<c:set var="path1" value="${pageContext.servletContext.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
    <title>개강일정</title>
    <jsp:include page="../include/head.jsp" />
    <style>
        .breadcrumb a { color: #464646; }
        .modal-card {
            width: 850px;
        }

        .fc .fc-toolbar-title { font-size: 1.5em; }
        .fc-day-sun a { color: red; }
        .fc-day-sat a { color: blue; }
        .fc .fc-daygrid-day-top { flex-direction: row; }
        .fc th { text-align: center !important; }
        .fc-event-time { display: none; }
    </style>
</head>
<body>
<!-- Header Start -->
<jsp:include page="../include/header.jsp" />
<!-- Header Close -->

<nav class="breadcrumb has-succeeds-separator is-medium is-right mt-3 p-4" style="background: #f1f4f9" aria-label="breadcrumbs">
    <ul class="mr-5">
        <li><a href="${path1}"><i class="xi-home is-size-3"></i></a></li>
        <li><a href="${path1}/course/list.do">강의수강</a></li>
        <li><a href="${path1}/course/schedule.do">개강일정</a></li>
    </ul>
    <p class="title has-text-centered mt-1 mb-2">개강일정</p>
</nav>

<div class="container">
    <div class="columns is-desktop is-justify-content-center">
        <div class="column is-10-desktop mt-5">
            <div id="calendar"></div>
            <div class="modal" id="myModal">
                <div class="modal-background"></div>
                <div class="modal-card">
                    <header class="modal-card-head" style="background-image: url('${path1}/resources/images/modal_bg.png'); ">
                        <p class="modal-card-title has-text-white">수강신청</p>
                        <button class="delete" aria-label="close"></button>
                    </header>
                    <section class="modal-card-body">
                        <!-- 모달 내용 -->
                        <table class="table is-centered is-fullwidth">
                            <thead class="has-background-grey-lighter">
                            <tr>
                                <th class="has-text-centered">강의명</th>
                                <th class="has-text-centered">수강기간</th>
                                <th class="has-text-centered">강사명</th>
                                <th class="has-text-centered">수강료</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td class="has-text-centered" id="c_name"></td>
                                <td class="has-text-centered" id="c_date"></td>
                                <td class="has-text-centered" id="c_tea"></td>
                                <td class="has-text-centered" id="c_cost"></td>
                            </tr>
                            </tbody>
                        </table>

                    </section>
                    <footer class="modal-card-foot columns">
                        <div class="column is-4 is-offset-4 has-text-centered">
                            <a class="button is-info" id="enrolment">수강신청</a>
                        </div>
                        <div class="column is-4"></div>
                    </footer>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Footer Start -->
<jsp:include page="../include/footer.jsp" />
<!-- Footer Close -->

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<%-- fullcalendar 언어 설정관련 script --%>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        var colors = [
            "#2E8B57", // 써머그린
            "#6A5ACD", // 로열 블루
            "#4682B4", // 감청색
            "#FF6347", // 토마토
            "#0055A5", // 진한 네이비
            "#34495E", // 네이비 블루
            "#993300", // 진한 주황 갈색
            "#32CD32", // 라임 그린
            "#666633", // 진한 올리브
            "#1E90FF", // 도지 블루
            "#666666", // 회색
            "#00CED1"  // 다크 터쿼이즈
        ];

        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
            initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
            headerToolbar : { // 헤더에 표시할 툴 바
                start : 'prev next today',
                center : 'title',
                end : 'dayGridMonth,dayGridWeek,dayGridDay'
            },
            titleFormat : function(date) {
                return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
            },
            //initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
            selectable : true, // 달력 일자 드래그 설정가능
            droppable : true,
            editable : true,
            locale: 'ko', // 한국어 설정
            //nowIndicator: true, // 현재 시간 마크
            dayCellContent: function(e) {
                e.dayNumberText = e.dayNumberText.replace('일', '');
            },

            events : [
                <%List<Course> courseList = (List<Course>) request.getAttribute("courses");%>
                <%if (courseList != null) {%>
                <%for (Course course : courseList) {%>
                {
                    id : '<%=course.getCno()%>',
                    title : '<%=course.getCourse_name()%>',
                    start : '<%=course.getStart_date()%>',
                    color : colors['<%=course.getCno()%>' % 12],
                    //custom fields
                    startDate : '<%=course.getStart_date()%>',
                    endDate : '<%=course.getEnd_date()%>',
                    teacherName : '<%=course.getTeacher_name()%>',
                    price : '<%=course.getPrice()%>',
                },
                <%}
            }%>
            ],

            eventClick: function(info) {
                var cno = info.event.id;
                var modal = document.getElementById('myModal');
                modal.classList.add('is-active');

                $("#c_name").html(info.event.title);
                $("#c_date").html(info.event.extendedProps.startDate + '~' + info.event.extendedProps.endDate);
                $("#c_tea").html(info.event.extendedProps.teacherName);
                $("#c_cost").html(parseInt(info.event.extendedProps.price).toLocaleString() + '원');
                console.log(info.event.extendedProps.price.toLocaleString());

                document.getElementById('enrolment').setAttribute('href', '${path1 }/course/getCourse?cno='+cno);

                // 모달 닫기 버튼 클릭 시 이벤트 처리
                modal.querySelector('.delete').addEventListener('click', function () {
                    modal.classList.remove('is-active');
                });
            }
        });
        calendar.render();
    });
</script>
</body>
</html>