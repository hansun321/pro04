<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path1" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <meta name="Description" content="우리동네 1등 스마트 학원·공부방, 스마트해법">
  <meta name="keywords" content="천재교육, 천재교과서, 스마트해법수학, 스마트해법영어, e해법수학, 해법영어교실, 수학학원, 영어학원, 수학공부방, 영어공부방, 프랜차이즈, 학원, 공부방, 수학문제은행, 학습지, 과외, 해법에듀, 해법, 해법수학, 초등공부, 초등수학, 초등영어, 중등공부, 중등수학, 중드영어, 초등학원, 중등학원, 내신">
  <title>회원가입</title>
  <%--<jsp:include page="../include/head.jsp" />--%>

  <%--<script src="https://code.jquery.com/jquery-latest.js"></script>--%>
  <link rel="stylesheet" href="resources/css/normalize.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/foundation/6.4.3/css/foundation.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/motion-ui/1.2.3/motion-ui.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/foundation/6.4.3/css/foundation-prototype.min.css">
  <link href='https://cdnjs.cloudflare.com/ajax/libs/foundicons/3.0.0/foundation-icons.css' rel='stylesheet' type='text/css'>
  <script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
  <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/foundation/6.4.3/js/foundation.min.js"></script>--%>
  <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/motion-ui/1.2.3/motion-ui.min.js"></script>--%>
  <style>
    * { list-style: none; }

    td { height: 40px; margin: 0px;}
    input { width:400px; float:left; margin-bottom: 0px; }
    .logo { margin-top : 1rem; text-align: center; }

    #content { margin: 0px auto; }
    .container1 { width: 500px; margin: 10px auto; padding: 24px; height:auto; overflow-y:auto; }
    #frm1 { width : 400px; margin: 0px auto; }
    table tbody td { padding: 0px; }

    .content table td, .content table th { border: none; padding: 0px; }

    input[type="date"]:not(.has-value):before{ color: #cacaca; content: attr(placeholder); }

    [type=color], [type=date], [type=datetime-local], [type=datetime], [type=email], [type=month], [type=number], [type=password], [type=search], [type=tel], [type=text], [type=time], [type=url], [type=week], textarea {
      margin-bottom: 0.5rem;
    }

    table tbody tr:nth-child(even) {
      background: #fefefe;;
    }
  </style>
</head>
<body>

<%--<jsp:include page="../include/header.jsp"></jsp:include>--%>

<div class="content container" id="content">
  <div class="logo">
    <a href="${path1 }/"><img src="${path1 }/resources/img/haebeop.png" alt="스마트해법 로고" /></a>
  </div>

  <div class="container1">
    <form name="frm1" id="frm1" action="${path1 }/user/insert" method="post" onsubmit="return joinCheck(this)">
      <table id="table1">
        <tbody>
        <tr>
          <td>
            <input type="text" name="id" id="id" placeholder="아이디" pattern="^[a-z0-9]{5,12}" maxlength="12" required>
            <input type="button" id="idCkBtn" class="button" value="아이디 중복 체크" onclick="idCheck()" style="border-radius: 5px;">
            <input type="hidden" name="idck" id="idck" value="no"/>
            <c:if test="${empty qid }">
              <p id="msg" style="padding-left:0.5rem">아직 아이디 중복 체크를 하지 않으셨습니다.</p>
            </c:if>
            <c:if test="${not empty qid }">
              <p id="msg" style="padding-left:0.5rem">아이디 중복 체크후 수정하였습니다.</p>
            </c:if>
            <p id="msg" style="padding-left:0.5rem; font-size: 0.8em;">*아이디:영소문자,숫자 조합 5~12글자<br>*비밀번호:영대/소문자, 특수문자, 숫자 조합 8~12글자</p>
          </td>
        </tr>
        <tr>
          <td>
            <input type="password" name="pw" id="pw" placeholder="비밀번호" maxlength="12" pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,12}$" required>
          </td>
        </tr>
        <tr>
          <td>
            <input type="password" name="pw2" id="pw2" placeholder="비밀번호 확인" maxlength="12" pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,12}$" required>
          </td>
        </tr>
        <tr>
          <td>
            <input type="text" name="name" id="name" placeholder="이름" maxlength="40" required>
          </td>
        </tr>
        <tr>
          <td>
            <!-- <input type="date" name="birth" id="birth" data-placeholder="생년월일" required> -->
            <input type="date" name="birth" id="birth" placeholder="생년월일 : " required onchange="this.className=(this.value!=''?'has-value':'')">
          </td>
        </tr>
        <tr>
          <td>
            <input type="email" name="email" id="email" placeholder="이메일" pattern="^\w+((\.\w+)?)+@\w+.?\w+\.\w+$" maxlength="80" required>
          </td>
        </tr>
        <tr>
          <td>
            <input type="tel" name="tel" id="tel" placeholder="전화번호" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}" maxlength="19" required>
          </td>
        </tr>
        <tr>
          <td>
            <input type="text" name="postcode" id="postcode" placeholder="우편번호" maxlength="9" required style="width: 200px;">
            <input type="button" id="isAddrBtn" class="button" value="주소 찾기" onclick="findAddr()" style="width: 200px; border-radius: 5px;">
            <input type="text" name="addr1" id="addr1" placeholder="기본주소" maxlength="150" required><br><br>
            <input type="text" name="addr2" id="addr2" placeholder="상세주소" maxlength="90" required><br><br>
            <input type="hidden" name="addrck" id="addrck" value="no"/>
          </td>
        </tr>
        <tr>
          <td colspan="2">
            <input type="submit" class="submit success button" value="회원 가입" style="background-color: #00A2FF; color: white; border-radius: 5px;" >
            <input type="reset" class="reset button" value="다시 작성" style="background-color: #565d64; border-radius: 5px;">
          </td>
        </tr>
        </tbody>
      </table>
    </form>
    <script>
      $(document).ready(function(){
        $("#id").keyup(function(){
          $("#idck").val("no");
          if($(this).val()!=""){
            $("#msg").html("<strong>아이디 입력중입니다.</strong>");
          } else {
            $("#msg").html("아직 아이디 중복 체크를 하지 않으셨습니다.");
          }
        });
      });
    </script>
    <script>
      function idCheck(){
        if($("#id").val()==""){
          alert("아이디를 입력하지 않으셨습니다.");
          $("#id").focus();
          return;
        }
        var params = {	id : $("#id").val()	} //전송되어질 데이터를 객체로 묶음
        $.ajax({
          url:"${path1 }/user/idCheck",	//아이디가 전송되어질 곳
          type:"post",		//전송방식
          dataType:"json",	//데이터 반환 방식
          data:params,		//전송방식이 post인 경우 객체로 묶어서 전송
          success:function(result){
            console.log(result.result);
            var idChk = result.result;	//true 또는 false를 받음
            if(idChk==false){	//사용할 수 없는 아이디
              $("#idck").val("no");
              $("#msg").html("<strong style='color:red'>기존에 사용되고 있는 아이디 입니다. 다시 입력하시기 바랍니다.</strong>");
              $("#id").focus();
            } else if(idChk==true){	//사용 가능한 아이디
              $("#idck").val("yes");
              $("#msg").html("<strong style='color:blue'>사용가능한 아이디 입니다.</strong>");
            } else if(idck==""){
              $("#msg").html("<strong>아이디가 확인되지 않았습니다. 다시 시도해주시기 바랍니다.</strong>");
            }
          }
        });
      }
      function joinCheck(f){
        if(f.pw.value!=f.pw2.value){
          alert("비밀번호와 비밀번호 확인이 서로 다릅니다.");
          f.pw.focus();
          return false;
        }
        if(f.idck.value!="yes"){
          alert("아이디 중복 체크를 하지 않으셨습니다.");
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
            document.getElementById("addr2").focus();
          }
        }).open();
      }
      $("")
    </script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  </div>
</div>

<%--<jsp:include page="../include/footer.jsp"></jsp:include>--%>

</body>
</html>