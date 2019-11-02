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
date       : 2018.06.13
description :

  [이름]   [수정일]     [내용]
  ----------------------------------------------------------

--%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Prefabrication Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<!-- css -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- tabletools -->
<link href="${pageContext.request.contextPath}/dist/css/dataTables.tableTools.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/dist/css/responsive.bootstrap.css">
<!-- DataTable CSS -->
<link href="${pageContext.request.contextPath}/dist/css/dataTables.bootstrap.css" rel="stylesheet">
<link href="//cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" rel="stylesheet">


<style>
.container1{
	background : #F2FFED;
}

#completeImg{
width : 100px;
}

td,th {
color: #000 !important;
font-size: 30px;
}
</style>
</head>
<body>

	<!--projects-->
	<div class="portfolio">
		<div class="container">
			<h1 style="color: #666666">내 예약 현황</h1>
   		    <hr style="border: solid 0.5px #EBEBE3">
			<div class="container-fluid" style="margin: 20px;">
			<div class="row">
			<div class="col-lg-12">
			<div class="col-lg-12">
			<div class="panel panel-default">
			<div class="panel-body">
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
								<th class="text-center" width="15%">장소</th>
								<th class="text-center" width="15%">예약상태</th>
								<th class="text-center" width="*">상세페이지</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="resList" items="${resList}">
								<tr>
									<td class="text-center" style="vertical-align: middle;">
										${resList.resNo}</td>
									<td class="text-center" style="vertical-align: middle;">
										${resList.startDt}</td>
									<td class="text-center" style="vertical-align: middle;">
										${resList.endDt}</td>
									<td class="text-center" style="vertical-align: middle;">
										${resList.roomVO.roomNm}</td>
									<td class="text-center" style="vertical-align: middle;">
										<c:choose>
										<c:when test="${resList.resState=='0'}">
											<span style="font-weight:bolder; color:blue;">승인대기<br/>(상위결재자)</span>
										</c:when>
										<c:when test="${resList.resState=='1'}">
											<span style="font-weight:bolder; color:blue">승인대기<br/>(담당자)</span>
										</c:when>
										<c:when test="${resList.resState=='2'}">
											<span style="font-weight:bolder; color:red">승인거부<br/>(상위결재자)</span>
										</c:when>
										<c:when test="${resList.resState=='3'}">
											<span style="font-weight:bolder; color:red">승인거부<br/>(담당자)</span>
										</c:when>
										<c:when test="${resList.resState=='4'}">
											<span style="font-weight:bolder; color:green">승인완료</span>
										</c:when>
										<c:when test="${resList.resState=='5'}">
											사용중
										</c:when>
										<c:when test="${resList.resState=='6'}">
											사용완료
										</c:when>
										<c:when test="${resList.resState=='7'}">
											미사용
										</c:when>
										<c:when test="${resList.resState=='8'}">
											예약취소
										</c:when>
									</c:choose></td>
									<td style="vertical-align: middle;">
									<center>
									<button type="button" class="btn btn-primary" onclick="fn_goUrl('/res/detailModify.do?resNo=${resList.resNo}')" >
  									상세보기
									</button></center>
									<div class="modal fade" id="detail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
									  <div class="modal-dialog">
									    <div class="modal-content">
									      <div class="modal-header">
									        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									        <h4 class="modal-title" id="myModalLabel">예약 상세보기</h4>
									      </div>
									      <div class="modal-body">
									        	<img src="/dist/images/gsitm.png" id=completeImg>
									        	<hr>
									        	<h4>예약내역</h4>
									        	<table>
									        		<tr><td>예약번호:	</td><td id="resNo" >${resList.resNo}</td></tr>
									        		<tr><td>예약자 :	 </td><td>${empNm}</td></tr>
									        		<tr><td>건물 : 	</td><td>${bldgNm}</td></tr>
									        		<tr><td>회의실/교육실 : </td><td>${roomNm}</td></tr>
									        	</table>
									        	예약일시
									        	<table  class="table table-bordered">
									        		<tr>
									      				<td>시작시간</td>
									      				<td>종료시간</td>
									      			</tr>
									      			<tr>
									      				<td>${resList.startDt}</td>
									      				<td>${resList.endDt}</td>
									      			</tr>
									        	</table>
									        	<hr>
									        	<div class="modalModify">
									        	<h4>결제내역</h4>
 									        	<table>
									        		<tr><td>비품리스트 : </td>
									        			<td><c:forEach var="itemList" items="${itemList}">
														  <label>
														    ${itemList.itemNm} 
														  </label>
														  <label> </label>
														</c:forEach></td>
									        		</tr>
									        	</table>
									        	총가격
									        	<h3>가격</h3>
									        	<hr>
									        	<button type="button" class="btn btn-default" data-target="#modifyRes" id="btnModify">수정하기</button>
									        	<button type="button" class="btn btn-danger" data-dismiss="modal" id="btnDelete">취소하기</button>
									        	</div>
									      </div>
<!-- 									      <div class="modal-footer">
									        
									      </div> -->
									    </div>
									  </div>
									</div>
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
	<script>
		$(document).ready(function(){
			$("#btnModify").click(function(){
				$(".modalModify").html('<h3>기자재/간식 선택</h3>'+
			       		'<c:forEach var="itemList" items="${itemList}">'+
			      		'<div class="checkbox">'+
						  '<label> <input type="checkbox" value="${itemList.itemNo}">${itemList.itemNm}</label>'+
						'</div>'+
						'</c:forEach><hr>'+
					       	'<div class="container1">'+
					       		'<h3>결제 비용</h3>'+
					       		'<table>'+
					       			'<tr><td>회의실 대여료</td><td>가격</td></tr>'+
					       			'<c:forEach var="items" items="${itemList}">'+
					       			'<tr><td>${items.itemNm}의 사용료</td><td>${items.useCost}원</td></tr>'+
					       			'</c:forEach>'+
					       			'<tr><td>최종결제 금액</td><td>돈</td></tr>'+
					       		'</table>'+
					       		'</div><hr>'+
					        	'<button type="button" class="btn btn-danger" data-dismiss="modal">수정완료</button>');
				
			});
		});
	</script>
	<script>
		$(document).ready(function(){
			$('#btnDelete').click(function(){
				 var num = $('#resNo').text();
				 console.log(num)
				 location.href="/res/resDelete.do?resNo="+num;
			})
		})
	</script>
</body>
</html>
