<%--
subject    : 시설 추가 페이지(관리자)
author     : 주형진
date       : 2018. 6. 11. 
description : 관리자 페이지(관리자) -> 시설 추가 -> 시설 추가 페이지
 
  [이름]   [수정일]     [내용]
  ----------------------------------------------------------
  주형진   2018-06-11      시설 추가 페이지 최초 편집
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<div class="container" style="padding: 10px; height: auto;">
   <h1 style="color: #666666">회의실/교육실 추가</h1>
    <hr style="border: solid 0.5px #EBEBE3">
   <form action="/admin/insertRoom.do" method="post" style="display:inline;" enctype="multipart/form-data">
      <input type ="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
      <div class="container" style="padding: 10px; height: auto;">
         <br><br>
         <table border="1" class="type" width="100%" style="margin: 30px;">
            <tr>
               <th class="text-center" width="15%">근무지명</th>
               <c:choose>
                   <c:when test="${curState eq 'All'}">
                       <td colspan="3">
                          <select class="form-control" name="bldgNm" style="color: black; width: 200px;">
                             <c:forEach var="bldg" items="${bldgList}" varStatus="status">
                                <option value="${bldg.bldgNm}">${bldg.bldgNm}</option>
                                <%-- <option value="${status.count}">${bldg.bldgNm}</option> --%>
                                <%-- <input type="text" name="bldgNo" value="${status.count}" style="visibility:hidden"> --%>
                           </c:forEach>
                          </select>
                       </td>
                   </c:when>

                   <c:otherwise>      
                       <td colspan="3">${curState}</td>
                       <input type="text" name="bldgNm" value="${curState}" style="visibility:hidden">
                   </c:otherwise>
               </c:choose>
               
            </tr>
              <tr>   
                 <th class="text-center" width="15%">구분</th>            
                 <td colspan="3">
                 <select  class="form-control" name="roomType" style="color: black;  width: 200px;">
                    <option value="0">회의실</option>
                    <option value="1">교육실</option>
                 </select></td>
              </tr>
              <tr>
                 <th class="text-center" width="15%">등록일자</th>
                 <td colspan="3">${mTime}</td>   <!-- 현재일자 받아와야됨 -->
              </tr>
              <tr>
                 <th class="text-center" width="15%">시설명</th>
                 <td colspan="3"><input class="form-control" type="text" name="roomNm" style="color: black;  width: 200px;"></td>
              </tr>
              <tr>
                 <th class="text-center" width="15%">네트워크 사용여부</th>            
                 <td colspan="3">
                 <select name="useNetworkYn" class="form-control"style="color: black;  width: 200px;">
                    <option value="Y">사용</option>
                    <option value="N">미사용</option>
                 </select></td>
              </tr>
              <tr>   
                 <th class="text-center" width="15%">슬라이드 이미지 </th>
                 <td id="imgList" colspan="3">
                 <input id="addImg" type="button" class="btn btn-success" value="추가" onClick="insImgRow()" style="margin: 10px;"/>
                    <table id="addImgTable" width="400" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" border="0">
                    <!-- 
                      <tr>
                          <td><input type="file" name="imgFile0"></td>
                          <td align="left"></td>
                      </tr> -->
                    </table>
                    <input type="text" class="form-control" id="imgTableLength" name="imgTableLength" value="0" style="visibility:hidden">
                    <input type="text" class="form-control" id="imgAddLength" name="imgAddLength" value="0" style="visibility:hidden">
                 </td>
              </tr>
              <tr>
                 <th class="text-center" width="15%" style="vertical-align:middle;">소개내용</th>
                 <td colspan="3"><textarea class="form-control" name="roomExplain"></textarea></td>
              </tr>
              <tr>
                 <th class="text-center" width="15%" style="vertical-align:middle;">수용인원</th>
                 <td colspan="3"><input type="text" class="form-control" name="roomCapacity" style="color: black;  width: 200px;"></td>
              </tr>
              <tr>
                 <th class="text-center" width="15%" style="vertical-align:middle;">면적</th>
                 <td colspan="3"><input type="text" class="form-control" name="roomArea" style="color: black;  width: 200px;"></td>
              </tr>
              <tr>   
                 <th class="text-center" width="15%" style="vertical-align:middle;">예약비용</th>
                 <td colspan="3"><input type="text" class="form-control" name="costPerHour" style="color: black;  width: 200px;"></td>
              </tr>
              <tr>   
                 <th class="text-center" width="15%" style="">기자재 </th>
                 <td colspan="1" id="itemList">
                  <input id="addItem" type="button" class="btn btn-success" value="추가" onClick="insRow()"/>
                    <table id="addTable" width="400" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" border="0">
                       <!-- <tr>
                          <td><input class="form-control" type="text" name="itemNm0"></td>
                          <td align="left"></td>
                      </tr> -->
                    </table>
                    <input type="text" id="itemTableLength" name="itemTableLength" value="0" style="visibility:hidden">
                    <input type="text" id="itemAddLength" name="itemAddLength" value="0" style="visibility:hidden">
                 </td>
                 <th class="text-center" width="15%" style="">비용</th>
                 <td colspan="1" id="itemCostList">
                    <table id="addCostTable" width="400" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" border="0">
                       <!-- <tr>
                          <td><input class="form-control" type="text" name="useCost0"></td>
                          <td align="left"></td>
                      </tr> -->
                    </table>
                 </td>
              </tr>
           </table>
           <div style="float: right;">
              <input type="submit" class="btn btn-primary" value="추가">
              <input type="button" class="btn btn-default" value="취소" onclick="location.href = '/admin/management.do'">
           </div>
      </div>
   </form>
</div>
<script>
   var oTbl;
   var oTbl2;
   var oTblImg;
   
   var imgIdx = 0;
   var itemIdx = 0;
   var imgCntIdx = 0;
   var itemCntIdx = 0;
   
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
     
     frmTag += "<input class='btn btn-danger' type=button value='삭제' onClick='removeRow()' style='cursor:hand'>";
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
     
     frmTag += "<input class='btn btn-danger' type=button value='삭제' onClick='removeImgRow()' style='cursor:hand'>";
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