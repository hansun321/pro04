<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path1" value="${pageContext.servletContext.contextPath }" />
<!DOCTYPE html>
<html>
<head>
  <title>메인</title>
  <jsp:include page="../include/head.jsp" />

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
  <!-- Bulma Version 0.9.0-->
  <link rel="stylesheet" href="https://unpkg.com/bulma@0.9.4/css/bulma.min.css" />
  <link rel="stylesheet" type="text/css" href="${path1 }/resources/css/admin.css">

  <style>
    .column.is-6 { width:100%; }
    table td:not([align]), table th:not([align]) { text-align: center; }
    .input, .textarea { width: 100%; height: 30px;  }
    .card-header { font-size: 1.2em; font-family: "Nanum Gothic Coding"; }

    .from_wrap { width: 60%; margin: 0 auto; }

    .label:not(:last-child) { font-size: 0.8em; margin-bottom: 0px; }

    .field.is-grouped { margin-bottom: 30px; }

    .hero.welcome .title, .hero.welcome .subtitle { font-family: "Nanum Gothic Coding";  }

    .button, .file-cta, .file-name, .input, .pagination-ellipsis, .pagination-link, .pagination-next, .pagination-previous, .select select, .textarea { vertical-align: middle; }
  </style>
</head>
<body>
<jsp:include page="../include/header.jsp" />
<div class="container">
  <div class="columns">
    <div class="column is-3 ">
      <%-- 관리자 네비게이션 바 --%>
      <jsp:include page="../include/asideBar.jsp" />
    </div>
    <div class="column is-9">
      <section class="hero is-info welcome is-small">
        <div class="hero-body">
          <div class="container">
            <h1 class="title">
              관리자 페이지
            </h1>
            <h2 class="subtitle">

            </h2>
          </div>
        </div>
      </section>
      <div class="columns">
        <div class="column is-6">
          <header class="card-header" style="margin-bottom: 20px; margin-top: 20px; ">
            <strong style="color:#00A2FF; "> ${user.name} &nbsp; </strong> 회원 정보 수정
          </header>
          <div class="card events-card">
            <div class="from_wrap">
              <form name="frm1" id="frm1" action="${path1 }/admin/userUpdate.do" method="post" onsubmit="return updateCheck(this)">

                <div class="field">
                  <label class="label">아이디</label>
                  <div class="control">
                    <input type="text" class="input" name="id" id="id" value="${user.id }" style="cursor:not-allowed;" readonly required>
                  </div>
                </div>

                <div class="field">
                  <label class="label">비밀번호</label>
                  <div class="control">
                    <input type="password" class="input" name="pw" id="pw" value="${user.pw }" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required>
                    <!-- pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,12}$"  -->
                  </div>
                </div>

                <div class="field">
                  <label class="label">비밀번호 확인</label>
                  <div class="control">
                    <input type="password" class="input" name="pw2" id="pw2" value="${user.pw }" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required>
                    <!-- pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,12}$"  -->
                    <p id="msg" style="padding-left:0.5rem; font-size: 0.7em;">*비밀번호:영대/소문자, 특수문자, 숫자 조합 8~12글자</p>
                  </div>
                </div>

                <div class="field">
                  <label class="label">이름</label>
                  <div class="control">
                    <input type="text" class="input" name="name" id="name" value="${user.name }" required>
                  </div>
                </div>

                <div class="field">
                  <label class="label">생년월일</label>
                  <div class="control">
                    <!-- <input type="date" name="birth" id="birth" data-placeholder="생년월일" required> -->
                    <fmt:parseDate value="${user.birth }" var="birth" pattern="yyyy-MM-dd" />
                    <span style="display:none"><fmt:formatDate var="br" value="${birth }" pattern="yyyy-MM-dd" /></span>
                    <input type="date" class="input" name="birth" id="birth" value="${br }" readonly style="cursor:not-allowed;">
                  </div>
                </div>

                <div class="field">
                  <label class="label">이메일</label>
                  <div class="control">
                    <input type="email" class="input" name="email" id="email" value="${user.email }" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" required>
                  </div>
                </div>

                <div class="field">
                  <label class="label">전화번호</label>
                  <div class="control">
                    <input type="tel" class="input" name="tel" id="tel" value="${user.tel }" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" required>
                  </div>
                </div>

                <div class="field">
                  <label class="label">우편번호</label>
                  <div class="control">
                    <input type="tel" class="input" name="postcode" id="postcode"  value="${user.postcode }" required style="width: 200px;">
                    <button type="button" id="isAddrBtn" class="button is-link" onclick="findAddr()" style="scale: 77%;" >주소 찾기</button>
                  </div>
                </div>

                <div class="field">
                  <label class="label">주소</label>
                  <div class="control">
                    <input type="text" class="input" name="addr1" id="addr1" value="${user.addr1 }" maxlength="150" required> <br>
                    <input type="text" class="input" name="addr2" id="addr2" value="${user.addr2 }" maxlength="90" required>
                  </div>
                </div>

                <div class="field is-grouped">
                  <div class="control">
                    <button class="button is-link" type="submit" style="scale: 77%;">수정완료</button>
                  </div>
                  <div class="control">
                    <button class="button is-success" type="reset" style="scale: 77%;">취소</button>
                  </div>
                </div>
              </form>
              <script>
                function updateCheck(f){
                  if(f.userpw.value!=f.userpw2.value){
                    alert("비밀번호와 비밀번호 확인이 서로 다릅니다.");
                    return false;
                  }
                }
              </script>
              <script>
                function findAddr() {
                  new daum.Postcode({
                    oncomplete: function(data) {
                      console.log(data);
                      var roadAddr = data.roadAddress;
                      var jibunAddr = data.jibunAddress;
                      document.getElementById("postcode").value = data.zonecode;
                      if(roadAddr !== '') {
                        document.getElementById("addr1").value = roadAddr;
                      } else if(jibunAddr !== ''){
                        document.getElementById("addr1").value = jibunAddr;
                      }
                    }
                  }).open();
                }
              </script>
              <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script async type="text/javascript" src="${path1 }/resources/js/bulma.js"></script>
</div>
<jsp:include page="../include/footer.jsp" />
</body>
</html>