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

    <title>SB Admin 2 - Bootstrap Admin Theme</title>

<!-- tabletools -->
<link href="${pageContext.request.contextPath}/dist/css/dataTables.tableTools.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css"/>
    <!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.contextPath}/dist/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="${pageContext.request.contextPath}/dist/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${pageContext.request.contextPath}/dist/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <!-- Bootstrap Core CSS -->
<link href="${pageContext.request.contextPath}/dist/css/bootstrap.css" rel="stylesheet">
<!-- MetisMenu CSS -->
<link href="${pageContext.request.contextPath}/dist/css/metisMenu.css" rel="stylesheet">
<!-- Timeline CSS -->
<link href="${pageContext.request.contextPath}/dist/css/timeline.css" rel="stylesheet">
<!-- DataTable CSS -->
<link href="${pageContext.request.contextPath}/dist/css/dataTables.bootstrap.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="${pageContext.request.contextPath}/dist/css/sb-admin-2.css" rel="stylesheet">
<!-- Morris Charts CSS -->
<link href="${pageContext.request.contextPath}/dist/css/morris.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="${pageContext.request.contextPath}/dist/css/font-awesome.css" rel="stylesheet" type="text/css">
<!-- Date Picker CSS -->
<link href="${pageContext.request.contextPath}/dist/css/bootstrap-datetimepicker.css" rel="stylesheet" />
<!-- tabletools -->
<link href="${pageContext.request.contextPath}/dist/css/dataTables.tableTools.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css href="${pageContext.request.contextPath}/dist/css/responsive.bootstrap.css">

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
                                    <a class="active" href="table.do">실내대피소</a>
                                </li>
                                <li>
                                    <a href="table2.do">옥외대피소</a>
                                </li>
                                <li>
                                    <a href="chart.do">차트보기</a>
                                </li>
                                <li>
                                    <a href="escape.do">행동대피요령</a>
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

        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
               <div class="row">
				<div class="col-lg-12">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">실내 대피소 안내</div>
							<!-- /.panel-heading -->
							<div class="panel-body">
								<div class="dataTable_wrapper">
									<table
										class="table table-striped table-bordered table-hover dt-responsive"
										id="dataTables-ex04" width="100%"
										data-order='[[ 0, "asc" ],[ 1, "asc" ]]' data-page-length='10'>
										<thead>
											<tr>
												<th class="text-center" width="25%">번호</th>
												<th class="text-center" width="25%">장소</th>
												<th class="text-center" width="*">주소</th>

											</tr>
										</thead>
										<tbody>
											<c:forEach var="list" items="${shelterModelList}"
												varStatus="status">
												<tr>
													<td class="text-center" style="vertical-align: middle;">
														${list.seq}</td>
													<td class="text-center" style="vertical-align: middle;">
														${list.vtAcmdfcltyNm}</td>
													<td class="text-center" style="vertical-align: middle;">
														${list.dtlAdres}</td>
													<%--<td class="text-center" style="vertical-align: middle;">
														${list.xcord}</td>
													<td class="text-center" style="vertical-align: middle;">
														${list.ycord}</td> --%>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<!-- /.panel-body -->
						</div>
						<!-- /.panel -->
					</div>
				</div>

			</div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

	<!-- Bootstrap core JavaScript -->
	<script
		src="${pageContext.request.contextPath}/dist/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/dist/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Plugin JavaScript -->
	<script
		src="${pageContext.request.contextPath}/dist/vendor/jquery-easing/jquery.easing.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/dist/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

	<!-- Contact Form JavaScript -->
	<script
		src="${pageContext.request.contextPath}/dist/js/jqBootstrapValidation.js"></script>
	<script src="${pageContext.request.contextPath}/dist/js/contact_me.js"></script>

	<!-- Custom scripts for this template -->
	<script
		src="${pageContext.request.contextPath}/dist/js/freelancer.min.js"></script>

	<!-- tabletools -->
	<!-- DataTables JavaScript -->
	<script src="${pageContext.request.contextPath}/dist/js/jquery.dataTables.js"></script>
	<script src="${pageContext.request.contextPath}/dist/js/dataTables.bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/dist/js/dataTables.responsive.js"></script>
	<script src="${pageContext.request.contextPath}/dist/js/responsive.bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/dist/js/dataTables.tableTools.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=751ce375b6a03aa093b8a9510a17d72d"></script>
	<script type="text/javascript">
		$(document).ready(function($) {
			$(document).ready(function() {
				var wee = 37.554123;
				var ky = 127.040730;

				var table = $('#dataTables-ex04').DataTable({
					responsive : true,
					ordering : true,
					"bAutoWidth" : true,
					"columnDefs" : [ {
						"orderable" : false,
						"targets" : 0
					} ]
				});
				$('#dataTables-ex04 tbody').on('click', 'tr', function() {

					var seq = table.row(this).data()[0];
					console.log(seq);
					window.open("/shelterModal.do?seq=" + seq, "a"+seq, "width=1000, height=500, left=100, top=50"); 
				});
			});
		});
	</script>
</body>

</html>
