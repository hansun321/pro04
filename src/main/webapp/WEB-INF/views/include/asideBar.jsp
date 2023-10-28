<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path1" value="${pageContext.servletContext.contextPath }" />

<aside class="menu is-hidden-mobile">
  <p class="menu-label">
    회원관리
  </p>
  <ul class="menu-list">
<%--    <li><a href="${path1 }/admin/" class="is-active">Dashboard</a></li>--%>
    <li><a href="${path1 }/admin/userList.do">회원목록 조회 및 변경</a></li>
    <%--          <li>--%>
    <%--            <a>수강 내역 관리</a>--%>
    <%--            <ul>--%>
    <%--              <li><a>내역 1</a></li>--%>
    <%--              <li><a>내역 2</a></li>--%>
    <%--              <li><a>내역 3</a></li>--%>
    <%--              <li><a>내역 4</a></li>--%>
    <%--            </ul>--%>
    <%--          </li>--%>
  </ul>
  <p class="menu-label">
    수강신청 관리
  </p>
  <ul class="menu-list">
      <li><a href="${path1 }/admin/enrollList">수강 신청 관리</a></li>
      <li><a href="${path1 }/admin/cancelList">철회 목록 관리</a></li>
      <li><a href="${path1 }/admin/courseList">강의 목록 관리</a></li>
  </ul>
  <p class="menu-label">
    시범 강의 관리
  </p>
  <ul class="menu-list">
      <li><a href="${path1 }/admin/video/list.do">시범 강의 관리</a></li>
      <li><a href="${path1 }/admin/teacherList">강사 관리</a></li>
  </ul>
  <p class="menu-label">
    커뮤니티 관리
  </p>
  <ul class="menu-list">
    <li><a href="${path1 }/admin/notice/list.do">공지사항 관리</a></li>

    <li><a href="${path1 }/admin/review/list.do">후기 관리</a></li>
  </ul>
  <p class="menu-label">
    자료실 관리
  </p>
  <ul class="menu-list">
    <li><a href="${path1 }/admin/fileList.do">자료실 관리</a></li>
  </ul>
</aside>