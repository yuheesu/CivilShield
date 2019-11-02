<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<style>
body {
	font-family: 'Poppins', sans-serif;
	/* background: #fafafa; */
}

p {
	font-family: 'Poppins', sans-serif;
	font-size: 1.1em;
	font-weight: 300;
	line-height: 1.7em;
	color: #999;
}

.navbar {
	padding: 15px 10px;
	/* background: #fff; */
	border: none;
	border-radius: 0;
	margin-bottom: 40px;
	box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
}

.navbar-btn {
	box-shadow: none;
	outline: none !important;
	border: none;
}

.line {
	width: 100%;
	height: 1px;
	border-bottom: 1px dashed #ddd;
	margin: 40px 0;
}

i, span {
	display: inline-block;
}

/* ---------------------------------------------------
    SIDEBAR STYLE
----------------------------------------------------- */
.sidebar-form {
	margin: 20px;
}

.wrapper {
	min-height: 100vh;
	margin: 0 auto;
	display: flex;
	align-items: stretch;
}

.flex-container {
	display: flex;
}

.sidebar-header {
	cursor: pointer;
}

nav.sidebar h3 {
	color: #fff;
}

nav.sidebar {
	/* min-width: 700px;
    max-width: 700px; */
	position: relative;
	min-width: 60vw;
	max-width: 60vw;
	/*     min-height:120vw; */
	/* background: #7386D5; */
	background: #ebebe32e;
	transition: all 0.3s;
	border: #e1e1e1 .5px solid;
}

nav.sidebar.active {
	min-width: 80px;
	max-width: 80px;
	text-align: center;
}

nav.sidebar.active .sidebar-header .with-label, nav.sidebar.active .sidebar-form
	{
	transition: all 0.3s;
	display: none;
}
/* , nav.sidebar.active .CTAs */
nav.sidebar.active .sidebar-header .without-label {
	transition: all 0.3s;
	display: block;
}

nav.sidebar .sidebar-header {
	padding: 20px;
	background: #00999994;
	height: 80px;
	text-align: center;
}

nav.sidebar .sidebar-header .without-label {
	display: none;
	font-size: 1.8em;
}

div.collapse.list-group {
	transition: all 0.3s;
	padding-top: 10px;
}

div.emp-group {
	max-height: 300px;
	overflow-y: scroll;
}

div.emp-result-group {
	position: absolute;
	bottom: 0;
	width: 50vw;
	min-height: 200px;
	max-height: 200px;
	overflow-y: scroll;
	flex-grow: 1;
}

div.emp-group a div.collapse.list-group {
	max-height: 300px;
	overflow-y: scroll;
}

div.calendar-control-wrapper {
	width: 100%;
}
/* ---------------------------------------------------
    CALENDAR STYLE
----------------------------------------------------- */
.cal-reset-btn {
	position: absolute;
    left: 10px;
}
.day-calendar {
	height: 20px !important;
}

.month-calendar {
	cursor: no-drop;
	background-color: #aaa;
	/* pointer-events : none; */
}

.can-reservation {
	background-color: #0e05;
	/* pointer-events : none; */
}

.cannot-reservation {
	cursor: no-drop;
	background-color: #e005;
	/* pointer-events : none; */
}

.panel-success {
	left: 8%;
}

