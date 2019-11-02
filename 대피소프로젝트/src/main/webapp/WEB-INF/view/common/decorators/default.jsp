<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">

	
	<title><decorator:title default="ex06" /></title>
	
	<link href="/favicon.ico?" rel="shortcut icon" type="image/x-icon" />
	
<!-- 	<!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.contextPath}/dist/css/bootstrap.css" rel="stylesheet">
   	
   	<!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.contextPath}/dist/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="${pageContext.request.contextPath}/dist/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="${pageContext.request.contextPath}/dist/vendor/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${pageContext.request.contextPath}/dist/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
	<decorator:head/>
</head>


<body onload="" onunload="">
    <div>
        <div>
            <div>
                <%--<page:apply-decorator name="panel" page="/top.do" /> --%>
                <jsp:include page="/WEB-INF/view/common/include/Top.jsp" />
            </div>        
            <div>
                <div>
                   <%--<page:apply-decorator name="panel" page="/left.do" />  --%>
                   <jsp:include page="/WEB-INF/view/common/include/Left.jsp" />
                </div>
				<decorator:body />		
            </div>
         </div>
         <div>
			<jsp:include page="/WEB-INF/view/common/include/Footer.jsp" />
        </div>
    </div>
    
    
    <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/dist/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${pageContext.request.contextPath}/dist/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="${pageContext.request.contextPath}/dist/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="${pageContext.request.contextPath}/dist/vendor/raphael/raphael.min.js"></script>
    <script src="${pageContext.request.contextPath}/dist/vendor/morrisjs/morris.min.js"></script>
    <script src="${pageContext.request.contextPath}/dist/data/morris-data.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="${pageContext.request.contextPath}/dist/js/sb-admin-2.js"></script>
</body>
</html>
