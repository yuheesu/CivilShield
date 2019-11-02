<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->

<%--
subject    :
author     : 유희수
date       : 2018.06.07
description : 

  [이름]   [수정일]     [내용]
  ----------------------------------------------------------

--%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/dist/css/simpleBanner.css">
<style type="text/css">
/* override styles */
.banner01 {
	width: 700px;
	height: 400px;
	margin: 10px;
}

.banner01 ul li a {
	display: block;
	width: 300px;
	height: 200px;
	text-shadow: 0 0 2px #666;
	text-decoration: none;
	color: #FFF;
	font-size: 24px;
	font-weight: bold;
	letter-spacing: -1px;
	text-align: center;
	line-height: 200px;
}
.banner01, .banner01 ul li a {
	width: 700px;
}
#banner {
	margin: 0 auto;
}
#checkImg {
	width: 15px;
	height: 15px;
}
#temp {
	height: 60px;
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
	border-left: 1px solid #ccc;
	border-top: 1px solid #ccc;
	border-bottom: 3px solid #036;
	border-right: 1px solid #ccc;
}

table.type tbody th {
	width: 700px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-left: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	border-right: 1px solid #ccc;
	background: #f3f6f7;
}

table.type td {
	width: 350px;
	padding: 10px;
	vertical-align: top;
	border-left: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	border-right: 1px solid #ccc;
}

.navbar-left {
	float: right !important;
}

/* ---------------------------------------------------
    MEDIAQUERIES
----------------------------------------------------- */
@media ( max-width : 768px) {
	.navbar-left {
		float: right !important;
	}
}
</style>
	<div class="portfolio">
		<div class="container">
			<h1 style="color: #666666">회의실/교육실 상세보기</h1>
			<hr style="border: solid 0.5px #EBEBE3; margin-bottom: 15px;">
			<form class="form-inline">
				<div id="selRoom" style="margin-top: 15px; margin-bottom: 15px;">
					<select class="form-control">
						<option value="1000">회의실</option>
						<option value="2000">교육실</option>
					</select> <select class="form-control">
						<c:forEach var="bldg" items="${bldgList}">
							<option>${bldg.bldgNm}</option>
						</c:forEach>
					</select> <select class="form-control">
						<c:forEach var="room" items="${roomList}">
							<option>${room.roomNm}</option>
						</c:forEach>
					</select>
				</div>
			</form>
			<form class="form-inline">
				<div>
					<label><c:choose>
							<c:when test="${room.roomType==1000}">회의실
						</c:when>
							<c:when test="${room.roomType==2000}">교육실
						</c:when>
						</c:choose></label> <label>/</label><label>${room.bldgVO.bldgNm}</label>
				</div>
			</form>
			<label style="font-size: 30px; color: #99CC00; margin: 10px;">${room.roomNm}</label>
			<hr />
			<div class="simple_banner_wrap banner01" id="banner"
				style="margin-top: 15px">
				<ul>
					<c:forEach var="roomImg" items="${roomImgList}">
						<li><img
							src="/viewroomImage.do?roomImgNo=${roomImg.roomImgNo}" width=100%>
						</li>
					</c:forEach>
				</ul>
			</div>
			<hr />
			<center>
					<a href="/res/reservation.do">
					<button class="form-control" style="width: 100px; color: #fff; margin-top: 30px; background-color: #99CC00; margin-bottom: 50px;">예약하기</button></a>
			</center>

			<div>
				<span style="font-size: 20px; margin: 10px; font-weight: bold;"><img
					src="/dist/images/checked2.png" style="width: 30px; margin: 8px;">
					소개</span> <br>
			</div>
			<div id="introContent" style="margin-left: 30px; font-size: 15px;">
				<p>${room.roomExplain}</p>
			</div>
			<div id="temp"></div>
			<div>
				<span style="font-size: 20px; margin: 10px; font-weight: bold;"><img
					src="/dist/images/checked2.png" style="width: 30px; margin: 8px;">
					시설 정보</span><br>
			</div>
			<div id="introTable">
				<table class="type" style="margin: 30px;"center";">
					<thead>
						<tr>
							<th>시설종류</th>
							<th>건물이름</th>
							<th>회의실/교육실 명</th>
							<th>면적</th>
							<th>수용인원</th>
							<th>임대료(30분당)</th>
							<th>네트워크 유무</th>
						</tr>
					</thead>
					<tbody>

						<td><c:choose>
								<c:when test="${room.roomType==1}">회의실
						</c:when>
								<c:when test="${room.roomType==2}">교육실
						</c:when>
							</c:choose></td>
						<td>${room.bldgVO.bldgNm}</td>
						<td>${room.roomNm}</td>
						<td>${room.roomArea}m</td>
						<td>${room.roomCapacity}명</td>
						<td>${room.costPerHour}원</td>
						<td>${room.useNetworkYn}</td>

					</tbody>
				</table>
			</div>
			<div id="temp"></div>
			<div>
				<span style="font-size: 20px; margin: 10px; font-weight: bold;"><img
					src="/dist/images/checked2.png" style="width: 30px; margin: 8px;">
					기자재 안내</span><br>
			</div>
			<div id="introEquipment" style="margin: 40px">
				<img src="/dist/images/triangle.png" class="name" id="checkImg">
				<c:forEach var="itemList" items="${itemList}">
					<label style="font-size: 20px;">${itemList.itemNm}</label>
				</c:forEach>
			</div>
		</div>
	</div>
	<script src="/dist/js/controls.js"></script>
	<script type="text/javascript" src="/dist/js/simpleBanner.js"></script>