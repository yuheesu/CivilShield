<%--
subject    : 
author     : 차주현
date       : 2018. 6. 14.
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
<title>RES SYSTEM</title>

<script src="/dist/js/jquery-1.11.1.min.js"></script>
<script src="/dist/js/bootstrap.js"></script>

<!-- Calendar -->
<link href="/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="/dist/css/colorpicker.min.css" rel="stylesheet">
<link href="/dist/css/angular-bootstrap-calendar.min.css" rel="stylesheet">

<tiles:insertAttribute name="import" />
</head>
<body>
	<div class="container-fluid">
		<tiles:insertAttribute name="body" />
	</div>
</body>
</html>