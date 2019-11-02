<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%--
subject    :
author     : 유희수
date       : 2018.06.14
description :

  [이름]   [수정일]     [내용]
  ----------------------------------------------------------

--%>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<style>
.content-wrapper {
	padding-top: 20px;
	padding-bottom: 20px;
}
.modal-confirm {		
		color: #636363;
		width: 400px;
	}
	.modal-confirm .modal-content {
		padding: 20px;
		border-radius: 5px;
		border: none;
        text-align: center;
		font-size: 14px;
	}
	.modal-confirm .modal-header {
		border-bottom: none;   
        position: relative;
	}
	.modal-confirm h4 {
		text-align: center;
		font-size: 24px;
		margin: 30px 0 -10px;
	}
	.modal-confirm .close {
        position: absolute;
		top: -5px;
		right: -2px;
	}
	.modal-confirm .modal-body {
		color: #999;
	}
	.modal-confirm .modal-footer {
		border: none;
		text-align: center;		
		border-radius: 5px;
		font-size: 13px;
		padding: 10px 15px 25px;
	}
	.modal-confirm .modal-footer a {
		color: #999;
	}		
	.modal-confirm .icon-box {
		width: 80px !important;
		height: 80px !important;
		margin: 0 auto;
		border-radius: 50%;
		z-index: 9;
		text-align: center;
		border: 3px solid #f15e5e;
    display: block !important;
    background-color: #fff !important;
    cursor: default;
	}
	.modal-confirm .icon-box i {
		color: #f15e5e !important;
		font-size: 46px !important;
		display: inline-block;
		margin-top: 5px;
	}
    .modal-confirm .btn {
        color: #fff;
        border-radius: 4px;
		background: #60c7c1;
		text-decoration: none;
		transition: all 0.4s;
        line-height: normal;
		min-width: 120px;
        border: none;
		min-height: 40px;
		border-radius: 3px;
		margin: 0 5px;
		outline: none !important;
    }
	.modal-confirm .btn-info {
        background: #c1c1c1;
    }
    .modal-confirm .btn-info:hover, .modal-confirm .btn-info:focus {
        background: #a8a8a8;
    }
    .modal-confirm .btn-danger {
        background: #f15e5e;
    }
    .modal-confirm .btn-danger:hover, .modal-confirm .btn-danger:focus {
        background: #ee3535;
    }
	.trigger-btn {
		display: inline-block;
		margin: 100px auto;
	}
