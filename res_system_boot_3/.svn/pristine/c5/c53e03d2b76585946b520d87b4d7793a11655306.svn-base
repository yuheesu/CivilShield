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
date       : 2018.06.12
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
<!-- tabletools -->
<link href="${pageContext.request.contextPath}/dist/css/dataTables.tableTools.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/dist/css/responsive.bootstrap.css">
<!-- DataTable CSS -->
<link href="${pageContext.request.contextPath}/dist/css/dataTables.bootstrap.css" rel="stylesheet">
<link href="//cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" rel="stylesheet">
<!-- tabletools -->
<link href="/dist/css/dataTables.tableTools.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="/dist/css/responsive.bootstrap.css">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/css/bootstrap-datepicker.css"/>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

</head>
<style>
td,th {
color: #000 !important;
font-size: 30px;
}
</style>
<body>

	<!--projects-->
	<div class="portfolio">
		<div class="container">
			<h1 style="color: #666666">예약 히스토리</h1>
   		    <hr style="border: solid 0.5px #EBEBE3">
			<div class="container-fluid" style="margin: 20px;">
			<div class="row">
			<div class="col-lg-12">
			<div class="col-lg-12">
			<div class="panel panel-default">
			<div class="panel-body">
			  기 간 :  <input type="text" name="datefilter" value="" style="margin: 20px;" /><br>		  
				<div class="dataTable_wrapper">
					<table
						class="table table-striped table-bordered table-hover dt-responsive"
						id="dataTables-resHis" width="100%"
						data-order='[[ 0, "asc" ],[ 1, "asc" ]]' data-page-length='10'>
						<thead>
							<tr style="background-color: #3366cc26">
								<th class="text-center" width="10%">예약번호</th>
								<th class="text-center" width="20%">예약시작일자</th>
								<th class="text-center" width="20%">예약종료일자</th>
								<th class="text-center" width="15%">예약자</th>
								<th class="text-center" width="*">승인처리</th>
							</tr>
						</thead>
						<tbody id="histTable">
						<c:set var="startDt" value="#"/>
							<c:forEach var="res" items="${resList}">
								<%-- <c:if test="${startDate.value eq }">  --%>
								<%-- <input type="text" id="resStartDate" name="resStartDate" value="${resList.startDt}" style="visibility:hidden">
								<input type="text" id="resEndDate" name="resEndDate" value="${resList.endDt}" style="visibility:hidden"> --%>
								
									<tr class="res-wrapper" data-startdt="${res.startDt}">
										<td class="text-center" style="vertical-align: middle;">
											${res.resNo}</td>
										<td class="text-center" style="vertical-align: middle;">
											${res.startDt}</td>
										<td class="text-center" style="vertical-align: middle;">
											${res.endDt}</td>
										<td class="text-center" style="vertical-align: middle;">
											${res.empVO.empNm}</td>
										<td class="text-center" style="vertical-align: middle;">
											<c:choose>
												<c:when test="${res.resState=='0'}">
												상위결재자 승인대기
												</c:when>
												<c:when test="${res.resState=='1'}">
												담당자 승인대기
												</c:when>
												<c:when test="${res.resState=='2'}">
												상위결재자 승인거부
												</c:when>
												<c:when test="${res.resState=='3'}">
												담당자 승인거부
												</c:when>
												<c:when test="${res.resState=='4'}">
												승인완료
												</c:when>
												<c:when test="${res.resState=='5'}">
												사용중
												</c:when>
												<c:when test="${res.resState=='6'}">
												사용완료
												</c:when>
												<c:when test="${res.resState=='7'}">
												미사용
												</c:when>
												<c:when test="${res.resState=='8'}">
												예약취소
												</c:when>
											</c:choose>
											</td>
									</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				</div>
				</div>
				</div>
				</div>
				</div>
			</div>

		</div>
	</div>

	<!-- filter-plugin -->
	<script src="/dist/js/controls.js"></script>
	
	<!-- Bootstrap core JavaScript -->
	<script
		src="${pageContext.request.contextPath}/dist/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/dist/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Plugin JavaScript -->
	<script
		src="${pageContext.request.contextPath}/dist/vendor/jquery-easing/jquery.easing.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/dist/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

	<!-- Contact Form JavaScript -->
	<script
		src="${pageContext.request.contextPath}/dist/js/jqBootstrapValidation.js"></script>
	<script src="${pageContext.request.contextPath}/dist/js/contact_me.js"></script>

	<!-- Custom scripts for this template -->
	<script
		src="${pageContext.request.contextPath}/dist/js/freelancer.min.js"></script>
	
	<!-- dataTables JavaScript -->
	<script src="${pageContext.request.contextPath}/dist/js/jquery.dataTables.js"></script>
	<script src="${pageContext.request.contextPath}/dist/js/dataTables.bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/dist/js/dataTables.responsive.js"></script>
	<script src="${pageContext.request.contextPath}/dist/js/responsive.bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/dist/js/dataTables.tableTools.js"></script>
	<script type="text/javascript">
		$(document).ready(function($) {
			$(document).ready(function() {

				var table = $('#dataTables-resHis').DataTable({
					responsive : true,
					ordering : true,
					"bAutoWidth" : true,
					"columnDefs" : [ {
						"orderable" : false,
						"targets" : 0
					} ]
				});
			});
		});
	</script>
	
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
  <script src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/js/bootstrap-datepicker.js"></script>
  <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
  <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
  <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	
	  <script>
		$(function() {
		  $('input[name="datefilter"]').daterangepicker({
		    opens: 'left'
		  }, function(start, end, label) {
		    console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
		    $('#startDate').val(start.format('YYYY-MM-DD'));
		    $('#endDate').val(end.format('YYYY-MM-DD'));
		    var st = new Date(start);
		    var ed = new Date(end);
		    $('.res-wrapper').each(function(index, element) {
		    	var $el = $(element);
		    	var startDt = new Date($el.data('startdt'));
		    	if(( start <= startDt ) && ( end >= startDt)) {
		    		$el.css('display', 'table-row');
		    	}
		    	else {
		    		$el.css('display', 'none');
		    	}
		    });
		  });
		});
		</script>
</body>
</html>
