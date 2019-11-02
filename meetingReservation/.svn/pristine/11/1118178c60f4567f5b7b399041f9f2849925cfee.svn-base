<%--
subject    : 
author     : 차주현
date       : 2018. 6. 14.
description : 공지사항, 내 예약현황, 캘린더 메인 뷰
 
  [이름]   [수정일]     [내용]
  ----------------------------------------------------------
  
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
.container-fluid{
margin-bottom: 50px;
}
div.calendar-control-wrapper {
  width: 100%;
}
.panel-default {
  min-height: 167px;
  width: 600px;
  margin:30px;
}
.list-group-item {
  cursor: pointer;
}
.calendar {
    border: 3px solid #CC6600;
    border-radius: 6px;
    margin: 0 auto;
    width:80%;
}
.row{
	text-align: center;
}
#block{
	display:inline-block; 
	}
#center{
text-align: center;
}
.btn-group{
display:inline-block;
}
/* ---------------------------------------------------
    MEDIAQUERIES
----------------------------------------------------- */
@media (max-width: 768px) {
    .panel-default{
     width: 250px;
    }
    .btn-group{
     
    }
	.navbar-left {
    float: right;
	}
}
</style>
<script>
    angular.module('mwl.calendar.docs', ['mwl.calendar', 'ngAnimate', 'ui.bootstrap', 'colorpicker.module']);
    angular
      .module('mwl.calendar.docs') //you will need to declare your module with the dependencies ['mwl.calendar', 'ui.bootstrap', 'ngAnimate']
      .controller('KitchenSinkCtrl', function(moment, calendarConfig, calendarEventTitle) {
   	    var locale = window.navigator.userLanguage || window.navigator.language;
   	    moment.locale(locale);
        var vm = this;
    
        //These variables MUST be set as a minimum for the calendar to work
        vm.calendarView = 'month';
        vm.viewDate = new Date();
        vm.events = [ <c:forEach var="room" items="${roomList}"><c:forEach var="res" items="${room.reses}">{
			            title: '${room.roomNm}, 예약자 - ${res.empVO.empNm}',
			            color: calendarConfig.colorTypes.info, //${res.resState}
			            startsAt: moment().startOf('month').add(new Date("${res.startDt}").getDate() - 1, 'days').add(new Date("${res.startDt}").getHours(),'hours').add(new Date("${res.startDt}").getMinutes(),'minutes').toDate(),
			            endsAt: moment().startOf('month').add(new Date("${res.endDt}").getDate() - 1, 'days').add(new Date("${res.endDt}").getHours(),'hours').add(new Date("${res.endDt}").getMinutes(),'minutes').toDate()
	           },</c:forEach></c:forEach>];
        calendarEventTitle.monthView = function(event) {
            return event.title + ' (' + moment(event.startsAt).format('DD일 HH:mm') + " - " + moment(event.endsAt).format('DD일 HH:mm') + ')';
        };
        
        calendarEventTitle.monthViewTooltip = function(event) {
            return moment(event.startsAt).format('DD일 HH:mm') + " - " + moment(event.endsAt).format('DD일 HH:mm') + " : <br>" + event.title;
        };
        
        vm.cellIsOpen = true;
    
        vm.toggle = function($event, field, event) {
          $event.preventDefault();
          $event.stopPropagation();
          event[field] = !event[field];
        };
    
        vm.timespanClicked = function(date, cell) {
    
          if (vm.calendarView === 'month') {
            if ((vm.cellIsOpen && moment(date).startOf('day').isSame(moment(vm.viewDate).startOf('day'))) || cell.events.length === 0 || !cell.inMonth) {
              vm.cellIsOpen = false;
            } else {
              vm.cellIsOpen = true;
              vm.viewDate = date;
            }
          } else if (vm.calendarView === 'year') {
            if ((vm.cellIsOpen && moment(date).startOf('month').isSame(moment(vm.viewDate).startOf('month'))) || cell.events.length === 0) {
              vm.cellIsOpen = false;
            } else {
              vm.cellIsOpen = true;
              vm.viewDate = date;
            }
          }
    
        };
    
      })
      .config(['calendarConfig', function(calendarConfig) {
	    calendarConfig.dateFormatter = 'moment'; // use moment to format dates
	    calendarConfig.allDateFormats.moment.title.month = 'YYYY년 MMMM';
	    calendarConfig.allDateFormats.moment.title.day = 'MMM DD ddd';
	    calendarConfig.allDateFormats.moment.date.hour = 'a HH';
	    calendarConfig.allDateFormats.moment.date.time = 'a HH:mm';
	  }]);
      </script>
  <div class="row">
  <div id="block">
	<div class="col-lg-6 panel panel-default"  style="padding-left:1px;padding-right:1px;">
		<!-- Default panel contents -->
		<div class="panel-heading">내 예약현황</div>
		<!-- List group -->
		<ul class="list-group">
			<c:forEach var="res" items="${resList}">
				<li class="list-group-item" onclick="fn_goUrl('/res/condition.do')">${res.roomVO.roomNm} ${res.startDt} - ${res.endDt} <span class="label label-success"><c:choose>
																									<c:when test="${res.roomVO.roomType eq 1}">회의실</c:when>
																									<c:when test="${res.roomVO.roomType eq 2}">교육실</c:when>
																								</c:choose></span></li>
			</c:forEach>
		</ul>
	</div>
	<div class="col-lg-6 panel panel-default"  style="padding-left:1px;padding-right:1px;">
		<!-- Default panel contents -->
		<div class="panel-heading">공지사항</div>
		<!-- List group -->
		<ul class="list-group">
			<c:forEach var="notice" items="${noticeList}">
				<li class="list-group-item" title="${notice.content}" onclick='fn_goUrl("/board/notice.do?boardNo=${notice.boardNo}")'>${notice.subject}</li>
			</c:forEach>
		</ul>
	</div>
	</div>
  </div>
  <div ng-app="mwl.calendar.docs" class="calendar">
    <div ng-controller="KitchenSinkCtrl as vm">
        <h2 class="text-center">{{ vm.calendarTitle }}</h2>
        <div class="row">
          <div class="col-md-6 text-center calendar-control-wrapper">
          <div id="center">
              <div class="btn-group">
    
                <button
                  class="btn btn-primary"
                  mwl-date-modifier
                  date="vm.viewDate"
                  decrement="vm.calendarView">
                  Previous
                </button>
                <button
                  class="btn btn-default"
                  mwl-date-modifier
                  date="vm.viewDate"
                  set-to-today>
                  Today
                </button>
                <button
                  class="btn btn-primary"
                  mwl-date-modifier
                  date="vm.viewDate"
                  increment="vm.calendarView">
                  Next
                </button>
              </div>
              </div>
            </div>
        </div>
        <br>
        <mwl-calendar
          events="vm.events"
          view="vm.calendarView"
          view-title="vm.calendarTitle"
          view-date="vm.viewDate"
          day-view-start="09:00"
          day-view-end="22:59"
          day-view-split="30"
          day-view-segment-size="20"
          cell-modifier="vm.modifyCell(calendarCell)"
          on-timespan-click="vm.timespanClicked(calendarDate, calendarCell)"
          on-date-range-select="vm.rangeSelected(calendarRangeStartDate, calendarRangeEndDate)">
        </mwl-calendar>
      </div>
    </div>