</style>
<script>
	var selectItem = new Array();
	var startDt;
	var endDt;
	
    var costPerHour;
    var roomNo;
	function roomItemProc(data) {
	    var $div = $('div.item-group');
	    $div.empty();
		var useCost = Math.floor((startDt.diff30Minutes(endDt) - (startDt.diffDays(endDt) * 8 * 2)) * (costPerHour / 2));
		$('.table-use-cost tbody').append($('<tr><td></td><td>예약금</td><td>'+(1000).toLocaleString()+'</td></tr>'));
		$('.table-use-cost tbody').append($('<tr><td></td><td>장소 이용료</td><td>'+useCost.toLocaleString()+'</td></tr>'));
		$('.table-use-cost').trigger('rowAddOrRemove');
	    var itemList = data.itemData;
	    for(var i = 0; i < itemList.length; i++) {
	      var item = itemList[i];
	      //room for start
		  var $li = $('<div class="col-xs-12 col-md-4 col-lg-3"><div class="input-group">'+
				  '<span class="input-group-addon"><input id="'+item.itemNo+'" type="checkbox" value="'+item.itemNo+'" onchange="chkBoxChange(event)")></span><label for="'+item.itemNo+'" class="form-control">'+item.itemNm+'</label>'+
				  '</div></div>');
	      var $chkBox = $li.find('#'+item.itemNo);
	      $chkBox.data('id', item.itemNo);
	      $chkBox.data('name', item.itemNm);
	      $chkBox.data('useCost', item.useCost);
	  	  <c:if test="${not canUpdate}">
	  		$chkBox.unbind('change');
	  		$chkBox.attr("disabled", true);
	  	  </c:if>
	      // $li = $('<a href="#" class="list-group-item">'+room.roomNm+' - GS ITM <span class="label label-success">'+roomType+'</span></a>');
	      $div.append($li);
	    }
	    //room for end
	    if(selectItem.length) {
        var $chkbox = $div.find('[type="checkbox"]');
        $chkbox.each(function(index, element) {
          var $el = $(element);
          for(var i = 0; i < selectItem.length; i++) {
            if($el.attr('id') == selectItem[i].id) {
              $el.trigger('click');
              break;
            }
          }
        });
	    }
	}
	function chkBoxChange(ev) {
		var $target = $(ev.target);
		var data = $target.data();
		if($target.is(':checked')) {
			$('.table-use-cost tbody').append($('<tr class="chkbox-wrapper-'+data.id+'"><td></td><td>'+data.name+' 사용요금</td><td>'+parseInt(data.useCost).toLocaleString()+'</td></tr>'));
			selectItem.push(data);
			$('.table-use-cost').trigger('rowAddOrRemove');
		}
		else {
			$('.table-use-cost').find('.chkbox-wrapper-'+data.id).remove();
            for(var i = 0; i < selectItem.length; i++) {
                if(selectItem[i].id == data.id) {
                	selectItem.splice(i, 1);
                }
            }
			$('.table-use-cost').trigger('rowAddOrRemove');
		}
	}
	<c:if test="${canUpdate}">
  function resCancelModal() {
		$('#cancelModal').modal('toggle');
  }
  function resCancel() {
    $.ajax({
        url:'/res/resDelete.do?resNo=' + $('#resNo').val(),
        dataType : 'json',
        success: function(data) {
          if(data.status == 200) {
            alert('취소 완료');
            fn_goUrl('/common/dashboard.do');
          }
        },
        error: resFailProc
	  });
  }
	function resCompProc(data) {
		if(data.status == 200) {
			alert('수정 완료');
		}
		else if(data.status == 401) {
			alert('수정 실패');
		}
		//모달 정보 넣기 & 띄우기
  }
    function resFailProc(xhr, status, error) {
      alert(status);
      //모달 정보 넣기 & 띄우기
    }
		function updateReservation() {
			// TODO.
			var json = {
				item : selectItem
			}
			$.ajax({
				type: "POST",
	            url:'/res/detailModify.do',
	            data: "data=" + JSON.stringify(json) + "&resNum=" + $('#resNo').val(),
	            dataType : 'json',
	            success: resCompProc,
	            error: resFailProc
	    });
		}
	</c:if>
	$(document).ready(function() {
		sessionStorage.clear();
	    costPerHour = parseInt($('#costPerHour').val());
	    roomNo = parseInt($('#roomNo').val());
		startDt = new Date($('.selected-res-date > tbody > tr > td').eq(1).text());
		endDt = new Date($('.selected-res-date > tbody > tr > td').eq(2).text());
		$('.item-wrapper').children().each(function(index, element) {
			selectItem.push($(element).data());
		});
		$('.table-use-cost').on('rowAddOrRemove', function() {
			var totalCost = 0;
			$(this).find('tbody > tr').each(function(index, element) {
				$(element).children().eq(0).text(index + 1);
				totalCost += parseInt($(element).children().eq(2).text().replace(/,/gi, ''));
			});
			//총액만 필요.
			$(this).find('tfoot > tr > td:last-child').text(totalCost.toLocaleString());
			// str.replace(/,/gi, '');
		});
		$.ajax({
            url:'/roomItemAll.do?roomNo=' + roomNo,
            dataType : 'json',
            success: roomItemProc,
            error: function(xhr,status,error){ alert(status); }
      	});
		/*
		if(reservationValidator(true)) {
			$.ajax({
	              url:'/roomItemAll.do?bldgNo=' + 10,
	              dataType : 'json',
	              success: roomItemProc,
	              error: function(xhr,status,error){ alert(status); }
	        });
		}
		*/
  });
