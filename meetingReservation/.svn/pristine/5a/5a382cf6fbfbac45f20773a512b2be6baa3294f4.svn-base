<%--
subject    : FAQ 페이지
author     : 주형진
date       : 2018. 6. 8. 
description : 고객지원 -> FAQ 페이지
 
  [이름]   [수정일]     [내용]
  ----------------------------------------------------------
  주형진 2018-06-08    FAQ 페이지 최초 편집
  성동원 2018-06-10	   1차 수정 -> CSS가 안먹히는 문제 발생 -> 데이터를 뿌려주는 작업은 실행된다.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="/dist/css/faqReset.css"> <!-- CSS reset -->
<link rel="stylesheet" href="/dist/css/faqStyle.css"> <!-- Resource style -->
<script src="/dist/js/faqModernizr.js"></script> <!-- Modernizr -->
<!-- 직접 넣는 라이브러리 -->
<script src="/dist/js/faq.jquery-2.1.1.js"></script>
<script src="/dist/js/faq.jquery.mobile.custom.min.js"></script>
<script src="/dist/js/faqMain.js"></script>
<section class="cd-faq">
  <div class="cd-faq-items">
    <ul id="basics" class="cd-faq-group">
      <c:forEach var="faq" items="${list}">
      <li>
        <a class="cd-faq-trigger" href="#0">${faq.subject}</a>
        <div class="cd-faq-content">
          <p>${faq.content}</p>
        </div> <!-- cd-faq-content -->
      </li>
</c:forEach>
</ul>
</div>