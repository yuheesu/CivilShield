<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


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
<!-- Date Picker CSS -->
<%-- <link href="${pageContext.request.contextPath}/dist/css/bootstrap-datetimepicker.css" rel="stylesheet" /> --%>
<!-- tabletools -->
<link href="${pageContext.request.contextPath}/dist/css/dataTables.tableTools.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/dist/css/responsive.bootstrap.css">
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
			<h1 style="color: #666666">부서별 예산안내</h1>
   		    <hr style="border: solid 0.5px #EBEBE3">
			<div class="container-fluid"  style="margin: 20px;">
			<div class="row">
			<div class="col-lg-12">
			<div class="col-lg-12">
			<div class="panel panel-default">
			<div class="panel-body">
			  기 간 :  <input type="text" name="datefilter" value="" style="margin: 20px;" /><br>
			  
			   <input type="hidden" id="startDate" name="startDate" value="1900-01-01">
			   <input type="hidden" id="endDate" name="endDate" value="9999-12-31">
				<div class="dataTable_wrapper">
					<table
						class="table table-striped table-bordered table-hover dt-responsive"
						id="dataTables-resHis" width="100%"
						data-order='[[ 0, "asc" ],[ 1, "asc" ]]' data-page-length='10'>
						<thead>
							<tr style="background-color: #3366cc26">
				                <th class="text-center" width="15%">거래번호</th>
				                <th class="text-center" width="20%">거래날짜</th>
				                <th class="text-center" width="10%">종류</th>
				                <th class="text-center" width="15%">금액</th>
				                <th class="text-center" width="*">내용</th>
				                <th class="text-center" width="15%">거래후잔액</th>
							</tr>
						</thead>
						<tbody>
       				       <c:forEach var="budget" items="${budgetList}">
								<tr class="budget-wrapper" data-procdt="${budget.procDt}">
				                  <td class="text-center" style="vertical-align: middle;">
				                    ${budget.deptBudgetNo}</td>
				                  <td class="text-center" style="vertical-align: middle;">
				                    <fmt:formatDate value="${budget.procDt}" pattern="yyyy-MM-dd"/></td>
				                  <td class="text-center" style="vertical-align: middle;">
				                  	<c:choose>
										<c:when test="${budget.budgetType==0}">
											<label style="color: blue">수입</label>
										</c:when>
										<c:when test="${budget.budgetType==1}">
											<label style="color: red">지출</label>
										</c:when>
									</c:choose></td>
				                  <td class="text-center" style="vertical-align: middle;">
				                  	<c:choose>
										<c:when test="${budget.budgetType==0}">
											<fmt:formatNumber value="${budget.incoming}" type="number"/>원
										</c:when>
										<c:when test="${budget.budgetType==1}">
											<fmt:formatNumber value="${budget.outgoing}" type="number"/>원
										</c:when>
									</c:choose>
				                  <td class="text-center" style="vertical-align: middle;">
				                    ${budget.history}</td>
				                  <td class="text-center" style="vertical-align: middle;">
				                  <c:choose>
										<c:when test="${budget.budgetType==0}">
										<c:if test="${budget.outgoing<0}"><label style="color: red">
											<fmt:formatNumber value="${budget.outgoing}" type="number"/></label>원</c:if>
										<c:if test="${budget.outgoing>=0}"><label>
											<fmt:formatNumber value="${budget.outgoing}" type="number"/>원</label></c:if>
										</c:when>
										<c:when test="${budget.budgetType==1}">
										<c:if test="${budget.incoming<0}"><label style="color: red">
											<fmt:formatNumber value="${budget.incoming}" type="number"/></label>원</c:if>
										<c:if test="${budget.incoming>=0}"><label>
											<fmt:formatNumber value="${budget.incoming}" type="number"/>원</label></c:if>
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
	
	<!-- dataTables JavaScript -->
	<script src="${pageContext.request.contextPath}/dist/js/jquery.dataTables.js"></script>
	<script src="${pageContext.request.contextPath}/dist/js/dataTables.bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/dist/js/dataTables.responsive.js"></script>
	<script src="${pageContext.request.contextPath}/dist/js/responsive.bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/dist/js/dataTables.tableTools.js"></script>
	<script type="text/javascript">
		$(document).ready(function($) {
			var table = $('#dataTables-resHis').DataTable({
				serverSide: false,
				responsive : true,
				ordering : true,
				"bAutoWidth" : true,
				order: [[0,"desc"]]
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
       $('.budget-wrapper').each(function(index, element) {
          var $el = $(element);
          var procDt = new Date($el.data('procdt'));
          console.log(procDt);
          if(( start <= procDt ) && ( end >= procDt)) {
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
