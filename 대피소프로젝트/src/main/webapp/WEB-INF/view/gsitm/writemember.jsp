<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="org.apache.tomcat.util.http.fileupload.IOUtils" %>     
<%@ page import="java.io.ByteArrayInputStream" %>     
<%@ page import="java.io.InputStream" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
    <!-- Bootstrap core CSS -->
    <link href="/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="/dist/css/dashboard.css" rel="stylesheet">
    
    
    <!-- DataTable CSS -->
    <link href="/dist/css/dataTables.bootstrap.css" rel="stylesheet">
	<!-- tabletools -->
	<link href="/dist/css/dataTables.tableTools.css" rel="stylesheet" />
	<!-- DataTables JavaScript -->
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="/dist/js/jquery.dataTables.js"></script>
    <script src="/dist/js/dataTables.bootstrap.js"></script>
    <script src="/dist/js/dataTables.responsive.js"></script>
	<script src="/dist/js/responsive.bootstrap.js"></script>
	<script src="/dist/js/bootstrap.js"></script>
	<!-- tabletools -->
	<script src="/dist/js/dataTables.tableTools.js"></script>  

<html>
<head>
	<title>회원정보</title>
</head>
<body>
		<form action="/gsitm/writemember.do" method="post">
			<table class ="table" border="2">
				<tr class = "success">
					<td>사원번호</td>
					<td><input type="text" name="memberNo" /></td>
				</tr>
				<tr class = "warning">
					<td>이름</td>
					<td><input type="text" name="memberName" /></td>
				</tr>
				<tr class = "success">
					<td>부서번호</td>
					<td><input type="text" size="20" name="deptNo"/></td>
				</tr>
			</table>
			<br><br><input type="submit" value="등록">
		</form>	
</body>
</html>