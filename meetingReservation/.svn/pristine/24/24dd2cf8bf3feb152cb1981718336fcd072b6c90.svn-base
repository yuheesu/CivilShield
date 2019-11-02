<%--
subject    : 건물 추가 페이지(관리자)
author     : 주형진
date       : 2018. 6. 11. 
description : 관리자 페이지(관리자) -> 건물 추가 페이지
 
  [이름]   [수정일]     [내용]
  ----------------------------------------------------------
  주형진   2018-06-11      건물 추가 페이지 최초 편집
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<style type="text/css">
   button.replace {    /*button tag 에 원하는 스타일 적용*/
     position: absolute;
     width: 200px;
     height: 50px;
     border-radius: 3px;
     font-weight: 600;
     border-color: transparent;
     font-size: 25px;
     background: orange;
     color: #fff;
     cursor: pointer;
   }
   
   #map {
     width: 100%;
     height: 400px;
     background-color: grey;
   }
   
   #map_canvas {
     width: 100%;
     height: 400px;
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
   }
   .navbar-left {
       float: right!important;
   }
      

</style>
   <div class="container" style="padding: 10px; height: auto;">
      <h1 style="color: #666666">근무지 추가</h1>
        <hr style="border: solid 0.5px #EBEBE3">
      <form action="/admin/bldgInsert.do" method="post" style="display:inline;">
         <input type ="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
         <div class="container" style="padding: 10px; height: auto;">
            <br><br>
            <table border="1" width="100%"  class="type">
                    <tr>   
                       <th class="text-center" width="15%">근무지명</th>            
                       <td><input type="text" class="form-control" name = "bldgNm" style="width: 100%;" placeholder="근무지명을 입력해주세요."></td>
                    </tr>
                    <tr>   
                       <th class="text-center" width="15%">작성일자</th>
                       <td>${mTime}</td>
                    </tr>
                    <tr>
                       <th class="text-center" width="15%">주소 검색</th>
                       <td>
                          <input type="text" class="form-control" id="addrStr" name="bldgAddr" style="width: 100%;" placeholder="검색할 주소를 입력해주세요.">
                          <input type="button" class="btn btn-success" id="" value="검색" onclick="searchAddr();">
                       </td>
                    </tr>
                    <tr>
                       <th class="text-center" width="15%">위치확인</th>
                       <td colspan="2"><div id="map_canvas"></div></td>
                    </tr>
              </table>
              <input type="text" id="lat" name="latitude" style="visibility:hidden">
              <input type="text" id="lng" name="longitude" style="visibility:hidden">
              <div style="float: right;">
                 <input type="submit" class="btn btn-primary" value="추가">
                 <input type="button" class="btn btn-default" value="취소" onclick="location.href = '/admin/management.do'">
              </div>
         </div>
      </form>
   </div>
   <script>                                                   
      function initMap() {
        var uluru = {lat: 37.578634, lng: 126.986385};
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 16,
          center: uluru
        });
        var marker = new google.maps.Marker({
          position: uluru,
          map: map
        });
      }
   </script>
<script type="text/javascript">

//구글맵 v3
function initialize() {
  var geocoder = new google.maps.Geocoder();
  var addr="gsitm";
  var lat="";
  var lng="";

  geocoder.geocode({'address':addr},
    function(results, status){

        if(results!=""){
           var location=results[0].geometry.location;
           lat=location.lat();
           lng=location.lng();
           var latlng = new google.maps.LatLng(lat , lng);
           var myOptions = {
               zoom: 16,
               center: latlng,
               mapTypeControl: true,
               mapTypeId: google.maps.MapTypeId.ROADMAP
           };
           var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions); 
           
           var uluru = {lat: location.lat(), lng: location.lng()};
           var marker = new google.maps.Marker({
             position: uluru,
             map: map
           });
        }
        else $("#map_canvas").html("위도와 경도를 찾을 수 없습니다.");
    }
  )
}

$(function(){initialize()})
</script>

<script>
function searchAddr() {
     var geocoder = new google.maps.Geocoder();
     var addr=$("#addrStr").val();
     var lat="";
     var lng="";
     
     geocoder.geocode({'address':addr},
       function(results, status){
           if(results!=""){
               var location=results[0].geometry.location;
               lat=location.lat();
               lng=location.lng();

               $("#lat").val(lat);
                 $("#lng").val(lng);
                 
               var latlng = new google.maps.LatLng(lat , lng);
               var myOptions = {
                   zoom: 16,
                   center: latlng,
                   mapTypeControl: true,
                   mapTypeId: google.maps.MapTypeId.ROADMAP
               };
               var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions); 
               
               var uluru = {lat: location.lat(), lng: location.lng()};
               var marker = new google.maps.Marker({
                 position: uluru,
                 map: map
               });
           }
           else $("#map_canvas").html("위도와 경도를 찾을 수 없습니다.");
      }
   )
}

</script>
<div id="map_canvas"></div>
   <script async defer
 src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC8bw0L6VBylmjBP09Sx7txFGf46t_kyYo&callback=initialize">
</script>