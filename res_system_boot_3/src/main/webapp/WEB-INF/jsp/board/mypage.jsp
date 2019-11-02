<%--
subject    : 문의하기 페이지(사용자)
author     : 주형진
date       : 2018. 6. 8. 
description : 공지사항 -> 문의하기 페이지(사횽자)
 
  [이름]   [수정일]     [내용]
  ----------------------------------------------------------
  주형진   2018-07-08      문의하기 페이지 최초 편집
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
   href="/dist/css/bootstrap.min.css">
<style>
.form-control select option{
	background-color: #fff !important;
}
table.type {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    border-left: 1px solid #ccc;
    border-top: 1px solid #ccc;
    border-right: 1px solid #ccc;

}
table.type thead th {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #369;
    border-bottom: 3px solid #036;
    border-right: 1px solid #ccc;
}
table.type tbody th {
    width: 700px;
    height: 50px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    border-right: 1px solid #ccc;
    background: #f3f6f7;
}
table.type td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    border-right: 1px solid #ccc;
}
</style>
<div class="container">
  <br>
  <br>
  <!-- 테이블 여기안에다 넣어야 해  -->
  <h1 style="color: #666666">계정정보</h1>
  <hr style="border: solid 0.5px #EBEBE3">
  <div style="margin-top: 20px">
    <center>
      <table class="type" style="width: 700px;">
        <thead>
          <th scope="cols" width="20%">구분</th>
          <th scope="cols" width="*">내용</th>
        </thead>
        <tbody>
          <tr>
            <th>아이디</th>
            <td>${empVO.empId}</td>
          </tr>
          <tr>
            <th>이 름</th>
            <td>${empVO.empNm}</td>
          </tr>
          <tr>
            <th>핸드폰 번호</th>
            <td>${empVO.personalPhone}</td>
          </tr>
          <tr>
            <th>소속 부서</th>
            <td>${empVO.deptVO.deptNm}</td>
          </tr>
          <tr>
            <th><label>이메일</label></th>
            <td>
              <div class="form-group">
                <span>
                  <c:choose>
                    <c:when test="${!empty empVO.emailAddr}">
                      ${empVO.emailAddr}
                    </c:when>
                    <c:otherwise>
                        <input class="form-control" type="email" id="sendEmail" name="email" style="width:300px; margin:6px;">
                        <button style="width:100px" class="form-control" id="sendRandomKey" name="">이메일 인증</button>
                    </c:otherwise>
                  </c:choose>
                </span>
                <br>
                <c:choose>
                    <c:when test="${!empty empVO.emailAddr}">
                    </c:when>
                    <c:otherwise>
                      <div id="addedTimer" style="display: none;">
                          <span id="timer" style="background-color:yellow; color: red;">타이머</span>
                          <br>
                          <input class="form-control" style="width:200px; margin:6px;" type="text" name="authNum" id="authNumInput" placeholder="인증키입력란">
                          <div class="form-inline">
                            <button class="form-control" type="button" style="width: 100px" id="authEmailBtn">인증확인</button>&nbsp;
                          </div>
                      </div>
                    </c:otherwise>
                </c:choose>
              </div>
            </td>
          </tr>
        </tbody>
      </table>
    </center>
    <!-- 여기까지 본문 끝 -->
    <br>
    <br>
  </div>
</div>
<c:choose>
	<c:when test="${!empty empVO.emailAddr}">
    </c:when>
    <c:otherwise>
   <script type="text/javascript">
    var iSecond; //초단위로 환산
    var timerchecker = null;
    $(document).ready(function() {
      var email = document.getElementById("sendEmail").value;
      if(email == undefined || email.length == 0) {
        alert('메일을 인증받아야 서비스를 이용할 수 있습니다.');
      }
      $("#sendRandomKey").on('click', function() {
        $("#sendEmail").attr('disabled',true);
        $("#sendRandomKey").attr('disabled',true);
        $("#addedTimer").css("display","block");
        var email = document.getElementById("sendEmail").value;
        if(email == undefined || email.length == 0) {
        	alert('이메일을 입력해주세요.');
        	return;
        }
        // console.log("인증번호 발송 버튼 눌렀어, 이제 ajax로 " + email + "주소를 보내주면 된다.");
        $.ajax({
            type : 'get',
            url : '/email/authSend.do?email=' + email,
            //서버에서 반환되는 형식 지정
            dataType : 'json',
            success : function(data) {
              if(data.status == 200) {
                alert('메일이 전송되었습니다.');
                console.log("[ajax success]");
              }
            }
        });
        //타이머 세팅
        fncClearTime();
        initTimer(); 
      });
      $('#authEmailBtn').on('click', function() {
        var email = document.getElementById("sendEmail").value;
        var authKey = document.getElementById("authNumInput").value;
        $.ajax({
            url : '/email/checkAuthKey.do?email=' + email + '&authKey=' + authKey,
            dataType : 'json',
            success : function(data) {
              if(data.status == 200) {
                alert('인증성공');
                $("#addedTimer").css("display","none");
                $("#sendRandomKey").hide();
                document.getElementById('sendEmail').value='인증완료';
                $("#sendEmail").attr('disabled',true);
                $("#sendRandomKey").attr('disabled',true);
                clearTimeout(timerchecker);
                timerchecker = null;
              }
              else if(data.status == 401) {
                alert('인증실패: 키가 올바르지 않습니다.');
              }
              else if(data.status == 402) {
                alert('로그인되어있지 않습니다.');
              }
            },
            error : function(xhr, status, error) {
              if (xhr.status == 401) {
                  alert('인증실패: 키가 올바르지 않습니다.');
              } else {
                  alert('다른오류' + status)
              }
            }
        });
      });
    });
    function fncClearTime() {
      iSecond = 120;
    }
    function Lpad(str, len) {
      str = str + "";
      while (str.length < len) {
        str = "0" + str;
      }
      return str;
    }
    function initTimer() {
      var timer = document.getElementById("timer");
      rHour = parseInt(iSecond / 3600);
      rHour = rHour % 60;
      rMinute = parseInt(iSecond / 60);
      rMinute = rMinute % 60;
      rSecond = iSecond % 60;

      if (iSecond >= 0) {
        timer.innerHTML = "&nbsp;"+ Lpad(rMinute, 2) + "분 " + Lpad(rSecond, 2) + "초 ";
        iSecond--;
        timerchecker = setTimeout("initTimer()", 1000); // 1초 간격으로 체크
      } else {
        /* logoutUser(); */
        clearTimeout(timerchecker);
        timerchecker = null;
        alert("시간이 초과되었습니다. 다시 인증번호를 발급받으세요");
        $("#sendEmail").attr('disabled',false);
        $("#sendRandomKey").attr('disabled',false);
        $("#addedTimer").css("display","none");
      }
    }
   </script>
    </c:otherwise>
</c:choose>