<%--
subject    : header
author     : 주형진
date       : 2018. 6. 8. 
description : 
 
  [이름]   [수정일]     [내용]
  ----------------------------------------------------------
  주형진 2018. 6. 8.    header 최초 편집
  차주현 2018. 6. 13.  tiles 형식에 맞게 수정
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<style>
.top-util {
    float: right;
}
#top-ul{
    list-style:none;
    margin:0;
    padding:0;
}
#top-li{
    margin: 0 0 0 0;
    padding: 0 0 0 0;
    border : 0;
    float: left;
    color:#fff;
}
#top-li a{
color: #fff;
}
	.navbar-left {
    float: right!important;
	}
</style>
<div class="header-w3layoutstop">
  <div class="container">  
    <div class="hdr-w3left navbar-left">
    <div class="top-util">
    	<ul id="top-ul">
    		<li id="top-li">
    			<sec:authentication property="name" />님          &nbsp
    		</li>&nbsp
    		<li id="top-li">
    			<a href="/logout">로그아웃           </a>&nbsp
    		</li>&nbsp
    		<li id="top-li">
    			<a href="http://www.gsitm.com">gsitm홈페이지</a>&nbsp
    		</li>&nbsp
    	</ul>
    </div>
    </div>
  </div>
</div>
<style>
hr {
  margin-top: 0px !important;
  margin-bottom: 0px !important;
}
</style>
<!-- navigation -->
<div class="nav-links">
  <nav class="navbar navbar-inverse">
    <div class="container">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="/common/dashboard.do" style=""><img src="/dist/images/GSITM.png" style="width: 100px;"></a>
      </div>
      <div class="collapse navbar-collapse" id="myNavbar">
        <ul class="nav navbar-nav link-effect">
          <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><span data-hover="Short Codes">예약</span> <b class="caret"></b></a>
              <ul class="dropdown-menu agile_short_dropdown">
                <li><a href="/res/info.do">예약 안내</a></li>
                <li><a href="/res/reservation.do">예약</a></li>
                <li><a href="/res/condition.do">내 예약 현황</a></li>
                <li><a href="/res/conditionTotal.do">전체 예약 현황</a></li>
                <li><a href="/room/roomCategory.do">회의실/교육실 정보</a></li>
              </ul>
          </li>
          <!-- <li><a href="services.jsp">통계</a></li> -->
          <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><span data-hover="Short Codes">마이 페이지</span> <b class="caret"></b></a>
              <ul class="dropdown-menu agile_short_dropdown">
                <li><a href="/board/mypage.do">내 정보</a></li>
                <sec:authorize access="hasAnyRole('DEPTHEAD', 'ADMIN')">
                <li><a href="/res/resApproval.do">승인 요청 현황</a></li>
                </sec:authorize>
                <li><a href="/dept/deptBudget.do">부서별 예산 내역</a></li>
              </ul>
          </li>
          <li class="dropdown"> <!-- 고객지원 메뉴 -->
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><span data-hover="Short Codes">고객지원</span> <b class="caret"></b></a>
              <ul class="dropdown-menu agile_short_dropdown">
                <li><a href="/board/board.do">공지사항</a></li>  <!-- 공지사항으로 이동 -->
                <li><a href="/board/faq.do">FAQ</a></li>  <!-- FAQ로 이동 -->
                <li><a href="/board/contact.do">문의하기</a></li> <!-- 문의하기로 이동 -->
              </ul>
          </li>
          <sec:authorize access="hasRole('ADMIN')">
          <li class="dropdown"> <!-- 고객지원 메뉴 -->
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><span data-hover="Short Codes">관리자 메뉴</span> <b class="caret"></b></a>
              <ul class="dropdown-menu agile_short_dropdown">
                <li><a href="/admin/management.do">근무지/시설 관리</a></li>
                <li><a href="/res/resHistory.do">예약 히스토리</a></li>
              </ul>
          </li>
          </sec:authorize>
        </ul>
      </div>
    </div>
    <hr style="border: solid 2px #009999; margin-top: 0px;">
  </nav>
</div>