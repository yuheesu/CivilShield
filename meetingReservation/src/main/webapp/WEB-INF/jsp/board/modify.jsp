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
			<h2>공지사항 수정</h2>
		<br><br>
	<!-- contact -->
	<br>
	<br>
	<div class="container" style="padding: 10px; height: auto;">
		<br>
		<br>
		<form action="/board/modifyNotice.do" method="post">
			<table border="1" class="table" width="100%">
				<thead>
					<tr>
						<th class="text-center" width="15%">제목</th>
						<th class="text" width="30%" colspan="3"><input type="text"
							name="subject" value="${item.subject}"></th>
						<!-- 글 제목 불러와야됨 -->
					</tr>
				</thead>
				<thead>
					<tr>
						<th class="text-center" width="15%">작성일자</th>
						<th class="text-center" width="30%">${item.regDt}</th>
						<!-- 작성일자 불러와야됨 -->
						<th class="text-center" width="15%">조회수</th>
						<th class="text-center" width="30%">300</th>
						<!-- 조회수 불러와야됨 -->
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="text" style="vertical-align: middle;" colspan="4">
							<textarea rows="4" cols="150" name="content">${item.content}</textarea>
						</td>
					</tr>
				</tbody>
			</table>
			<button class="btn btn-default">prev</button>
			<button class="btn btn-info"
				onclick="location.href = '/board/board.do'">목록</button>
			<button class="btn btn-default">next</button>
			<div style="float: right;">
				<input type="submit" class="btn btn-primary" value="수정완료">
				   <input type ="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				    <input type ="hidden" name="boardNo" value="${item.boardNo}"/>
				<button class="btn btn-danger"
					onclick="location.href = '/board/admin/deleteNotice.do?boardNo=${item.boardNo}'">삭제</button>
			</div>
		</form>
	</div>
	<script type="text/javascript">
		$(document).ready(function($) {
			$(document).ready(function() {
				$('#dataTables-ex04').DataTable({
					responsive : true,
					ordering : true,
					"bAutoWidth" : true,
					"columnDefs" : [ {
						"orderable" : false
					}, {
						"targets" : 0
					} ]
				});
			});
		});
	</script>