.panel-success>.panel-heading {
	color: #ffffff;
	background-color: #CC6600;
	border-color: #d6e9c6;
}
/* ---------------------------------------------------
    MEDIAQUERIES
----------------------------------------------------- */
@media ( max-width : 768px) {
	div.emp-group {
		max-height: 250px;
		overflow-y: scroll;
	}
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
	/* nav.sidebar {
        min-width: 80px;
        max-width: 80px;
        text-align: center;
        margin-left: -80px !important ;
    }
    nav.sidebar.active {
        margin-left: 0 !important;
    }

    nav.sidebar .sidebar-header .with-label, nav.sidebar.active .sidebar-form {
        display: none;
    }

    nav.sidebar .sidebar-header .without-label {
        display: block;
    }
    nav.sidebar {
        margin-left: 0;
    }
    #sidebarEmp span {
        display: none;
    } */
}
</style>
<script type="text/javascript">
            function onClickEmp(ev) {
                ev.preventDefault();
                var $target = $(ev.target);
                if($target.parent('a').length) {
                  $target = $target.parent('a');
                }
                var data = $target.data();
                var json = getResJson();
                if(data.type == '부서') {
                  //결과 리스트에서 부서 번호를 갖는 사원을 전부 제거 후 부서 넣기
                  //json에서 부서 번호를 갖는 사원 전부 제거 후 부서 넣기
                  for(var i = 0; i < json.dept.length; i++) {
                    if(json.dept[i].id == data.id) {
                      json.dept.splice(i, 1);
                    }
                  }
                }
                else if(data.type == '사원') {
                  for(var i = 0; i < json.emp.length; i++) {
                    if(json.emp[i].id == data.id) {
                      json.emp.splice(i, 1);
                    }
                  }
                }
                setResJson(json);
                $target.remove();
            }
            function onClickBldgRoom(ev) {
                var $target = $(ev.target);
                if($target.parent('a').length) {
                  $target = $target.parent('a');
                }
                var data = $target.data();
                /**
                  * TODO line.213 선택됐다는 것 알려주고, 다음 탭으로 이동
                 */
                var $a = $('<a href="#'+data.id+'" class="list-group-item">'+ data.name +' <span class="label label-success">'+ data.type +'</span></a>');
                $a.data('type', data.type);
                $a.data('id', data.id);
                $a.data('name', data.name);
                var $parent;
                var json = getResJson();
                if(data.type == '근무지') {
                  json.bldg = data;
                  json.room = {};
                  json.item = [];
                  json.date = [];
                  angular.element($('#calendarCtrl')).scope().vm.selectedEventIndex = [];
                  $parent = $('.bldg-result-group');
                  $('.room-result-group a:last-child').remove();
                  $a.data('roomCount', data.roomCount);
                }
                else if(data.type == '회의실' || data.type == '교육실') {
                  json.room = data;
                  json.item = [];
                  json.date = [];
                  angular.element($('#calendarCtrl')).scope().vm.selectedEventIndex = [];
                  $parent = $('.room-result-group');
                  $a.data('roomCapacity', data.roomCapacity);
                  $a.data('useNetworkYn', data.useNetworkYn);
                }
                else {
                  //데이터 오류
                }
                if($parent != undefined) {
                  setResJson(json);
                  var $child = $parent.children().eq(1);
                  if($child.length) {
                    $child.remove();
                  }
                  $parent.append($a);
                }

            }
            function allowDrop(ev) {
                ev.preventDefault();
            }

            function drag(ev) {
                ev.dataTransfer.setData("text/json", JSON.stringify($(ev.target).data()));
            }

            function drop(ev) {
                ev.preventDefault();
                var $target = $(ev.target);
                if($target.hasClass('dropable') || $target.closest('div.dropable').length) {
                  if(!$target.hasClass('dropable')) {
                    $target = $target.closest('div.dropable');
                  }
                  var data = JSON.parse(ev.dataTransfer.getData("text/json"));
                  var $a;

                  var exist = $target.find('a:data("id")').filter(function () {
                      return $(this).data("id") == data.id;
                  });
                  if(!exist.length) {
                    var json = getResJson();
                    if(data.type == '부서') {
                      //결과 리스트에서 부서 번호를 갖는 사원을 전부 제거 후 부서 넣기
                      //json에서 부서 번호를 갖는 사원 전부 제거 후 부서 넣기
                      if(json.emp.length) {
                        for(var i = json.emp.length - 1; i >= 0; i--) {
                          if(json.emp[i].deptNo == data.id) {
                            json.emp.splice(i, 1);
                          }
                        }
                        var emps = $target.find('a:data("id")').filter(function () {
                            return ($(this).data("type") == '사원') && ($(this).data("deptNo") == data.id);
                        });
                        emps.remove();
                      }
                      json.dept.push(data);
                    }
                    else if(data.type == '사원') {
                      var dept = $target.find('a:data("id")').filter(function () {
                            return ($(this).data("type") == '부서') && ($(this).data("id") == data.deptNo);
                      });
                      if(dept.length) {
                        return;
                      }
                      json.emp.push(data);
                    }
                    setResJson(json);
                    $a = $('<a href="#" class="list-group-item'+ ((data.type=='부서')?' list-group-item-info':'') +'" onclick="onClickEmp(event)">'+data.name+((data.type=='사원')?' - ' + data.deptNm:'') +
                            ' <span class="label label-'+ ((data.type=='부서')?'danger':'success') +'">'+data.type+'</span></a>');
                    $a.data('type', data.type);
                    $a.data('id', data.id);
                    $a.data('name', data.name);
                    if(data.type=='사원') {
                      $a.data('deptNo', data.deptNo);
                      $a.data('deptNm', data.deptNm);
                    }
                  }
                  if($a != undefined && $a.length) {
                    $($target).append($a);
                  }
                }
            }
            function empSearchProc(data) {
              var $div = $('div.emp-group');
              $div.empty();
              
              var $li;
              var deptList = data.deptData;
              for(var i = 0; i < deptList.length; i++) {
                var dept = deptList[i];
                //dept for start
                $li = $('<a href="#'+dept.deptNo+'" class="list-group-item list-group-item-info" draggable="true" ondragstart="drag(event)" data-toggle="collapse" aria-expanded="false">'+
                            '<span class="badge">'+dept.empList.length+'</span>'+dept.deptNm+' <span class="label label-danger">부서</span></a>');
                $li.data('type', '부서');
                $li.data('id', dept.deptNo);
                $li.data('name', dept.deptNm);
                var $listDiv = $('<div class="collapse list-group" id="'+dept.deptNo+'"></div>');
                for(var j = 0; j < dept.empList.length; j++) {
                  var emp = dept.empList[j];
                  //emp for start
                  var $a = $('<a href="#'+dept.deptNo+'" class="list-group-item" draggable="true" ondragstart="drag(event)">'+emp.empNm+' <span class="label label-success">사원</span></a>');
                  $a.data('type', '사원');
                  $a.data('id', emp.empNo);
                  $a.data('name', emp.empNm);
                  $a.data('deptNo', dept.deptNo);
                  $a.data('deptNm', dept.deptNm);
                  $listDiv.append($a);
                }
                //emp for end
                $li.append($listDiv);
                $div.append($li);
              }
              //dept for end

              var empList = data.empData;
              for(var i = 0; i < empList.length; i++) {
                var emp = empList[i];
                //emp for start
                var $li = $('<a href="#" class="list-group-item" draggable="true" ondragstart="drag(event)">'+emp.empNm+' - '+emp.deptNm+' <span class="label label-success">사원</span></a>');
                $li.data('type', '사원');
                $li.data('id', emp.empNo);
                $li.data('name', emp.empNm);
                $li.data('deptNo', emp.deptNo);
                $li.data('deptNm', emp.deptNm);
                $div.append($li);
              }
              //emp for end
            }
            
            function bldgSearchProc(data) {
              var $div = $('div.bldg-group');
              $div.empty();
              
              var $li;
              var bldgList = data.bldgData;
              for(var i = 0; i < bldgList.length; i++) {
                var bldg = bldgList[i];
                //bldg for start
                $li = $('<a href="#" class="list-group-item list-group-item-info" onclick="onClickBldgRoom(event)">'+bldg.bldgNm+'<span class="label label-success">GS ITM</span></a>');
                // $li.append($('<span class="badge">'+bldg.roomCount+'</span>'));
                $li.append($('<span class="glyphicon glyphicon-plus-sign" style="font-size:20px; display:block; float:right;"></span>'));
                $li.data('type', '근무지');
                $li.data('id', bldg.bldgNo);
                $li.data('name', bldg.bldgNm);
                $li.data('roomCount', bldg.roomCount);
                $div.append($li);
              }
              //bldg for end
            }

            function roomSearchProc(data) {
              var $div = $('div.room-group');
              $div.empty();
              
              var json = getResJson();
              var $li;
              var roomList = data.roomData;
              for(var i = 0; i < roomList.length; i++) {

                var room = roomList[i];
                //room for start
                var roomType = '';
                if(room.roomType == '1') {
                  roomType = '회의실';
                }
                else if(room.roomType == '2') {
                  roomType = '교육실';
                }
                $li = $('<a href="#" class="list-group-item list-group-item-info" onclick="onClickBldgRoom(event)">'+room.roomNm+' - GS ITM <span class="label label-success">'+roomType+'</span></a>');
                $li.append($('<span class="glyphicon glyphicon-plus-sign" style="font-size:20px; display:block; float:right;"></span>'));
                $li.data('type', roomType);
                $li.data('id', room.roomNo);
                $li.data('name', room.roomNm);
                $li.data('roomType', room.roomType);
                $li.data('roomCapacity', room.roomCapacity);
                $li.data('useNetworkYn', room.useNetworkYn);
                $div.append($li);
              }
              //room for end
            }
            function dateReset() {
                var json = getResJson();
                json.date = [];
                setResJson(json);
                location.href = '#calendar'
                var $scope = angular.element($('#calendarCtrl')).scope();
                $scope.vm.selectedEventIndex = [];
                $scope.vm.tempEventIndex = [];
                $scope.vm.eventClear();
                $.ajax({
                  url:'/res/resSearch.do?roomNo=' + json.room.id + '&month=' + new Date().getMonth(),
                  dataType : 'json',
                  success: $scope.vm.resSearchProc,
                  error: function(xhr,status,error){ alert(status); }
                });
            	  // location.reload();
            }
			function initialJob() {
				var json = getResJson();
				if(json.emp.length || json.dept.length) {
					var $target = $('div.emp-result-group.dropable');
					for(var i = 0; i < json.emp.length; i++) {
						var data = json.emp[i];
						var $a;
		                var exist = $target.find('a:data("id")').filter(function () {
		                    return $(this).data("id") == data.id;
		                });
						if(!exist.length) {
							var dept = $target.find('a:data("id")').filter(function () {
						          return ($(this).data("type") == '부서') && ($(this).data("id") == data.deptNo);
						    });
						    if(dept.length) {
						      return;
						    }
							$a = $('<a href="#" class="list-group-item" onclick="onClickEmp(event)">'+data.name+ ' - ' +data.deptNm+
							        ' <span class="label label-success">'+data.type+'</span></a>');
							$a.data('type', data.type);
							$a.data('id', data.id);
							$a.data('name', data.name);
						    $a.data('deptNo', data.deptNo);
						    $a.data('deptNm', data.deptNm);
						}
						if($a != undefined && $a.length) {
						  $($target).append($a);
						}
					}
					for(var i = 0; i < json.dept.length; i++) {
						var data = json.dept[i];
		                var $a;
		                var exist = $target.find('a:data("id")').filter(function () {
		                      return $(this).data("id") == data.id;
		                });
						if(!exist.length) {
							if(json.emp.length) {
								for(var i = json.emp.length - 1; i >= 0; i--) {
									if(json.emp[i].deptNo == data.id) {
										json.emp.splice(i, 1);
									}
								}
								var emps = $target.find('a:data("id")').filter(function () {
								    return ($(this).data("type") == '사원') && ($(this).data("deptNo") == data.id);
								});
								emps.remove();
						    }
						}
						$a = $('<a href="#" class="list-group-item list-group-item-info" onclick="onClickEmp(event)">'+data.name+
						        ' <span class="label label-danger">'+data.type+'</span></a>');
						$a.data('type', data.type);
						$a.data('id', data.id);
						$a.data('name', data.name);
						if($a != undefined && $a.length) {
							$($target).append($a);
						}
					}
				}
				//참여자 끝
				if(json.bldg.id) {
					var data = json.bldg;
	                var $a = $('<a href="#'+data.id+'" class="list-group-item">'+ data.name +' <span class="label label-success">'+ data.type +'</span></a>');
	                $a.data('type', data.type);
	                $a.data('id', data.id);
	                $a.data('name', data.name);
	                var $parent;
	                if(data.type == '근무지') {
	                  $parent = $('.bldg-result-group');
	                  $a.data('roomCount', data.roomCount);
	                }
	                if($parent != undefined) {
	                  var $child = $parent.children().eq(1);
	                  if($child.length) {
	                    $child.remove();
	                  }
	                  $parent.append($a);
	                }
				}
				if(json.room.id) {
					var data = json.room;
          var $a = $('<a href="#'+data.id+'" class="list-group-item">'+ data.name +' <span class="label label-success">'+ data.type +'</span></a>');
          $a.data('type', data.type);
          $a.data('id', data.id);
          $a.data('name', data.name);
          var $parent;
          if(data.type == '회의실' || data.type == '교육실') {
            $parent = $('.room-result-group');
            $a.data('roomCapacity', data.roomCapacity);
            $a.data('useNetworkYn', data.useNetworkYn);
          }
          if($parent != undefined) {
            var $child = $parent.children().eq(1);
            if($child.length) {
              $child.remove();
            }
            $parent.append($a);
          }
        }
			}
            $(document).ready(function () {
                // sessionStorage.clear();
                initialJob();
                $.ajax({
                        url:'/res/empSearch.do?searchText=',
                        dataType : 'json',
                        success: empSearchProc,
                        error: function(xhr,status,error){ alert(status); }
                });
                // ===== Scroll to Top ==== 
                $('.sidebar-header').on('click', function () {
                  //TODO: 사원이면 상관 무, 근무지도 상관 무, 회의실/교육실은 근무지 먼저 선택이 필요, 날짜는 이전의 전부가 필요
                  var id = $(this).attr('id');
                  var json = getResJson();
                  
                  switch (id) {
                    case 'calendar':
                      if(json.room.id == undefined) {
                        window.alert('회의실/교육실을 먼저 선택해주세요.');
                        return;
                      }
                      else {
                        var $scope = angular.element($('#calendarCtrl')).scope();
                        $scope.vm.eventClear();
                        $.ajax({
                          url:'/res/resSearch.do?roomNo=' + json.room.id + '&month=' + new Date().getMonth(),
                          dataType : 'json',
                          success: $scope.vm.resSearchProc,
                          error: function(xhr,status,error){ alert(status); }
                        });
                      }
                    case 'room':
                      if(json.bldg.id == undefined) {
                        window.alert('근무지를 먼저 선택해주세요.');
                        return;
                      }
                      else {
                        var json = getResJson();
                        $.ajax({
                              url:'/res/roomSearch.do?searchText=&bldgNo=' + json.bldg.id,
                              dataType : 'json',
                              success: roomSearchProc,
                              error: function(xhr,status,error){ alert(status); }
                        });
                      }
                    case 'bldg':
                      if(!json.emp.length && !json.dept.length) {
                        window.alert('참여직원을 먼저 선택해주세요.');
                        return;
                      }
                    case 'emp':
                      break;
                  }
                  $('nav.sidebar').each(function(index, element) {
                    $(element).addClass('active');
                  });
                  $(this).parent().toggleClass('active');
                });
                $('#emp-search-input').on('keydown', function(ev) {
                    if(ev.keyCode == 13) {
                      $.ajax({
                        url:'/res/empSearch.do?searchText=' + $(this).val(),
                        dataType : 'json',
                        success: empSearchProc,
                        error: function(xhr,status,error){ alert(status); }
                      });
                    }
                });
                $('#emp-search-input').on('input', function(val) {
                  $.ajax({
                        url:'/res/empSearch.do?searchText=' + $(this).val(),
                        dataType : 'json',
                        success: empSearchProc
                  });
                });
                $('#bldg-search-input').on('input', function() {
                  var $div = $('div.bldg-group');
                  $div.empty();
                  $.ajax({
                        url:'/res/bldgSearch.do?searchText=' + $(this).val(),
                        dataType : 'json',
                        success: bldgSearchProc,
                        error: function(xhr,status,error){ alert(status); }
                  });
                });
                $('#room-search-input').on('input', function() {
					        var json = getResJson();
	                $.ajax({
	                      url:'/res/roomSearch.do?searchText=' + $(this).val() + '&bldgNo=' + json.bldg.id,
	                      dataType : 'json',
	                      success: roomSearchProc,
	                      error: function(xhr,status,error){ alert(status); }
	                });
                });
            });
            window.onload = function() {
                if($('#calendar:target').length) {
                	console.log('aaa');
                	$('#calendar.sidebar-header').trigger('click');
                }
            }
            function goDetail() {
              var json = getResJson();
              if(json.date.length) {
                fn_goUrl('/res/detail.do');
              }
              else {
                alert('날짜를 선택해주세요.');
              }
            }
        </script>
