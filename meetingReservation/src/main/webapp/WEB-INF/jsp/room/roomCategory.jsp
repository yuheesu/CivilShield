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

<!DOCTYPE html>
<html lang="en">
<head>
<title>Prefabrication a Real Estate Category Flat Bootstrap
	responsive Website Template | Projects :: w3layouts</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Prefabrication Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript">
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 

</script>
<!-- css -->
<!-- <link href="/dist/css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<link rel="stylesheet" href="/dist/css/style.css" type="text/css"
	media="all" />
<link rel="stylesheet" href="/dist/css/font-awesome.css" type="text/css"
	media="all" /> -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!--// css -->
<!-- font -->
<!-- <link href="/dist/Roboto.css.txt" rel="stylesheet" />
<link href="/dist/css/OpenSans.css.txt" rel='stylesheet' type='text/css' />
//font
<script src="/dist/js/jquery-1.11.1.min.js"></script>
<script src="/dist/js/bootstrap.js"></script> -->
</head>
<body>

	<!-- projects -->
	<div class="portfolio">
		<div class="container">
			<div class="w3ls-title">
			<h1 style="color: #666666">회의실/교육실</h1>
   		    <hr style="border: solid 0.5px #EBEBE3">
			</div>
			<div class="wthree_services_grids">
				<ul class="simplefilter">
					<li class="active" data-filter="all">All</li>
					<li data-filter="1">회의실</li>
					<li data-filter="2">교육실</li>
				</ul>

				<ul class="simplefilter">
					<c:forEach var="bldg" items="${bldgList}">
						<li data-filter="${bldg.bldgNo}">${bldg.bldgNm}</li>
					</c:forEach>	
				</ul>
            <div class="filtr-container">
               <c:forEach var="room" items="${roomList}">
                  <div class="col-md-4 col-sm-4 col-xs-6 agi-pro filtr-item"
                     data-category="${room.roomType}, ${room.bldgVO.bldgNo}"
<%--                      data-category="${room.bldgVO.bldgNo}" --%>
                     data-sort="">
                     <div class="agileits_portfolio_grid">
                        <a class="group1"
                           href="/room/roomDetail.do?roomNo=${room.roomNo}"
                           title="Prefabrication"> <img class="img-responsive" onerror="this.srcset='http://placehold.it/500x500'" 
                           src="/viewImage.do?roomNo=${room.roomNo}" alt="" />
                           <div class="w3_textbox">
                              <h4>${room.roomNm}</h4>
                           </div>
                        </a>
                     </div>
                  </div>
                  <div class="clearfix"></div>
               </c:forEach>

            </div>
			</div>
		</div>
	</div>
	<!-- //projects -->
	<!-- pop-up-plugin -->
	<!-- 	<script>
		$(document).ready(function() {
			var roomNo;
			//Examples of how to assign the Colorbox event to elements

			$(".group1").click(function() {
				var roomNo = $(room.roomNo);
				location.href = "/room/roomDetail.do?roomNo=" + roomNo;
			});
		});
	</script> -->
	<!-- //pop-up-plugin -->
	<!-- filter-plugin -->
	<script src="/dist/js/jquery.filterizr.js"></script>
	<script src="/dist/js/controls.js"></script>
	<script type="text/javascript">
		$(function() {
			//Initialize filterizr with default options
			$('.filtr-container').filterizr();
		});
	</script>

</body>
</html>
