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
<style>
.table td {
   text-align: center;
   padding: 5px;
}
span.glyphicon.glyphicon-minus {
  color: gray;
}
span.glyphicon.glyphicon-ok {
  color: green;
}
span.glyphicon.glyphicon-remove {
  color: red;
}
.table td, .table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {
  text-align: center;
  padding: 8px !important;
}
table{
color: black;
}

.box{
text-align: center;
}

#day{
display: inline-block;
}
</style>
<link rel="stylesheet" type="text/css" href="/dist/css/datepicker3.css" />
	<!--projects-->
	<div class="portfolio">
		<div class="container">
			<h1 style="color: #666666">예약 현황 조회</h1>
    		<hr style="border: solid 0.5px #EBEBE3; margin-bottom: 20px;">
			<div class="serchDate" style="margin-top: 30px;">
				 <span style="font-size: 20px; margin:10px;font-weight:bold;"><img src="/dist/images/checked2.png" style="width:30px;margin:8px;">
       			 회의실 이용시간검색</span>
				<table style="margin:40px;">
					<tr>
						<td style="font-size: 20px; padding-right: 10px;">회의실 이용시간</td>
						<td><div class="input-group date">
								<input type="text" class="form-control" id="date">
								<span class="input-group-addon">
								<i class="glyphicon glyphicon-calendar"></i>
								</span>
							</div>
						</td>
						<td rowspan=2><button type="button" class="btn btn-primary" id="getConditionBtn" style="background-color: #3366cc; height: 100px; margin: 20px;">조회하기</button></td>
					</tr>
					<tr>
						<td style="font-size: 20px; padding-right: 10px;">회의실 건물</td>
						<td>
						<select class="form-control bldg-select">
								<c:forEach var="bldg" items="${bldgList}">
									<option value='${bldg.bldgNo}' style="background:#ffffff !important;">${bldg.bldgNm}</option>
								</c:forEach>
						</select>
					</tr>
				</table>
					<span style="font-size: 20px; margin-left:10px;font-weight:bold;margin-top:50px;"><img src="/dist/images/checked2.png" style="width:30px;margin:8px;">
       				회의실 및 교육실 이용시간</span>
       				<div class="box">
						<ul class="nav nav-pills" id="day">
							<li class="days"><a>day1</a></li>
							<li class="days"><a>day2</a></li>
							<li class="days"><a>day3</a></li>
							<li class="days active"><a>day4</a></li>
							<li class="days"><a>day5</a></li>
							<li class="days"><a>day6</a></li>
							<li class="days"><a>day7</a></li>
						</ul>
					</div>
					<div>
					<label>${empVO.deptVO.bldgVO.bldgNm}</label>
						<table class="table table-bordered table-res-condition" style="color: #000000;">
			              <thead style="color: #000000;">
			                <tr style="border-top: 2px solid black; border-bottom: 2px solid black;">
			                  <th nowrap>회의실/교육실명</th><th nowrap>수용인원</th>
			                  <th colspan="2">07</th><th colspan="2">08</th><th colspan="2">09</th><th colspan="2">10</th><th colspan="2">11</th><th colspan="2">12</th><th colspan="2">13</th><th colspan="2">14</th><th colspan="2">15</th><th colspan="2">16</th><th colspan="2">17</th><th colspan="2">18</th><th colspan="2">19</th><th colspan="2">20</th><th colspan="2">21</th><th colspan="2">22</th><th colspan="2">23</th>
			                </tr>
			              </thead>
			              <tbody style="color: #000000;">
			                <c:forEach var="room" items="${roomList}">
			                    <tr data-roomno="${room.roomNo}">
			                      <td>${room.roomNm}</td><td>${room.roomCapacity}</td>
			                      <td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
			                      <td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
			                    </tr>
			                </c:forEach>
			              </tbody>
						</table>
					</div>
					<div><center><a href="reservation.do"><button type="button" class="btn btn-success">예약하기</button></a></center></div>
			</div>
		</div>
	</div>
	<!-- filter-plugin -->
	<script src="/dist/js/controls.js"></script>
	<script type="text/javascript" src="/dist/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript" src="/dist/js/bootstrap-datepicker.kr.js"></script>
	<script>
    $(document).ready(function() {
      var result = new Array();
      <c:forEach var="room" items="${roomList}">
        var json = new Object();
        json.roomNo = "${room.roomNo}";
        json.roomNm = "${room.roomNm}";
        json.roomCapacity = "${room.roomCapacity}";
        var subResult = new Array();
        <c:forEach var="res" items="${room.reses}">
          var subJson = new Object();
          subJson.startDt = "${res.startDt}";
          subJson.endDt = "${res.endDt}";
          subResult.push(subJson);
        </c:forEach>
        json.resDt = subResult;
        result.push(json);
      </c:forEach>
      $('.input-group.date').datepicker({
            calendarWeeks: false,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr"
      });
      var $days = $('ul.nav.nav-pills > li.days > a');
      var date = new Date(new Date().getTime() - (1000 * 60 * 60 * 24 * 3));
      $days.each(function(index, element) {
        $(element).text(date.toYYYY_MM_DD());
        date.setTime(date.getTime() + (1000 * 60 * 60 * 24));
      });
      $days.on('click', function() {
        $days.parent().parent().find('li.active').removeClass('active');
        $(this).parent().addClass('active');
        $.ajax({
          url:'/res/conditionTotalAjax.do?bldgNo='+ $('select.bldg-select').val() +'&selectDate=' + $(this).text(),
          dataType : 'json',
          success: conditionTotalProc,
          error: function(xhr,status,error){ alert(status); }
        });
      });

      var $trs = $('.table-res-condition > tbody > tr');
      $trs.each(function(index, element) {
        for(var i = 0; i < result.length; i++) {
          var $element = $(element);
          if(result[i].roomNo == $element.data('roomno')) {
            var json = result[i];
            var $children = $element.children();
            $children.eq(0).text(json.roomNm);
            $children.eq(1).text(json.roomCapacity);
            $children = $element.children(':gt(1)');
            // $children.append($('<span class="glyphicon glyphicon-remove"></span>'));
            // $children.addClass('r_x');
            if(json.resDt != undefined && json.resDt.length) {
              for(var j = 0; j < json.resDt.length; j++) {
                var res = json.resDt[j];
                var startDt = new Date(res.startDt);
                var endDt = new Date(res.endDt);
                var startHourIndex = (startDt.getHours() - 9) * 2;
                if(startDt.getMinutes() == 30) {
                  startHourIndex++;
                }
                var endHourIndex = startHourIndex + Math.floor((endDt.getTime() - startDt.getTime()) / (1000 * 60 * 30));
                if(startHourIndex != 0) {
                  $children.eq(startHourIndex - 1).append($('<span class="glyphicon glyphicon-minus"></span>'));
                }
                if(endHourIndex < $children.length) {
                  $children.eq(endHourIndex).append($('<span class="glyphicon glyphicon-minus"></span>'));
                }
                $children.slice(0, startHourIndex - 1).append($('<span class="glyphicon glyphicon-ok"></span>'));
                $children.slice(endHourIndex + 1, $children.length).append($('<span class="glyphicon glyphicon-ok"></span>'));
                $children.slice(startHourIndex, endHourIndex).append($('<span class="glyphicon glyphicon-remove"></span>'));
              }
            }
            else {
              $children.append($('<span class="glyphicon glyphicon-ok"></span>'));
            }
          }
        }
      });
      $('#getConditionBtn').click(function(){
        var date = $('#date').val();
        if(date == undefined || date.length <= 0) {
          alert('날짜를 선택해주세요.');
          return;
        }
        var $days = $('ul.nav.nav-pills > li.days > a');
        var $ul = $days.parent().parent();
        $ul.find('li.active').removeClass('active');
        $ul.children().eq(3).addClass('active');
        var date = new Date(new Date(date).getTime() - (1000 * 60 * 60 * 24 * 3));
        $days.each(function(index, element) {
          $(element).text(date.toYYYY_MM_DD());
          date.setTime(date.getTime() + (1000 * 60 * 60 * 24));
        });
        $.ajax({
          url:'/res/conditionTotalAjax.do?bldgNo='+ $('select.bldg-select').val() +'&selectDate=' + $('#date').val(),
          dataType : 'json',
          success: conditionTotalProc,
          error: function(xhr,status,error){ alert(status); }
        });
      })
    });
    function conditionTotalProc(data) {
      var $tbody = $('.table-res-condition > tbody');
      $tbody.find('tr').remove();
      result = data.roomList;
      for(var i = 0; i < result.length; i++) {
        var room = result[i];
        $tbody.append( $('<tr data-roomno="'+room.roomNo+'"><td>'+room.roomNm+'</td><td>'+room.roomCapacity+'<td></td><td></td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>'+
        '<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>'));
      }
      var $trs = $('.table-res-condition > tbody > tr');
      
      $trs.find('span').remove();
      $trs.each(function(index, element) {
        for(var i = 0; i < result.length; i++) {
          var $element = $(element);
          if(result[i].roomNo == $element.data('roomno')) {
            var json = result[i];
            var $children = $element.children();
            $children.eq(0).text(json.roomNm);
            $children.eq(1).text(json.roomCapacity);
            $children = $element.children(':gt(1)');
            if(json.resDt != undefined && json.resDt.length) {
              var resDt = JSON.parse(json.resDt);
              for(var j = 0; j < resDt.length; j++) {
                var res = resDt[j];
                var startDt = new Date(res.startDt);
                var endDt = new Date(res.endDt);
                // var startHourIndex = (startDt.getHours() - 7) * 2;
                // var endHourIndex = startHourIndex + Math.floor((endDt.getTime() - startDt.getTime()) / (1000 * 60 * 30));
                var endHourIndex;
                var startHourIndex;
                if(startDt.diffDays(new Date($('ul.nav.nav-pills').find('.active').text()))) {
                  startHourIndex = 0;
                  if(endDt.diffDays(new Date($('ul.nav.nav-pills').find('.active').text()))) {
                    endHourIndex = $children.length;
                  }
                  else {
                    var dayStartDt = new Date(endDt.getTime());
                    dayStartDt.setHours(7);
                    dayStartDt.setMinutes(0);
                    endHourIndex = Math.floor((endDt.getTime() - dayStartDt.getTime()) / (1000 * 60 * 30));
                  }
                }
                else {
                  startHourIndex = (startDt.getHours() - 7) * 2;
                  if(startDt.getMinutes() == 30) {
                    startHourIndex++;
                  }
                  endHourIndex = startHourIndex + Math.floor((endDt.getTime() - startDt.getTime()) / (1000 * 60 * 30));
                }
                if(startHourIndex != 0) {
                  $children.eq(startHourIndex - 1).append($('<span class="glyphicon glyphicon-minus"></span>'));
                  $children.slice(0, startHourIndex - 1).append($('<span class="glyphicon glyphicon-ok"></span>'));
                }
                if(endHourIndex < $children.length) {
                  $children.eq(endHourIndex).append($('<span class="glyphicon glyphicon-minus"></span>'));
                  $children.slice(endHourIndex + 1, $children.length).append($('<span class="glyphicon glyphicon-ok"></span>'));
                }
                $children.slice(startHourIndex, endHourIndex).append($('<span class="glyphicon glyphicon-remove"></span>'));
              }
            }
            else {
              $children.append($('<span class="glyphicon glyphicon-ok"></span>'));
            }
            break;
          }
        }
      });
    }
	</script>