<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>지진대피소 알리미</title>

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

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">지진대피소 알리미</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li class="active">
                            <a href="#"><i class="fa fa-files-o fa-fw"></i>목록보기<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a  href="table.do">실내대피소</a>
                                </li>
                                <li>
                                    <a  href="table2.do">옥외대피소</a>
                                </li>
                                <li>
                                    <a href="chart.do">차트보기</a>
                                </li>
                                <li>
                                    <a href="chart.do">행동대피요령</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!--  /.row -->
            <div class="row">
            <div class="noticebox" style="margin-top:20px;">
								<h3><span>자연재난</span><strong>지진</strong><i>Earthquake 地震</i></h3>
								<p style="padding-top:20px;font-size:14.5px;line-height:1.5;">지진은 지면이 흔들리는 자연 현상으로,<br>
								예고 없이 찾아오기 때문에 많은 피해를 줄 수 있습니다.<br>
								지진 피해를 최소화하기 위해서는 지진 발생 시 행동요령을 평소에 익히고,<br>
								실제 발생 시 침착한 대처가 중요합니다.</p>
							</div><!-- //noticebox -->				
							            <div class="noticebox" style="margin-top:20px;">
								<h3><span>실내대피소</span></h3>
								<p style="padding-top:20px;font-size:14.5px;line-height:1.5;">지진피해 장기화시 주거지가 파손된 이재민등을 ,<br>
								대상으로 집단구호를 실시하기 위하여 내진설계가 적용된 시설물입니다.</p>
							</div><!-- //noticebox -->				
							<!-- //actionbox -->
							<div class="noticebox" style="margin-top:20px;">
								<h3><span>실외대피소</span></h3>
								<p style="padding-top:20px;font-size:14.5px;line-height:1.5;">지진발생초기 운동장, 공터 등 구조물 파손 및 낙하물로부터<br>
								 안전한 외부대피장소입니다.</p>
							</div><!-- //noticebox -->				
							<!-- //actionbox -->
            
            </div>

      
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-comments fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div>실내대피소</div>
                                </div>
                            </div>
                        </div>
                        <a href="table.do" >
                            <div class="panel-footer">
                                <span class="pull-left">바로가기</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-tasks fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div>실외대피소</div>
                                </div>
                            </div>
                        </div>
                        <a href="table2.do">
                            <div class="panel-footer">
                                <span class="pull-left">바로가기</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-yellow">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-shopping-cart fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div>차트보기</div>
                                </div>
                            </div>
                        </div>
                        <a href="chart.do">
                            <div class="panel-footer">
                                <span class="pull-left">바로가기</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-red">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-support fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div>지진대피요령</div>
                                </div>
                            </div>
                        </div>
                        <a href="escape.do">
                            <div class="panel-footer">
                                <span class="pull-left">바로가기</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>            
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

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