<script> // Calendar Javascript
angular.module('mwl.calendar.docs', ['mwl.calendar', 'ngAnimate', 'ui.bootstrap', 'colorpicker.module']);
angular
	.module('mwl.calendar.docs')
	.controller('KitchenSinkCtrl', function ($scope, moment, calendarConfig, calendarEventTitle) {
	var locale = window.navigator.userLanguage || window.navigator.language;
    moment.locale(locale);

    var vm = this;

    vm.calendarView = 'month';
    vm.viewDate = new Date();
    // TODO : jsp jstl 적용해서 반복. 월 예약현황 등록
    vm.events = [];
    
    vm.toggle = function ($event, field, event) {
      $event.preventDefault();
      $event.stopPropagation();
      event[field] = !event[field];
    };

    calendarEventTitle.monthViewTooltip = function(event) {
		return moment(event.startsAt).format('DD일 HH:mm') + " - " + moment(event.endsAt).format('DD일 HH:mm') + " : <br>" + event.title;
    };
    // vm.calendarCtrl.dateClicked = function(date) {
    //   return '';
    // }
    vm.timespanClicked = function (date, cell) {
		if (vm.calendarView === 'month') {
			var now = new Date();
			now.setMilliseconds(0);
			now.setSeconds(0);
	        now.setMinutes(0);
	        now.setHours(0);

        if(cell.cssClass === undefined && now <= date) {
          var events = cell.events;
          for(var i = 0; i < events.length; i++) {
            events[i].startsAt.getHours();
          }
          vm.viewDate = date;
          vm.calendarView = 'day';
        }
			else if(cell.cssClass === 'can-reservation') {
				var json = getResJson();
				var startDt = new Date(json.date[0].startDt);
				var endDt = new Date(json.date[0].endDt);
				
				var cellDate = new Date(cell.date);
				startDt.setFullYear(cellDate.getFullYear(), cellDate.getMonth(), cellDate.getDate());
				endDt.setFullYear(cellDate.getFullYear(), cellDate.getMonth(), cellDate.getDate());
				endDt.setDate(endDt.getDate() + new Date(json.date[0].startDt).diffDays(json.date[0].endDt));
				if(vm.canReservation(startDt, endDt, cellDate)) {
					vm.addReservation(startDt, endDt);
				}
        	}
		}
		else if(vm.calendarView === 'day') {
			if(!vm.selectedEventIndex.length) {
				if(vm.firstDateClicked == undefined) {
					vm.firstDateClicked = new Date(date);
					vm.tempEventIndex.push(vm.events.push({
					title: '장기예약 시작일시',
					startsAt: vm.firstDateClicked,
					endsAt: vm.firstDateClicked.addMinutes(30),
					color: calendarConfig.colorTypes.important
				}));
	            vm.lastDateClicked = undefined;
	          }
	        else if(vm.lastDateClicked == undefined){
	            if(vm.firstDateClicked.diffDays(date)) {
	              //
	              vm.lastDateClicked = new Date(date);
	              vm.tempEventIndex.push(vm.events.push({
	                title: '장기예약 종료일시',
	                startsAt: vm.lastDateClicked,
	                endsAt: vm.lastDateClicked.addMinutes(30),
	                color: calendarConfig.colorTypes.important
	              }));
	              if(vm.canReservation(vm.firstDateClicked, vm.lastDateClicked)) {
	                vm.addReservation(vm.firstDateClicked, vm.lastDateClicked);
	              }
	              else {
	                vm.clearTempEvent();
	                vm.firstDateClicked = undefined;
	                vm.lastDateClicked = undefined;
	                vm.calendarView = 'month';
	                window.alert('선택한 일자 내에 예약이 존재합니다.');
	              }
	            }
	          }
    	  }
      }
    };
    vm.addReservation = function(startDt, endDt) {
      var json = getResJson();
      var dateJson = {
        "startDt": startDt,
        "endDt": endDt
      }
      json.date.push(dateJson);
      setResJson(json);

      vm.clearTempEvent();
      vm.calendarView === 'month';
      vm.selectedEventIndex.push(vm.events.push({
        title: '예약 선택일자',
        startsAt: dateJson.startDt,
        endsAt: dateJson.endDt,
        color: calendarConfig.colorTypes.important
      }));
    }
    vm.selectedEventIndex = [];
    vm.tempEventIndex = [];
    vm.clearTempEvent = function() {
      for(var i = vm.tempEventIndex.length-1; i >= 0; i--) {
        vm.events.splice(vm.tempEventIndex[i] - 1, 1);
      }
      vm.tempEventIndex = [];
    }
    vm.canReservation = function(startDt, endDt, viewDate) {
      if(viewDate === undefined) {
        viewDate = new Date(startDt);
      }
      var startOffset = new Date(viewDate);
      var endOffset = new Date(startOffset);
      endOffset.setDate(endOffset.getDate() + startDt.diffDays(endDt));
      startOffset.setHours(startDt.getHours() - 1);
      startOffset.setMinutes(startDt.getMinutes());
      endOffset.setHours(endDt.getHours() + 1)
      endOffset.setMinutes(endDt.getMinutes());

      if(vm.selectedEventIndex[0] != undefined) {
        var dt = vm.events[vm.selectedEventIndex[0] - 1].startsAt;
        if(dt.diffDays(endOffset) >= new Date(dt.getFullYear(), dt.getMonth(), 0).getDate()) {
          return false;
        }
      }
      var result = true;
      for(var i = 0; i < vm.events.length; i++) {
        if(vm.tempEventIndex.indexOf(i+1) != -1) {
          continue;
        }
        if(vm.events[i].startsAt < endOffset && vm.events[i].endsAt > startOffset) {
          result = false;
        }
      }
      return result;
    }

    vm.rangeSelected = function(startDate, endDate) {
      if(startDate.diffHours(endDate) >= 1 && !vm.selectedEventIndex.length && new Date().diffDays(startDate) >= 0) {
        if(vm.canReservation(startDate, endDate, vm.viewDate)) {
          vm.addReservation(startDate, endDate);
        }
      }
    };
    vm.modifyCell = function(cell) {
      if (vm.calendarView === 'month') {
        var now = new Date();
        now.setMilliseconds(0);
        now.setSeconds(0);
        now.setMinutes(0);
        now.setHours(0);
        if(now <= cell.date && isDtSelected()) {
          var json = getResJson();
          var startDt = new Date(json.date[0].startDt);
          var endDt = new Date(json.date[0].endDt);
          var cellDate = new Date(cell.date);

          if(vm.canReservation(startDt, endDt, cellDate)) {
            cell.cssClass = 'can-reservation';
          }
          else {
            cell.cssClass = 'cannot-reservation';
          }
        }
        else if(now > cell.date){
          cell.cssClass = 'month-calendar';
        }
      } else if (vm.calendarView === 'day') {
        cell.cssClass = 'day-calendar';
      }
    }
	  vm.initialize = function() {
	    var json = getResJson();
	    if(json.date.length) {
        vm.clearTempEvent();
        vm.calendarView === 'month';
        for(var i = 0; i < json.date.length; i++) {
          vm.selectedEventIndex.push(vm.events.push({
            title: '예약 선택일자',
            startsAt: new Date(json.date[i].startDt),
            endsAt: new Date(json.date[i].endDt),
            color: calendarConfig.colorTypes.important
          }));
        }
      }
    }
    vm.eventClear = function() {
      vm.events = [];
      vm.initialize();
    }
    vm.resSearchProc = function(data) {
      var resList = data.resData;
      for(var i = 0; i < resList.length; i++) {
        var res = resList[i];
        vm.events.push({
			            title: '예약자 - ' + res.empNm,
			            color: calendarConfig.colorTypes.info, //${res.resState}
			            startsAt: moment().startOf('month').add(new Date(res.startDt).getDate() - 1, 'days').add(new Date(res.startDt).getHours(),'hours').add(new Date(res.startDt).getMinutes(),'minutes').toDate(),
			            endsAt: moment().startOf('month').add(new Date(res.endDt).getDate() - 1, 'days').add(new Date(res.endDt).getHours(),'hours').add(new Date(res.endDt).getMinutes(),'minutes').toDate()
	      });
        calendarEventTitle.monthView = function(event) {
            return event.title + ' (' + moment(event.startsAt).format('DD일 HH:mm') + " - " + moment(event.endsAt).format('DD일 HH:mm') + ')';
        };
      }
      $scope.$apply();
    }
  }).config(['calendarConfig', function(calendarConfig) {

    calendarConfig.dateFormatter = 'moment'; // use moment to format dates
    calendarConfig.allDateFormats.moment.title.month = 'YYYY년 MMMM';
    calendarConfig.allDateFormats.moment.title.day = 'MMM DD ddd';
    calendarConfig.allDateFormats.moment.date.hour = 'a HH';
    calendarConfig.allDateFormats.moment.date.time = 'a HH:mm';

  }]);