</script>
<div class="container">
<div class="item-wrapper">
	<c:forEach var="item" items="${resItems}">
		<input class="form-control" id="itemNo${item.itemNo}" name="itemNo" type="hidden" placeholder="roomNo" data-id="${item.itemNo}" data-name="${item.itemNm}" data-usecost="${item.useCost}" disabled>
	</c:forEach>
</div>
	<input class="form-control" id="resNo" name="resNo" type="hidden" placeholder="resNo" value="${res.resNo}" disabled>
	<input class="form-control" id="roomNo" name="roomNo" type="hidden" placeholder="roomNo" value="${room.roomNo}" disabled>
	<input class="form-control" id="costPerHour" name="costPerHour" type="hidden" placeholder="costPerHour" value="${room.costPerHour}" disabled>
	<div class="resDetail-header">
		<h1>상세예약</h1>
	</div>
	<div class="pre-selected-content">
		<div class="col-md-12 content-wrapper">
			<div class="col-xs-12 col-md-6 content-wrapper">
				<h3>근무지</h3>
      			<label for="bldgNm" class="sr-only">근무지이름</label>
      			<input class="form-control" id="bldgNm" name="bldgNm" type="text" placeholder="근무지" value="${bldg.bldgNm}" disabled>
			</div>
			<div class="col-xs-12 col-md-6 content-wrapper">
      			<h3>예약 장소</h3>
      			<label for="roomNm" class="sr-only">장소이름</label>
      			<input class="form-control" id="roomNm" name="roomNm" type="text" placeholder="회의실이름" value="${room.roomNm}" disabled>
			</div>
		</div>
      	<hr>
		<div class="col-md-12 content-wrapper">
			<h3>예약일자</h3>
      		<table class="table table-bordered selected-res-date">
      			<thead>
		  			<tr>
	      				<th>#</th>
	      				<th class="col-xs-5">시작시간</th>
	      				<th class="col-xs-5">종료시간</th>
	      			</tr>
      			</thead>
      			<tbody>
      				<tr>
      					<td>1</td>
      					<td>${res.startDt}</td>
      					<td>${res.endDt}</td>
      				</tr>
      			</tbody>
      		</table>
		</div>
      	<hr>
	</div>
      	<div class="col-lg-12 content-wrapper">
      		<h3>사용물품</h3>
     		<div class="item-group checkbox-wrapper">
			</div>
			<hr>
     	</div>
      	<div class="col-md-12 col-lg-12">
      	<div class="container1">
      		<h3>결제 비용</h3>
      		<table class="table table-bordered table-use-cost">
      			<thead>
	      			<tr>
	      				<th class="col-xs-2 col-md-2 col-lg-2">#</th>
	      				<th class="col-xs-5 col-md-5 col-lg-5">항목</th>
	      				<th class="col-xs-5 col-md-5 col-lg-5">가격(원)</th>
	      			</tr>
      			</thead>
      			<tbody>
      			</tbody>
      			<tfoot>
	      			<tr>
						<td></td>
	      				<td>총액</td>
	      				<td></td>
	      			</tr>
      			</tfoot>
      		</table>
      		</div>
      		<hr>
     	</div>
	<br>
	<br>
	<c:if test="${canUpdate}">
		<div class="col-md-12">
			<div class="">
				<button class="btn btn-danger" type="button" onclick="resCancelModal()"><span class="glyphicon glyphicon-remove" style="color: white;"></span> 예약취소</button>
				<button class="btn btn-success" type="button" onClick="updateReservation()"><span class="glyphicon glyphicon-ok" style="color: white;"></span> 수정</button>
			</div>
    </div>
    <!-- Modal HTML -->
<div id="cancelModal" class="modal fade">
	<div class="modal-dialog modal-confirm">
		<div class="modal-content">
			<div class="modal-header">
				<div class="icon-box">
					<i class="material-icons">&#xE5CD;</i>
				</div>				
				<h4 class="modal-title">예약을 취소하시겠습니까?</h4>	
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			</div>
			<div class="modal-body">
				<p>정말로 예약을 취소하실건가요?</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-info" data-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-danger" onclick="resCancel()">예약 취소</button>
			</div>
		</div>
	</div>
</div>   
	</c:if>
</div>
