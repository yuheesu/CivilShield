<%--
subject    : 관리자 페이지(관리자)
author     : 주형진
date       : 2018. 6. 11. 
description : 관리자 페이지
 
  [이름]   [수정일]     [내용]
  ----------------------------------------------------------
  주형진	2018-06-11		관리자 페이지 최초 편집
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Prefabrication a Real Estate  Category Flat Bootstrap responsive Website Template | Projects :: w3layouts</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<script src="/dist/js/jquery.colorbox.js"></script>
<style type="text/css">
	.white_content {
	    position: fixed;
	    top: 0;
	    right: 0;
	    bottom: 0;
	    left: 0;
	    background: rgba(0, 0, 0, 0.8);
	    opacity:0;
	    -webkit-transition: opacity 400ms ease-in;
	    -moz-transition: opacity 400ms ease-in;
	    transition: opacity 400ms ease-in;
	    pointer-events: none;
	    z-index: 10;
	}
	.white_content.target {
	    opacity:1 !important;
	    pointer-events: auto;
	}
	.white_content > div {
		position: absolute;
		top: 15%;
		left: 15%;
		width: 70%;
		height: 70%;
		padding: 16px;
		/* border: 16px solid orange; */
		background-color: white;
		overflow: auto;	
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
	    border-bottom: 3px solid #036;
	    border-right: 1px solid #ccc;
	}
	table.type tbody th {
	    width: 700px;
	    padding: 10px;
	    font-weight: bold;
	    vertical-align: top;
	    border-bottom: 1px solid #ccc;
	    border-right: 1px solid #ccc;
	    background: #f3f6f7;
	    width: 20%;
	}
	table.type td {
	    width: 350px;
	    padding: 10px;
	    vertical-align: top;
	    border-bottom: 1px solid #ccc;
	    border-right: 1px solid #ccc;
	    border-top: 1px solid #ccc;
	    border-left: 1px solid #ccc;
	}
	.navbar-left {
	    float: right!important;
	}
	
</style>

</head>

