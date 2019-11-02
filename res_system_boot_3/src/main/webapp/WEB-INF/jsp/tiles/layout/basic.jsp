<%--
subject    : 
author     : 차주현
date       : 2018. 6. 8. 
description :
 
  [이름]   [수정일]     [내용]
  ----------------------------------------------------------
  
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<!-- default header name is X-CSRF-TOKEN -->
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
<title>RES SYSTEM</title>
<!-- Template -->
<link href="/dist/css/style.css" rel="stylesheet" />
<link href="/dist/css/font-awesome.css" rel="stylesheet" />
<link href="/dist/css/roboto.css" rel="stylesheet" />
<link href="/dist/css/open-sans.css" rel="stylesheet" />

<script src="/dist/js/jquery-1.11.1.min.js"></script>
<script src="/dist/js/jquery-ui.min.js"></script>
<script src="/dist/js/bootstrap.js"></script>
<script src="/dist/js/calendar.js"></script>
<!-- DataTables -->
<link href="/dist/css/responsive.bootstrap.css" rel="stylesheet">
<link href="/dist/css/jquery.dataTables.min.css" rel="stylesheet">
<script src="/dist/js/jquery.dataTables.js"></script>
<script src="/dist/js/dataTables.bootstrap.js"></script>
<script src="/dist/js/dataTables.responsive.js"></script>
<script src="/dist/js/responsive.bootstrap.js"></script>
<script src="/dist/js/dataTables.tableTools.js"></script>
<!-- Calendar -->
<link href="/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="/dist/css/colorpicker.min.css" rel="stylesheet">
<link href="/dist/css/angular-bootstrap-calendar.min.css" rel="stylesheet">

<script src="/dist/js/moment-with-locales.min.js"></script>
<script src="/dist/js/interact.min.js"></script>
<script src="/dist/js/angular.js"></script>
<script src="/dist/js/angular-animate.js"></script>
<script src="/dist/js/ui-bootstrap-tpls.js"></script>
<script src="/dist/js/rrule.js"></script>
<script src="/dist/js/bootstrap-colorpicker-module.js"></script>
<script src="/dist/js/angular-bootstrap-calendar-tpls.js"></script>

<link href="/dist/css/top.css" rel="stylesheet">
<script src="/dist/js/top.js"></script>
<script src="/js/common.js"></script>
<tiles:insertAttribute name="import" />
<style>
div.container-fluid {
	
}
</style>
<script>
$.ajaxSetup({
    headers:
    { 'X-CSRF-TOKEN': $('meta[name="_csrf"]').attr('content') }
});
</script>
</head>
<body>
	<tiles:insertAttribute name="header" />
	<a href="javascript:" id="return-to-top"><i class="icon-chevron-up"></i></a>
	<div class="container-fluid">
		<tiles:insertAttribute name="body" />
	</div>
	<tiles:insertAttribute name="footer" />
</body>
</html>