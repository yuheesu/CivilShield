<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<style>
body {
  padding-top: 40px;
  padding-bottom: 40px;
  background-color: #eee;
}
.list-group {

}
</style>
<script>
  function loginUser() {
    $('#id').val('it1076');
    $('#password').val('1111');
    $('#loginFrm').submit();
  }
  function loginDeptHead() {
    $('#id').val('it0167');
    $('#password').val('1111');
    $('#loginFrm').submit();
  }
  function loginAdmin() {
    $('#id').val('ita001');
    $('#password').val('1111');
    $('#loginFrm').submit();
  }
</script>
<div class="container">
    <div class="btn-group" role="group" aria-label="...">
        <button type="button" class="btn btn-default" onclick="loginUser()">사용자 로그인</button>
        <button type="button" class="btn btn-default" onclick="loginDeptHead()">상위결재자 로그인</button>
        <button type="button" class="btn btn-default" onclick="loginAdmin()">담당자 로그인</button>
    </div>
    <form id="loginFrm" class="login-form form-signin" method="POST">
      <input type ="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
      <h2 class="form-signin-heading">로그인</h2>
      <label for="id" class="sr-only">Email address</label>
      <input type="id" id="id" class="form-control validate" name="username" placeholder="User Id" required autofocus>
      <label for="password" class="sr-only">Password</label>
      <input type="password" id="password" class="form-control validate" name="password" placeholder="Password" required>
    <br>
      <button class="btn btn-lg btn-primary btn-block login-btn" type="submit">로그인</button>
    </form>
</div> <!-- /container -->