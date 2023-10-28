<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path1" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
    <title>회원 정보 보기</title>

    <jsp:include page="../include/head.jsp" />
    <%--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>--%>
    <%--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />--%>

    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <%--<link rel="stylesheet" href="resources/css/normalize.css" />--%>
    <%--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/foundation/6.4.3/css/foundation.min.css">--%>
    <%--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/motion-ui/1.2.3/motion-ui.min.css">--%>
    <%--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/foundation/6.4.3/css/foundation-prototype.min.css">--%>
    <%--<link href='https://cdnjs.cloudflare.com/ajax/libs/foundicons/3.0.0/foundation-icons.css' rel='stylesheet' type='text/css'>--%>
    <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/foundation/6.4.3/js/foundation.min.js"></script>--%>
    <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/motion-ui/1.2.3/motion-ui.min.js"></script>--%>

    <style>
        .table th {
            white-space: nowrap;
            vertical-align: middle;
        }
    </style>
</head>
<body>

<jsp:include page="../include/header.jsp"></jsp:include>

<div class="container">
    <div class="columns">
        <div class="column is-8 is-offset-2">
            <c:if test="${sid!='admin' }">
                <%--<h2 class="title">회원 정보 수정</h2>--%>
                <p class="has-text-black is-size-3 has-text-centered my-2">회원 정보 수정</p>
            </c:if>

            <form name="frm1" id="frm1" action="${path1 }/user/update.do" method="post" onsubmit="return updateCheck(this)">
                <table class="table is-centered is-fullwidth">
                    <tbody>
                    <tr class="border-top">
                        <th>아이디</th>
                        <td>
                            <input type="text" name="id" id="id" value="${user.id }" class="input" style="border: none; outline: none; }" readonly required>
                        </td>
                    </tr>
                    <tr>
                        <th>포인트</th>
                        <td>
                            <input type="text" name="pt1" id="pt1" value="${user.pt } " class="input" style="width: 13.6rem;" readonly required >
                            <input type="hidden" name="pt" id="pt" class="input" value="${user.pt }" >
                        </td>
                    </tr>
                    <tr>
                        <th>비밀번호</th>
                        <td>
                            <input type="password" name="pw" id="pw" value="${user.pw }" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" class="input" required>
                            <!-- pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,12}$"  -->
                        </td>
                    </tr>
                    <tr>
                        <th>비밀번호 확인</th>
                        <td>
                            <input type="password" name="pw2" id="pw2" value="${user.pw }" class="input" required>
                            <!-- pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,12}$"  -->
                            <p id="msg" style="padding-left:0.5rem; font-size: 0.8em;">*비밀번호:영대/소문자, 특수문자, 숫자 조합 8~12글자</p>
                        </td>
                    </tr>
                    <tr>
                        <th>이름</th>
                        <td>
                            <input type="text" name="name" id="name" value="${user.name }" class="input" style="width: 13.6rem;" required>
                        </td>
                    </tr>
                    <tr>
                        <th>생년월일</th>
                        <td>
                            <!-- <input type="date" name="birth" id="birth" data-placeholder="생년월일" required> -->
                            <fmt:parseDate value="${user.birth }" var="birth" pattern="yyyy-MM-dd" />
                            <span style="display:none"><fmt:formatDate var="br" value="${birth }" pattern="yyyy-MM-dd" /></span>
                            <input type="date" name="birth" id="birth" value="${br }" class="input" style="width: 13.6rem;" readonly>
                        </td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td>
                            <input type="email" name="email" id="email" value="${user.email }" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" class="input" required>
                        </td>
                    </tr>
                    <tr>
                        <th>전화번호</th>
                        <td>
                            <input type="tel" name="tel" id="tel" value="${user.tel }" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" class="input" required>
                        </td>
                    </tr>
                    <tr class="border-bottom">
                        <th>주소</th>
                        <td>
                            <div class="mb-1">
                                <input type="text" name="postcode" id="postcode"  value="${user.postcode }" class="input" required style="width: 13.6rem;">
                                <input type="button" id="isAddrBtn" class="button" value="우편번호 검색" class="input" onclick="findAddr()" style="width: 10rem;">
                            </div>
                            <div class="mb-1">
                                <input type="text" name="addr1" id="addr1" value="${user.addr1 }" class="input" maxlength="150" required><br>
                            </div>
                            <input type="text" name="addr2" id="addr2" value="${user.addr2 }" class="input" maxlength="90" required><br>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <div class="buttons is-centered is-spaced my-5">
                    <input type="submit" class="button is-info" value="정보 수정">
                    <c:if test="${sid!='admin' }">
                        <a href="${path1 }/user/userDelete.do?id=${sid }" class="button is-danger">회원 탈퇴</a>
                    </c:if>
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
        <div class="column is-2"></div>
    </div>
</div>

<jsp:include page="../include/footer.jsp" />

</body>
</html>