</script>
<div class="content-fluid flex-container">
	<!-- Sidebar Holder -->
	<div class="wrapper">
		<nav class="sidebar">
			<div id="emp" class="sidebar-header">
				<h3 class="glyphicon glyphicon-user with-label">참여직원</h3>
				<h3 class="glyphicon glyphicon-user without-label"></h3>
			</div>
			<!-- sidebar body -->
			<form class="sidebar-form">
				<div class="form-group">
					<label for="emp-search-input" class="sr-only">찾기</label>
					<div class="input-group">
						<input class="form-control" type="search"
							placeholder="직원명이나 부서명을 입력하세요" id="emp-search-input">
						<div class="input-group-addon">
							<span class="glyphicon glyphicon-search"></span>
						</div>
					</div>
					<div class="list-group search-result-group emp-group"></div>
					<div
						class="panel panel-success list-group search-result-group emp-result-group dropable"
						ondrop="drop(event)" ondragover="allowDrop(event)">
						<div class="panel-heading">참여자</div>
					</div>
				</div>
			</form>
		</nav>
		<nav class="sidebar active">
			<div id="bldg" class="sidebar-header">
				<h3 class="glyphicon glyphicon-home with-label">근무지</h3>
				<h3 class="glyphicon glyphicon-home without-label"></h3>
			</div>
			<!-- sidebar body -->
			<form class="sidebar-form">
				<div class="form-group">
					<label for="bldg-search-input" class="sr-only">찾기</label>
					<div class="input-group">
						<input class="form-control" type="search"
							placeholder="근무지명을 입력하세요" id="bldg-search-input">
						<div class="input-group-addon">
							<span class="glyphicon glyphicon-search"></span>
						</div>
					</div>
					<div class="list-group search-result-group bldg-group"></div>
					<div
						class="panel panel-success list-group search-result-group bldg-result-group">
						<div class="panel-heading">근무지</div>
					</div>
				</div>
			</form>
		</nav>
		<nav class="sidebar active">
			<div id="room" class="sidebar-header">
				<h3 class="glyphicon glyphicon-briefcase with-label">회의실</h3>
				<h3 class="glyphicon glyphicon-briefcase without-label"></h3>
			</div>
			<!-- sidebar body -->
			<form class="sidebar-form">
				<div class="form-group">
					<label for="room-search-input" class="sr-only">찾기</label>
					<div class="input-group">
						<input class="form-control" type="search"
							placeholder="회의실명을 입력하세요" id="room-search-input">
						<div class="input-group-addon">
							<span class="glyphicon glyphicon-search"></span>
						</div>
					</div>
					<div class="list-group search-result-group room-group"></div>
					<div
						class="panel panel-success list-group search-result-group room-result-group">
						<div class="panel-heading">회의실/교육실</div>
					</div>
				</div>
			</form>
		</nav>
		<nav class="sidebar active">
			<div id="calendar" class="sidebar-header">
				<h3 class="glyphicon glyphicon-calendar with-label">날짜</h3>
				<h3 class="glyphicon glyphicon-calendar without-label"></h3>
			</div>
			<!-- sidebar body -->
			<div class="sidebar-form" ng-app="mwl.calendar.docs">
				<!-- <div class="form-group">
              <label for="example-search-input" class="sr-only">찾기</label>
              <div class="input-group">
                <input class="form-control" type="search" placeholder="직원명이나 부서명을 입력하세요" id="example-search-input">
                <div class="input-group-addon"><span class="glyphicon glyphicon-search"></span></div>
              </div>
            </div> -->
				<div id="calendarCtrl" ng-controller="KitchenSinkCtrl as vm">
					<div class="row">
						<div class="col-md-6 text-center calendar-control-wrapper">
							<div class="row">
								<h2 class="text-center">{{ vm.calendarTitle }}</h2>
							</div>
							<div class="row">
								<button type="button" class="btn btn-default cal-reset-btn"
									onclick="dateReset()">
									<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
									날짜 초기화하기
								</button>
								<div class="btn-group">
									<button class="btn btn-primary" mwl-date-modifier
										date="vm.viewDate" decrement="vm.calendarView">
										Previous</button>
									<button class="btn btn-default" mwl-date-modifier
										date="vm.viewDate" set-to-today>Today</button>
									<button class="btn btn-primary" mwl-date-modifier
										date="vm.viewDate" increment="vm.calendarView">Next</button>
								</div>
							</div>
						</div>
					</div>
					<br>
					<mwl-calendar events="vm.events" view="vm.calendarView"
						view-title="vm.calendarTitle" view-date="vm.viewDate"
						day-view-start="07:00" day-view-end="22:59" day-view-split="30"
						day-view-segment-size="20"
						cell-modifier="vm.modifyCell(calendarCell)"
						cell-auto-open-disabled="true"
						on-timespan-click="vm.timespanClicked(calendarDate, calendarCell)"
						on-date-range-select="vm.rangeSelected(calendarRangeStartDate, calendarRangeEndDate)">
					</mwl-calendar>
					<center>
						<label class="btn btn-primary" ng-model="vm.calendarView"
							uib-btn-radio="'month'" style="margin: 5px">확인</label> <label
							class="btn btn-primary" onclick="goDetail()" style="margin: 5px">다음</label>
					</center>
				</div>
			</div>
		</nav>
	</div>
</div>