<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
		color: #434e65;
		width: 525px;
	}
	.modal-confirm .modal-content {
		padding: 20px;
		font-size: 16px;
		border-radius: 5px;
		border: none;
	}
	.modal-confirm .modal-header {
		background: #47c9a2;
		border-bottom: none;   
        position: relative;
		text-align: center;
		margin: -20px -20px 0;
		border-radius: 5px 5px 0 0;
		padding: 35px;
	}
	.modal-confirm h4 {
		text-align: center;
		font-size: 36px;
		margin: 10px 0;
	}
	.modal-confirm .form-control, .modal-confirm .btn {
		min-height: 40px;
		border-radius: 3px; 
	}
	.modal-confirm .close {
        position: absolute;
		top: 15px;
		right: 15px;
		color: #fff;
		text-shadow: none;
		opacity: 0.5;
	}
	.modal-confirm .close:hover {
		opacity: 0.8;
	}
	.modal-confirm .icon-box {
		color: #fff;		
		width: 95px;
		height: 95px;
		display: inline-block;
		border-radius: 50%;
		z-index: 9;
		border: 5px solid #fff;
		padding: 15px;
		text-align: center;
	}
	.modal-confirm .icon-box i {
		color: #fff !important;
		font-size: 64px !important;
		margin: -4px 0 0 -4px;
	}
	.modal-confirm.modal-dialog {
		margin-top: 80px;
	}
    .modal-confirm .btn {
        color: #fff;
        border-radius: 4px;
		background: #eeb711;
		text-decoration: none;
		transition: all 0.4s;
        line-height: normal;
		border-radius: 30px;
		margin-top: 10px;
		padding: 6px 20px;
        border: none;
    }
	.modal-confirm .btn:hover, .modal-confirm .btn:focus {
		background: #eda645;
		outline: none;
	}
	.modal-confirm .btn span {
		margin: 1px 3px 0;
		float: left;
	}
	.modal-confirm .btn i {
		margin-left: 1px;
		font-size: 20px;
		float: right;
	}
	.trigger-btn {
		display: inline-block;
		margin: 100px auto;
	}
