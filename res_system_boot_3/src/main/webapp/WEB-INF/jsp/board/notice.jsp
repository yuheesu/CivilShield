<%--
subject    : 공지사항 세부 페이지
author     : 주형진
date       : 2018. 6. 8. 
description : 고객지원 -> 공지사항 -> 공지사항 세부 페이지
 
  [이름]   [수정일]     [내용]
  ----------------------------------------------------------
  주형진	2018-07-08		공지사항 세부 페이지 최초 편집
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
	<br><br>
	<div class="container" style="padding: 10px; height: auto;">
		<br><br>
		<table border="1" class="table" width="100%">
	  		<thead>
	  			<tr>	
	  				<th class="text-center" width="15%">제목</th>				
	  				<th class="text" width="30%" colspan="3">${item.subject}</th> <!-- 글 제목 불러와야됨 -->
	  			</tr>
	  		</thead>
	  		<thead>
	  			<tr>	
	  				<th class="text-center" width="15%">작성일자</th>				
	  				<th class="text-center" width="30%">${item.regDt}</th>	<!-- 작성일자 불러와야됨 -->
	  				<th class="text-center" width="15%">조회수</th>
	  				<th class="text-center" width="30%">${item.hit}</th>		<!-- 조회수 불러와야됨 -->
	  			</tr>
	  		</thead>
	  		<tbody>							
	  			<tr>
	  				<td class="text" style="vertical-align:middle;" colspan="4">						
	  								${item.content}
	  				</td>
	  			</tr>
	  		</tbody>
	  	</table>
	  	<div>
	  		<button class="btn btn-default">prev</button>
		  	<button class="btn btn-info" onclick="location.href = '/board/board.do'">목록</button>
		  	<button class="btn btn-default">next</button>
			<sec:authorize access="hasRole('ADMIN')">
		  	<div style="float: right;">
		  		<button class="btn btn-primary" onclick="location.href = '/board/admin/modify.do?boardNo=${item.boardNo}'">수정</button>
		  		<button class="btn btn-danger" onclick="location.href = '/board/admin/deleteNotice.do?boardNo=${item.boardNo}'">삭제</button>
		  	</div>
			</sec:authorize>
	  	</div>
	</div>