<%--
subject    : 공지사항 페이지
author     : 주형진
date       : 2018. 6. 8. 
description : 고객지원 -> 공지사항 페이지
 
  [이름]   [수정일]     [내용]
  ----------------------------------------------------------
  주형진 2018-07-08    공지사항 페이지 최초 편집
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
	<div class="container">
		<table class="table table-striped  table-hover dt-responsive"
			id="dataTables-ex04" width="100%"
			data-order='[[ 0, "asc" ],[ 2, "asc" ]]' data-page-length='10'>
			<thead>
				<tr>
					<th class="text-center" width="15%">번호</th>
					<th class="text-center" width="30%">제목</th>
					<th class="text-center" width="15%">작성자</th>
					<th class="text-center" width="30%">작성일자</th>
					<th class="text-center" width="30%">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="board" items="${list}">
					<tr>
						<td class="text-center" style="vertical-align: middle;">${board.boardNo}</td>
						<td id="prdNum" class="text-center"
							style="vertical-align: middle;"><a
							href="/board/notice.do?boardNo=${board.boardNo}"
							style="color: black; text-decoration: none;">
								${board.subject} </a></td>
						<td class="text-center" style="vertical-align: middle;">${board.empVO.empNm}</td>
						<td class="text-center" style="vertical-align: middle;">
							${board.regDt}</td>
						<td class="text-center" style="vertical-align: middle;">
							${board.hit}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<sec:authorize access="hasRole('ADMIN')">
          	<button class="btn btn-primary"
			onclick="location.href = '/board/writeNotice.do'">글쓰기</button>
		</sec:authorize>
	</div>