</style>
<script>
  function resCancel() {
    sessionStorage.clear();
    fn_goUrl('/common/dashboard.do');
  }
	function roomItemProc(data) {
	    var $div = $('div.item-group');
	    $div.empty();
	    
	    var json = getResJson();
		var room = data.roomData;
		var startDt = new Date(json.date[0].startDt);
		var endDt = new Date(json.date[0].endDt);
		var useCost = Math.floor((startDt.diff30Minutes(endDt) - (startDt.diffDays(endDt) * 8 * 2)) * (room.costPerHour / 2));
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
	      // $li = $('<a href="#" class="list-group-item">'+room.roomNm+' - GS ITM <span class="label label-success">'+roomType+'</span></a>');
	      $div.append($li);
	    }
	    //room for end
	    if(json.item.length) {
        var $chkbox = $div.find('[type="checkbox"]');
        $chkbox.each(function(index, element) {
          var $el = $(element);
          for(var i = 0; i < json.item.length; i++) {
            if($el.attr('id') == json.item[i].id) {
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
		var json = getResJson();
		if($target.is(':checked')) {
			$('.table-use-cost tbody').append($('<tr class="chkbox-wrapper-'+data.id+'"><td></td><td>'+data.name+' 사용요금</td><td>'+parseInt(data.useCost).toLocaleString()+'</td></tr>'));
			json.item.push(data);
			$('.table-use-cost').trigger('rowAddOrRemove');
		}
		else {
			$('.table-use-cost').find('.chkbox-wrapper-'+data.id).remove();
            for(var i = 0; i < json.item.length; i++) {
                if(json.item[i].id == data.id) {
                  json.item.splice(i, 1);
                }
            }
			$('.table-use-cost').trigger('rowAddOrRemove');
		}
		setResJson(json);
	}
	function resCompProc(data) {
    if(data.status == 200) {
      sessionStorage.clear();
      $('div.container').children().attr('disabled', true);
      $('#successModal').modal('toggle');
    }
    else if(data.status == 401) {
      sessionStorage.clear();
      alert('예약이 실패했습니다. 다시 시도해주시기 바랍니다.');
      fn_goUrl('/res/reservation.do');
    }
  }
  function resFailProc(xhr, status, error) {
    sessionStorage.clear();
    alert('예약이 실패했습니다. 다시 시도해주시기 바랍니다.');
    fn_goUrl('/res/reservation.do');
	}
	function doReservation() {
		var json = getResJson();
		$.ajax({
			type: "POST",
            url:'/res/reservation.do',
            data: "data=" + JSON.stringify(json),
            dataType : 'json',
            success: resCompProc,
            error: resFailProc
    });
		/*
		if(reservationValidator(false)) {
			$.ajax({
				  type: "POST",
	              url:'/reservation.do',
	              data: json,
	              dataType : 'json',
	              success: resCompProc,
	              error: function(xhr,status,error){ alert(status); }
	        });
		}
		else {
			
		}
		*/
	}
	$(document).ready(function() {		
		var json = getResJson();
		$('#bldgNo').val(json.bldg.id);
		$('#bldgNm').val(json.bldg.name);
		$('#roomNo').val(json.room.id);
		$('#roomNm').val(json.room.name);
		if(json.date.length > 1) {
			$('<tr><td></td><td>일별 금액</td><td></td></tr>').insertBefore($('.table-use-cost > tfoot > tr'));
		}
		
		$('.table-use-cost').on('rowAddOrRemove', function() {
			var totalCost = 0;
			$(this).find('tbody > tr').each(function(index, element) {
				$(element).children().eq(0).text(index + 1);
				totalCost += parseInt($(element).children().eq(2).text().replace(/,/gi, ''));
			});
			var json = getResJson();
			if(json.date.length > 1) {
				//일별 사용요금 필요.
				$(this).find('tfoot > tr:first-child > td:last-child').text(totalCost.toLocaleString());
				$(this).find('tfoot > tr:last-child > td:last-child').text((totalCost * json.date.length).toLocaleString());
			}
			else {
				//총액만 필요.
				$(this).find('tfoot > tr > td:last-child').text(totalCost.toLocaleString());
			}
			// str.replace(/,/gi, '');
		});
		var $date = $('.selected-res-date tbody');
		for(var i = 0; i < json.date.length; i++) {
			var date = json.date[i];
			var $tr = $('<tr></tr>');
			$tr.append($('<td>'+(i + 1)+'</td>'));
			$tr.append($('<td>'+new Date(date.startDt).toLocaleString()+'</td>'));
			$tr.append($('<td>'+new Date(date.endDt).toLocaleString()+'</td>'));
			$date.append($tr);
		}
		$.ajax({
            url:'/roomItemAll.do?roomNo=' + json.room.id,
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
	<div class="resDetail-header">
		<h1>상세예약</h1>
	</div>
	<div class="pre-selected-content">
		<div class="col-md-12 content-wrapper">
			<div class="col-xs-12 col-md-6 content-wrapper">
				<h3>근무지</h3>
      			<label for="bldgNo" class="sr-only">근무지번호</label>
      			<input class="form-control" id="bldgNo" name="bldgNo" type="hidden" disabled>
      			<label for="bldgNm" class="sr-only">근무지이름</label>
      			<input class="form-control" id="bldgNm" name="bldgNm" type="text" placeholder="근무지" disabled>
			</div>
			<div class="col-xs-12 col-md-6 content-wrapper">
      			<h3>예약 장소</h3>
      			<label for="roomNo" class="sr-only">장소번호</label>
      			<input class="form-control" id="roomNo" name="roomNo" type="hidden" disabled>
      			<label for="roomNm" class="sr-only">장소이름</label>
      			<input class="form-control" id="roomNm" name="roomNm" type="text" placeholder="회의실이름" disabled>
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
	<div class="col-md-12">
	<div class="">
		<button class="btn btn-default" type="button" onclick="fn_goUrl('/res/reservation.do')"><span class="glyphicon glyphicon-arrow-left" style="color: black;"></span> 이전단계</button>
		<button class="btn btn-danger" type="button" onclick="resCancel()"><span class="glyphicon glyphicon-remove" style="color: white;"></span> 예약취소</button>
		<button class="btn btn-success" type="button" onClick="doReservation()"><span class="glyphicon glyphicon-ok" style="color: white;"></span> 예약하기</button>
	</div>
<!-- Modal HTML -->
<div id="successModal" class="modal fade">
	<div class="modal-dialog modal-confirm">
		<div class="modal-content">
			<div class="modal-header">
				<div class="icon-box">
					<i class="material-icons">&#xE876;</i>
				</div>
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			</div>
			<div class="modal-body text-center">
				<h4>감사합니다!</h4>	
				<p>예약이 완료되었습니다.</p>
				<button class="btn btn-success" data-dismiss="modal" onclick="fn_goUrl('/common/dashboard.do')"><span>메인으로</span> <i class="material-icons">&#xE5C8;</i></button>
			</div>
		</div>
	</div>
</div>
	</div>
</div>
