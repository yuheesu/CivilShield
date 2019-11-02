<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin 2 - Bootstrap Admin Theme</title>

<!-- Bootstrap Core CSS -->
<link
	href="${pageContext.request.contextPath}/dist/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link
	href="${pageContext.request.contextPath}/dist/vendor/metisMenu/metisMenu.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="${pageContext.request.contextPath}/dist/css/sb-admin-2.css"
	rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="${pageContext.request.contextPath}/dist/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

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
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.html">지진대피소 알리미</a>
			</div>
			<!-- /.navbar-header -->

			<ul class="nav navbar-top-links navbar-right">
				<!-- /.dropdown -->
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
						<i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-user">
						<li><a href="#"><i class="fa fa-user fa-fw"></i> User
								Profile</a></li>
						<li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
						</li>
						<li class="divider"></li>
						<li><a href="/login.do"><i class="fa fa-sign-out fa-fw"></i>
								Logout</a></li>
					</ul> <!-- /.dropdown-user --></li>
				<!-- /.dropdown -->
			</ul>
			<!-- /.navbar-top-links -->

			<div class="navbar-default sidebar" role="navigation">
				<div class="sidebar-nav navbar-collapse">
					<ul class="nav" id="side-menu">
						<li class="active"><a href="#"><i
								class="fa fa-files-o fa-fw"></i>목록보기<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li><a href="table.do">실내대피소</a></li>
								<li><a href="table2.do">옥외대피소</a></li>
								<li><a class="active" href="chart.do">차트보기</a></li>
								<li><a href="escape.do">행동대피요령</a></li>
							</ul> <!-- /.nav-second-level --></li>
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
						<canvas id="top_x_div" style="width: 900px; height: 500px;"></canvas>
					</div>
					<a id = "seoul">
						<div class="panel-footer">
							<span class="pull-left">서울특별시</span> <span class="pull-right"><i
								class="fa fa-arrow-circle-right"></i></span>
							<div class="clearfix"></div>
						</div>
					</a> <a href="seoul.do">
						<div class="panel-footer">
							<span class="pull-left">인천광역시</span> <span class="pull-right"><i
								class="fa fa-arrow-circle-right"></i></span>
							<div class="clearfix"></div>
						</div>
					</a> <a href="seoul.do">
						<div class="panel-footer">
							<span class="pull-left">경기도</span> <span class="pull-right"><i
								class="fa fa-arrow-circle-right"></i></span>
							<div class="clearfix"></div>
						</div>
					</a>

					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script
		src="${pageContext.request.contextPath}/dist/vendor/jquery/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script
		src="${pageContext.request.contextPath}/dist/vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script
		src="${pageContext.request.contextPath}/dist/vendor/metisMenu/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="${pageContext.request.contextPath}/dist/js/sb-admin-2.js"></script>


	<script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			var ctx = document.getElementById("top_x_div");
			var label = [];
			var barDatas = [];
			<c:forEach var="stat" items="${shelterModelList}" varStatus="status">
			label.push('${stat.ctprvnNm}');
			barDatas.push('${stat.count}');
			</c:forEach>
			console.log(label);
			var myChart = new Chart(ctx, {
				type : 'bar',
				data : {
					labels : label,
					datasets : [ {
						labels : false,
						data : barDatas,
						backgroundColor : []
					} ]

				}
			})
		});
	</script>
		<script type="text/javascript">
		$(document).ready(function($) {
			$(document).ready(function() {
				
				$('#seoul').on('click', function() {

					window.open("/seoul.do", "width=1000, height=500, left=100, top=50"); 
				});
			});
		});
	</script>
</body>

</html>
