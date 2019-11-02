<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<html>
<head>
<title>Explosion</title>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body class="wrapper">
    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">        
        <tiles:insertAttribute name="top"/>        
        <tiles:insertAttribute name="left" />    
    </nav>
     <div id="page-wrapper">
             <div class="row">
                <div class="col-lg-12">    
                    <h1 class="page-header">${setHeader}</h1>
                </div>
            </div>
            <div class="row">                 
                <tiles:insertAttribute name="content" />                                                  
            </div>
          
     </div>
    
 
    <div class="main_footer">
        <div class="main_footer-inner">
            <tiles:insertAttribute name="footer" />
        </div>
    </div>
</body>
</html>