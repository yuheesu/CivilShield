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
date       : 2018.06.16
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
.container{
width: 1400px;
}
td,th {
color: #000 !important;
font-size: 30px;
}

/* ---------------------------------------------------
    MEDIAQUERIES
----------------------------------------------------- */
@media ( max-width : 768px) {
	.wrapper {
		display: table;
		transition: all 0.3s;
	}
	nav.sidebar.active {
		min-width: 60vw;
		max-width: 60vw;
		min-height: 10vw;
		transition: all 0.3s;
	}
	nav.sidebar {
		min-height: 110vw;
	}
	.container{
		width: 700px;
		}
}
</style>
</head>
<body>

	<!--projects-->
	<div class="portfolio">
		<div class="container">
			<h1 style="color: #666666">승인 요청 현황</h1>
   		    <hr style="border: solid 0.5px #EBEBE3">
			<div class="container-fluid" style="margin-top: 20px;">
			<div class="row">
			<div class="col-lg-12">
			<div class="col-lg-12">
			<div class="panel panel-default" style="width: 1200px;">
			<div class="panel-body">
				<div class="dataTable_wrapper">
					<table
						class="table table-striped table-bordered table-hover dt-responsive"
						id="dataTables-resHis" width="100%"
						data-order='[[ 0, "asc" ],[ 1, "asc" ]]' data-page-length='10'
						>
						<thead style="background-color: #3366cc26">
							<tr>
								<th class="text-center" width="8%">예약번호</th>
								<th class="text-center" width="15%">예약시작일자</th>
								<th class="text-center" width="15%">예약종료일자</th>
								<th class="text-center" width="14%">장소</th>
								<th class="text-center" width="9%">예약상태</th>
								<th class="text-center" width="9%">팀장</th>
								<th class="text-center" width="9%">담당자</th>
								<th class="text-center" width="13%">승인하기</th>
								<th class="text-center" width="13%">상세보기</th>
							</tr>
						</thead>
						<tbody id="resState">
							<c:forEach var="res" items="${resList}" varStatus="status">
							<%-- <c:if test="${res.resState eq '1' or res.resState eq '0'}"> --%>
								<tr class="resStateTr">
									<td class="text-center" style="vertical-align: middle;">
										${res.resNo}</td>
									<td class="text-center" style="vertical-align: middle;">
										${res.startDt}</td>
									<td class="text-center" style="vertical-align: middle;">
										${res.endDt}</td>
									<td class="text-center" style="vertical-align: middle;">
										${res.roomVO.roomNm}</td>
									<td id="resStateTd" class="resStateTd" style="vertical-align: middle;">
									<c:choose>
										<c:when test="${res.resState=='0'}">
											<span style="font-weight:bolder; color:blue;">승인대기<br/>(팀장)</span>
										</c:when>
										<c:when test="${res.resState=='1'}">
											<span style="font-weight:bolder; color:blue">승인대기<br/>(담당자)</span>
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
									</c:choose></td>
									<td style="vertical-align:middle;">
										<c:choose>
											<c:when test="${res.resState=='0'}">
												<span style="font-weight:bolder; color:red;">승인대기중</span>
											</c:when>
											<c:when test="${res.resState=='1'}">
												<span style="font-weight:bolder; color:blue;">승인완료</span>
											</c:when>
										</c:choose>
									</td>
									<td style="vertical-align:middle;">
										<c:if test="${res.resState=='1'}">
											<span style="font-weight:bolder; color:red;">승인대기중</span>
										</c:if>
									</td>
									<td class="approvalTd" style="vertical-align: middle;">
										<button id="btnAccept" type="button" class="btn btn-primary" value="${res.resNo}">승인하기</button> <!-- id="btnDecline" -->
										<button id="btnReject" type="button" class="btn btn-danger" value="${res.resNo}">반려하기</button>
										<%-- <input type="hidden" id="resNoState" value="${res.resNo}"> --%>
										</td>
									<td style="vertical-align: middle;">
									<button type="button" class="btn btn-primary" onclick="fn_goUrl('/res/detailModify.do?resNo=${res.resNo}')">
  									상세보기
									</button>
									</td>
								</tr>
								<%-- </c:if> --%>
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
					"order"  : [[4,"desc"]],
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
	
	<script type="text/javascript">
		$(document).ready(function($){
			$('#btnDecline').click(function(){
				 var num = $('#resNo').text();
				 console.log(num)
				 location.href="/res/resDecline.do?resNo="+num;
			})
		})
	</script>
	
	<script>
		$(".approvalTd").each(function(i){
			$(this).find('#btnAccept').click(function(e){
				//e.preventDefault();
				
				var resNo = $(this).val();		
				
				$.ajax({
					url: '/res/approvalAccept.do?resState=' + $(this).val(), // 서버에 전달할 파일명
					type: 'post',
					data: {
						'resNo': resNo // 전송할 파라미터 1
					},
					success: function() {
						alert('승인완료'); // 성공시 코드
						location.reload();
					},
					error: function(request,status,error){	// 실패지 Error Log
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
			});
		});
		
		$(".approvalTd").each(function(i){
			$(this).find('#btnReject').click(function(e){
				
				var resNo = $(this).val();		
				
				$.ajax({
					url: '/res/approvalReject.do?resState=' + $(this).val(), // 서버에 전달할 파일명
					type: 'post',
					data: {
						'resNo': resNo // 전송할 파라미터 1
					},
					success: function() {
						alert('반려완료'); // 성공시 코드
						location.reload();
					},
					error: function(request,status,error){	// 실패지 Error Log
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
			});
		});
	
	</script>
</body>
</html>
