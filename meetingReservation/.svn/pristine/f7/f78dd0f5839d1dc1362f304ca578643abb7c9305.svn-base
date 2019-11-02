function isBldgSelected() {

}

function isRoomSelected() {

}
function isDtSelected() {
  var json = getResJson();
  if(json.date.length && json.date[0] != undefined && json.date[0].startDt != undefined && json.date[0].endDt != undefined) {
    return true;
  }
  return false;
}

function getResJson() {
  var json = JSON.parse(sessionStorage.getItem("ResJson"));
  if(json == undefined) {
    json = {
      "emp": [],
      "dept": [],
      "bldg": {},
      "room": {},
      "date": [],
      "item": []
    };
    setResJson(json);
  }
  return json;
}
function setResJson(json) {
  //유효성 검사
  //
  sessionStorage.setItem('ResJson', JSON.stringify(json));
}
Date.prototype.diffDays = function(date) {
  dt = new Date(date);
  return Math.floor((Date.UTC(dt.getFullYear(), dt.getMonth(), dt.getDate()) - Date.UTC(this.getFullYear(), this.getMonth(), this.getDate()) ) /(1000 * 60 * 60 * 24));
}
Date.prototype.diffHours = function(date) {
  dt = new Date(date);
  return Math.floor((date - this) /(1000 * 60 * 60));
}
Date.prototype.diff30Minutes = function(date) {
	  dt = new Date(date);
	  return Math.floor((date - this) /(1000 * 60 * 30));
}
Date.prototype.addMinutes = function(number) {
  dt = new Date(this);
  dt.setMinutes(dt.getMinutes() + number);
  return dt;
}
Date.prototype.toYYYY_MM_DD = function() {
	var d = new Date(this), month = '' + (d.getMonth() + 1), day = '' + d.getDate(), year = d.getFullYear();
	if (month.length < 2) month = '0' + month;
	if (day.length < 2) day = '0' + day;
	return [year, month, day].join('-');

}
// TODO json validator 만들기
function reservationValidator(separator) {
	//상세 예약 전 사항 체크
	var json = getResJson();
    if(!json.date.length) {
    	console.log('날짜 데이터가 존재하지 않습니다.');
        return false;
    }
    if(json.room.id == undefined) {
      console.log('회의실/교육실 데이터가 존재하지 않습니다.');
      return false;
    }
    if(json.bldg.id == undefined) {
      console.log('근무지 데이터가 존재하지 않습니다.');
      return false;
    }
    if(!json.emp.length && !json.dept.length) {
      console.log('참여직원 데이터가 존재하지 않습니다.');
      return false;
    }
	if(!separator) {
		//상세 예약 종료시
	}
	return true;
}