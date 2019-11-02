<%--
subject    : 공지사항 작성 페이지(관리자)
author     : 주형진
date       : 2018. 6. 8. 
description : 고객지원 -> 공지사항 -> 작성 페이지(관리자)
 
  [이름]   [수정일]     [내용]
  ----------------------------------------------------------
  주형진	2018-07-08		공지사항 작성 페이지 최초 편집(관리자)
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
	<!-- contact -->
	<br><br>
	<div class="container" style="padding: 10px; height: auto;">
	<form action="/board/admin/insertNotice.do" method="post" style="display:inline;">
			<div style="padding-bottom: 30px">
				<h2>공지사항 등록</h2>
			</div>
			<div class="col-sm-6 contact-left">
				<label>구분</label><br><br>
				<select name="boardType">
						<option value="1">공지사항</option>
						<option value="2">FAQ</option>
					</select>
				<br><br>
				<label>작성일자</label><br><br>
				<input type="text" name="date" id="demo" readonly="readonly">	<!-- 현재 날짜값을 받아와야됨 -->
				<br><br>
				<label>글제목</label><br><br>
				<input type="text" name="subject" placeholder="제목을 입력해주세요.">
				<br><br>
			</div>
			<div class="col-sm-6 contact-right">
				<label>내용</label><br><br>
				<textarea name="content" placeholder="내용을 입력해주세요." required="" style="height: 200px;"></textarea>
				<input type="submit" value="작성" style="width: 30%;">	<input type="button" class="btn btn-default" style="width: 30%;" value="취소" onclick="location.href = '/board/board.do'">
				 <input type ="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			</div>
			<div class="clearfix"></div>    
		</form>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			//id = demo에 현재시간을 때려박는다.
			
			
			var today = new Date();
			var dd = today.getDate();
			var mm = today.getMonth()+1; //January is 0!
			var yyyy = today.getFullYear();
			if(dd<10) {
			    dd='0'+dd
			} 

			if(mm<10) {
			    mm='0'+mm
			} 
			today = yyyy+'/'+mm+'/'+dd;
			
			 $('#demo').attr("placeholder", today); 
			});
		
		
	</script>

<!-- 	<script type="text/javascript">
		$(document).ready(function($) {
			$(document).ready(function() {
		        $('#dataTables-ex04').DataTable({
		            responsive: true
		            ,ordering: true
		            ,"bAutoWidth": true
	                ,"columnDefs": [
	                               { "orderable": false}, {"targets": 0 }
	                             ]
		        });
		    });
		});
	</script> -->
</body>
</html>