<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<style>
body {
  padding-top: 40px;
  padding-bottom: 40px;
  background-color: #eee;
}
</style>
<div class="container">

  <form class="signup-form form-signin" action="/login" method="POST">
  	<input type ="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <h2 class="form-signin-heading">회원가입</h2>
    <label for="empid" class="sr-only">Email address</label>
    <input type="text" id="empid" class="form-control validate" name="empid" placeholder="User Id" required autofocus>
    <label for="password" class="sr-only">Password</label>
    <input type="password" id="password" class="form-control validate" name="password" placeholder="Password" required>
    <label for="empnm" class="sr-only">사용자 이름</label>
    <input type="text" id="empnm" class="form-control validate" name="empnm" placeholder="이름" required>
    <label for="phonenumber" class="sr-only">휴대전화</label>
    <input type="text" id="phonenumber" class="form-control validate" name="phonenumber" placeholder="휴대전화" required>
	<br>
    <button class="btn btn-lg btn-info btn-block signup-btn" type="submit">회원가입 <span class="glyphicon glyphicon-ok"></span></button>
    <button class="btn btn-lg btn-warning btn-block" type="button" onclick="fn_goUrl('/login/login.do')">가입취소 <span class="glyphicon glyphicon-remove"></span></button>
  </form>

</div> <!-- /container -->