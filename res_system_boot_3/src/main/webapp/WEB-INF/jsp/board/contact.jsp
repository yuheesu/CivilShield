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
<!-- <script src="http://code.jquery.com/jquery-latest.min.js"></script> -->
<script async defer
 src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAOYw2nJ-B_XDsAiM7J9n49etNPaWwBvAw&callback=angular.noop"></script>
<style>
#map {
  width: 500px;
  height: 500px;
  background-color: grey;
}
.img-wrapper {
  display: block;
  margin-left: auto;
  margin-right: auto;
  text-align: center;
  width: 50%;
}
</style>
   <!-- contact -->
   <div class="contact">
      <div class="container">
         <div class="w3ls-title">
         </div>
         <!-- map -->
         <div class="img-wrapper">
            <h3 class="agileits-title w3title1">Contact</h3>
            <img id="map" src="http://maps.google.com/maps/api/staticmap?center=37.578634,126.986385&markers=37.578634,126.986385&zoom=14&size=500x500">
         </div>
         </div>
         <!-- <img src="http://maps.google.com/maps/api/staticmap?center=37.578634,126.986385&markers=37.578634,126.986385&zoom=14&size=400x400&sensor=false"> -->
         <!-- //map -->
         <div class="map-pos">
            <div class="col-md-4 address-row">
               <div class="col-xs-2 address-left">
                  <span class="glyphicon glyphicon-home" aria-hidden="true"></span>
               </div>
               <div class="col-xs-10 address-right">
                  <h5>Visit Us</h5>
                  <p>서울시 종로구 계동길 31 보헌빌딩 1F & 2F (우)03059</p>
               </div>
               <div class="clearfix"></div>
            </div>
            <div class="col-md-4 address-row w3-agileits">
               <div class="col-xs-2 address-left">
                  <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
               </div>
               <div class="col-xs-10 address-right">
                  <h5>Mail Us</h5>
                  <p>
                     <a href="mailto:it1070@gsitm.com"> it1070@gsitm.com</a>
                  </p>
               </div>
               <div class="clearfix"></div>
            </div>
            <div class="col-md-4 address-row">
               <div class="col-xs-2 address-left">
                  <span class="glyphicon glyphicon-phone" aria-hidden="true"></span>
               </div>
               <div class="col-xs-10 address-right">
                  <h5>Call Us</h5>
                  <p>+82 02 2189 6700</p>
               </div>
               <div class="clearfix"></div>
            </div>
            <div class="clearfix"></div>
         </div>
         

         <form action="/board/sendEmail.do" method="post">
            <div class="col-sm-6 contact-left">
               <input type="text" name="title" placeholder="Email Title"
                  required=""> <input type="email" name="email"
                  placeholder="Email" required=""> <input type="text"
                  name="name" placeholder="Your Name" required="">
            </div>
            <input type="hidden" name="${_csrf.parameterName}"
               value="${_csrf.token}" />
            <div class="col-sm-6 contact-right">
               <textarea name="message" placeholder="Message" required=""></textarea>
               <input type="submit" value="문의메일보내기">
            </div>
            <div class="clearfix"></div>
         </form>
         <br /> <br />
      </div>