<!-- projects -->
	<div class="portfolio">
		<div class="container">
		<div class="w3ls-title" style="padding: 14px;"> 
           <h3 class="agileits-title w3title1">근무지/회의실 관리</h3><br/><br/>
              <button class="btn btn-primary" onclick="location.href = 'bldgAdd.do'" style="width:300px;">근무지 추가</button>&nbsp;&nbsp;&nbsp;&nbsp;
              <button class="btn btn-primary" style="display:inline-block; width:300px;">근무지 삭제</button><br/><br/>
              <form action="/admin/roomInsert.do" method="get" align="center" style="margin: 0 auto;">
                 <input type="submit" class="btn btn-primary" value="시설 추가" style="width:300px;">&nbsp;&nbsp;&nbsp;&nbsp;
                 <button class="btn btn-primary" style="width:300px;">시설 삭제</button>
                 <input type="hidden" id="curState" name="curState" value="All">
              </form>
           <!-- <button class="btn btn-primary" onclick="location.href = 'addRoom.do'">시설 추가</button> -->
         </div>
			<div class="wthree_services_grids">
				<ul class="simplefilter">
					<li class="active" data-filter="all">All</li>
					
					<c:forEach var="bldg" items="${bldgList}" varStatus="status">
					    <li data-filter="${bldg.bldgNo}">${bldg.bldgNm}</li>
					</c:forEach>
				</ul>
				<div class="filtr-container">
					<c:forEach var="room" items="${roomList}" varStatus="status">
					    <div class="col-md-4 col-sm-4 col-xs-6 agi-pro filtr-item" data-category= "<c:out value='${room.bldgVO.bldgNo}'/>" data-sort="">
							<div class="agileits_portfolio_grid">
								
								<a class="" href="#close" title="Prefabrication" data-modalid="roomManagementDetail${room.roomNo}">
									<img class="img-responsive" onerror="this.srcset='http://placehold.it/500x500'" src="/viewImage.do?roomNo=${room.roomNo}" alt="" />
									<div class="w3_textbox">
										<h4>${room.bldgVO.bldgNm}</h4>
										<p>"${room.roomNm}"</p>
									</div>
								</a>
							</div>
						</div>
						<div class="white_content" id="roomManagementDetail${room.roomNo}">
							<div>
								<input type="text" name="bldgNm" value="${room.bldgVO.bldgNm}" style="visibility:hidden;"/>
								<table border="1" class="type" width="100%">
									<tr>
										<th class="text-center" width="15%">근무지명</th>
				  						<td colspan="3">${room.bldgVO.bldgNm}</td>
									</tr>
						  			<tr>
						  				<th class="text-center" width="15%">구분</th>	
						  				<td colspan="3">
						  				<select class="form-control" name="roomType" style="color: black;  width: 200px;">
						  					<option value="1">회의실</option>
						  					<option value="2">교육실</option>
						  				</select></td>
						  			</tr>
						  			<tr>
						  				<th class="text-center" width="15%">수정일자</th>
						  				<td colspan="3">${mTime}</td>	<!-- 현재일자 받아와야됨 -->
						  			</tr>
						  			<tr>
						  				<th class="text-center" width="15%">시설명</th>
						  				<td colspan="3"><input type="text" class="form-control" name="roomNm" value="${room.roomNm}" readonly style="color: black;  width: 200px;"></td>
						  			</tr>
						  			<tr>
						  				<th class="text-center" width="15%">네트워크 사용여부</th>				
						  				<td colspan="3">
						  					<c:choose>
								  				<c:when test="${room.useNetworkYn eq 'Y'}">
									  				<input type="text" name="useNetworkYn" value="사용" class="form-control" style="color: black;  width: 200px;" readonly>
								  				</c:when>
								  				
								  				<c:when test="${room.useNetworkYn eq 'N'}">
									  				<input type="text" name="useNetworkYn" value="미사용" class="form-control" style="color: black;  width: 200px;" readonly>
								  				</c:when>
						  					</c:choose>
						  				</td>
						  			</tr>
						  			<tr>
						  				<th class="text-center" style="vertical-align:middle;">소개내용</th>
						  				<td colspan="3"><textarea name="roomExplain" class="form-control" style="color: black;" readonly>${room.roomExplain}</textarea></td>
						  			</tr>
						  			<tr>
						  				<th class="text-center" width="15%" style="vertical-align:middle;">수용인원</th>
						  				<td colspan="3"><input type="text" name="roomCapacity" class="form-control" value="${room.roomCapacity}" style="color: black;  width: 200px;" readonly></td>
						  			</tr>
						  			<tr>
						  				<th class="text-center" width="15%" style="vertical-align:middle;">면적</th>
						  				<td colspan="3"><input type="text" name="roomArea" class="form-control" value="${room.roomArea}" style="color: black;  width: 200px;" readonly></td>
						  			</tr>
						  			<tr>
						  				<th class="text-center" width="15%" style="vertical-align:middle;">예약비용</th>
						  				<td colspan="3"><input type="text" name="costPerHour" class="form-control" value="${room.costPerHour}" style="color: black;  width: 200px;" readonly></td>
						  			</tr>
						  			<tr>
						  				<th class="text-center" width="15%" style="">기자재  <input id="addItem" type="button" class="btn btn-success" value="추가" onClick="insRow()"/></th>
						  				<td>
					  						<table id="addTable" width="400" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" border="0">
						  						<c:forEach var="item" items="${itemList}" varStatus="status">
						  							<c:if test="${room.roomNo eq item.roomVO.roomNo}">
											           <tr>
											              <td><input class="form-control" type="text" name="itemNm0" value="${item.itemNm}" readonly></td>
											              <td align="left"></td>
											          </tr>
						  							</c:if>
						  						</c:forEach>
						  				 	</table>
						  				 </td>
						  				 <th class="text-center" width="15%" style="">비용</th>
						  				 <td>
						  				 	<table id="addCostTable" width="400" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" border="0">
						  						<c:forEach var="item" items="${itemList}" varStatus="status">
						  							<c:if test="${room.roomNo eq item.roomVO.roomNo}">
											           <tr>
											              <td><input class="form-control" type="text" name="itemNm0" value="${item.useCost}" readonly></td>
											              <td align="left"></td>
											          </tr>
						  							</c:if>
						  						</c:forEach>
						  				 	</table>
						  				 </td>
						  			</tr>
							  	</table>
							  	<div class="btnClass" style="float: right;">
							  		<input type="submit" class="btn btn-primary" value="수정">
							  		<button id="btnDelete" type="button" class="btn btn-danger" value="${room.roomNo}">삭제</button>
							  		<input type="button" class="btn btn-default" value="취소" data-modalid="roomManagementDetail${room.roomNo}" onclick="closeBtnClick(event)">
							  	</div>		
						    </div>
						</div>
					</c:forEach>
				   <div class="clearfix"> </div>
				</div>
			</div>
		</div>
	</div>
	<!-- //projects --> 

	
	
	<!-- start-smooth-scrolling -->
	<script type="text/javascript" src="/dist/js/move-top.js"></script>
	<script type="text/javascript" src="/dist/js/easing.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event){	
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
	</script>
	<!-- //start-smoth-scrolling -->
	<!-- here stars scrolling icon -->
	<script type="text/javascript">
		function closeBtnClick(ev) {
			var $target = $(ev.target);
			$('#'+$target.data('modalid')).removeClass('target');
		}
		$(document).ready(function() {
			$('div.agileits_portfolio_grid').on('click', 'a', function() {
				  //$('#'+$(this).data('modalid')).trigger('click');
				$('#'+$(this).data('modalid')).addClass('target');
			});
			$('.white_content').on('click', function(ev) {
				$(this).removeClass('target');
			});
			$('.white_content > div').on('click', function(ev) {
				ev.stopPropagation();
			});
			/*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
			*/
								
			$().UItoTop({ easingType: 'easeOutQuart' });
								
			});
	</script>
	<!-- pop-up-plugin -->
	
	<script>
		$(document).ready(function(){
			$("#curState").val('All');
			//Examples of how to assign the Colorbox event to elements
			$(".group1").colorbox({rel:'group1'});
			$(".callbacks").colorbox({
				onOpen:function(){ alert('onOpen: colorbox is about to open'); },
				onLoad:function(){ alert('onLoad: colorbox has started to load the targeted content'); },
				onComplete:function(){ alert('onComplete: colorbox has displayed the loaded content'); },
				onCleanup:function(){ alert('onCleanup: colorbox has begun the close process'); },
				onClosed:function(){ alert('onClosed: colorbox has completely closed'); }
			});
			
			//Example of preserving a JavaScript event for inline calls.
			$("#click").click(function(){ 
				$('#click').css({"background-color":"#f00", "color":"#fff", "cursor":"inherit"}).text("Open this window again and this message will still be here.");
				return false;
			});
		});
	</script>
	
	<script>
		/* 회의실/교육실 삭제  */
		$(".btnClass").each(function(i){
			$(this).find('#btnDelete').click(function(e){
				var roomNo = $(this).val();		
				
				$.ajax({
					url: '/deleteRoom.do?roomNo=' + $(this).val(),
					type: 'post',
					data: {
						'roomNo': roomNo // 전송할 파라미터 1
					},
					success: function() {
						alert('삭제완료'); // 성공시 코드
					},
					error: function(request,status,error){	// 실패지 Error Log
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
			});
		});
	</script>
	<!-- //pop-up-plugin --> 
	<!-- filter-plugin -->
	<script src="/dist/js/jquery.filterizr.js"></script>  
	<script src="/dist/js/controls.js"></script> 
	
	<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
	</script>
	<script type="text/javascript">
		$(function() {
			//Initialize filterizr with default options
			$('.filtr-container').filterizr();
			
		});
	</script>	
	<!-- //filter-plugin --> 

	<script>
		var oTbl;
		var oTbl2;
		var oTblImg;
		
		var imgIdx = 1;
		var itemIdx = 1;
		var imgCntIdx = 1;
		var itemCntIdx = 1;
		
		//Row 추가
		function insRow() {
			
		  oTbl = document.getElementById("addTable");
		  oTbl2 = document.getElementById("addCostTable");
		  
		  var oRow = oTbl.insertRow();
		  var oRow2 = oTbl2.insertRow();
		  
		  oRow.onmouseover=function(){oTbl.clickedRowIndex=this.rowIndex}; //clickedRowIndex - 클릭한 Row의 위치를 확인;
		  oRow2.onmouseover=function(){oTbl2.clickedRowIndex=this.rowIndex};
		  
		  var oCell = oRow.insertCell();
		  var oCell2 = oRow2.insertCell();
		
		  //삽입될 Form Tag
		  var frmTag = "<input type=text class=form-control name=itemNm" + itemIdx + " style=width:350px; height:20px; display: inline-block;> ";
		  var frmTag2 = "<input type=text class=form-control name=useCost" + itemIdx + " style=width:350px; height:20px; display: inline-block;> ";
		  
		  itemIdx++;
		  itemCntIdx++;
		  
		  frmTag += "<input type=button value='삭제' onClick='removeRow()' style='cursor:hand'>";
		  oCell.innerHTML = frmTag;
		  oCell2.innerHTML = frmTag2;
		  
		  /* alert($('#addTable tr').length); */
		  $('#itemTableLength').val($('#addTable tr').length);
		  $('#itemAddLength').val(itemCntIdx);
		  //alert($('#itemTableLength').val());
		}
		
		// 이미지 Row 추가
		function insImgRow() {
		  oTblImg = document.getElementById("addImgTable");
		  var oRow = oTblImg.insertRow();
		  oRow.onmouseover=function(){oTblImg.clickedRowIndex=this.rowIndex}; //clickedRowIndex - 클릭한 Row의 위치를 확인;
		  var oCell = oRow.insertCell();
		  
		  //삽입될 Form Tag
		  var frmTag = "<input type='file' name=imgFile" + imgIdx + ">";
		  
		  imgIdx++;
		  imgCntIdx++;
		  
		  frmTag += "<input type=button value='삭제' onClick='removeImgRow()' style='cursor:hand'>";
		  oCell.innerHTML = frmTag;
		  
		  $('#imgTableLength').val($('#addImgTable tr').length);
		  $('#imgAddLength').val(imgCntIdx);
		}
		//Row 삭제
		function removeRow() {
		  oTbl.deleteRow(oTbl.clickedRowIndex);
	
		  // 삭제 버튼의 Row값을 받아와 요금 Row 매칭 후 삭제
		  oTbl2.deleteRow(oTbl.clickedRowIndex);
		  itemIdx--;
		  $('#itemTableLength').val($('#addTable tr').length);
		  /* alert($('#addTable tr').length); */
		}
		
		function removeImgRow() {
			oTblImg.deleteRow(oTblImg.clickedRowIndex);
			imgIdx--;
			$('#imgTableLength').val($('#addImgTable tr').length);
			  /* alert($('#addImgTable tr').length); */
		}
		
		function frmCheck()
		{
		  var frm = document.form;
		  
		  for( var i = 0; i <= frm.elements.length - 1; i++ ){
		     if( frm.elements[i].name == "addText" )
		     {
		         if( !frm.elements[i].value ){
		             alert("텍스트박스에 값을 입력하세요!");
		                 frm.elements[i].focus();
			 return;
		          }
		      }
		   }
		}
	</script>
</body>
</html>