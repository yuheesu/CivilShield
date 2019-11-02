
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Freelancer - Start Bootstrap Theme</title>

<style>
.wrap {
	position: absolute;
	left: 0;
	bottom: 40px;
	width: 288px;
	height: 132px;
	margin-left: -144px;
	text-align: left;
	overflow: hidden;
	font-size: 12px;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	line-height: 1.5;
}

.wrap * {
	padding: 0;
	margin: 0;
}

.wrap .info {
	width: 286px;
	height: 120px;
	border-radius: 5px;
	border-bottom: 2px solid #ccc;
	border-right: 1px solid #ccc;
	overflow: hidden;
	background: #fff;
}

.wrap .info:nth-child(1) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.info .title {
	padding: 5px 0 0 10px;
	height: 30px;
	background: #eee;
	border-bottom: 1px solid #ddd;
	font-size: 18px;
	font-weight: bold;
}

.info .close {
	position: absolute;
	top: 10px;
	right: 10px;
	color: #888;
	width: 17px;
	height: 17px;
	background:
		url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');
}

.info .close:hover {
	cursor: pointer;
}

.info .body {
	position: relative;
	overflow: hidden;
}

.info .desc {
	position: relative;
	margin: 13px 0 0 90px;
	height: 75px;
}

.desc .ellipsis {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.desc .jibun {
	font-size: 11px;
	color: #888;
	margin-top: -2px;
}

.info .img {
	position: absolute;
	top: 6px;
	left: 5px;
	width: 73px;
	height: 71px;
	border: 1px solid #ddd;
	color: #888;
	overflow: hidden;
}

.info:after {
	content: '';
	position: absolute;
	margin-left: -12px;
	left: 50%;
	bottom: 0;
	width: 22px;
	height: 12px;
	background:
		url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.info .link {
	color: #5085BB;
}
</style>


<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/dist/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom fonts for this template -->
<link
	href="${pageContext.request.contextPath}/dist/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css">

<!-- Plugin CSS -->
<link
	href="${pageContext.request.contextPath}/dist/vendor/magnific-popup/magnific-popup.css"
	rel="stylesheet" type="text/css">

<!-- Custom styles for this template -->
<link
	href="${pageContext.request.contextPath}/dist/css/freelancer.min.css"
	rel="stylesheet">


<!-- Bootstrap Core CSS -->
<link href="/dist/css/bootstrap.css" rel="stylesheet">
<!-- MetisMenu CSS -->
<link href="/dist/css/metisMenu.css" rel="stylesheet">
<!-- Timeline CSS -->
<link href="/dist/css/timeline.css" rel="stylesheet">
<!-- DataTable CSS -->
<link href="/dist/css/dataTables.bootstrap.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="/dist/css/sb-admin-2.css" rel="stylesheet">
<!-- Morris Charts CSS -->
<link href="/dist/css/morris.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="/dist/css/font-awesome.css" rel="stylesheet" type="text/css">
<!-- Date Picker CSS -->
<link href="/dist/css/bootstrap-datetimepicker.css" rel="stylesheet" />
<!-- tabletools -->
<link href="/dist/css/dataTables.tableTools.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="/dist/css/responsive.bootstrap.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
	        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	    <![endif]-->

<!-- jQuery v2.1.4 -->
<script src="/dist/js/jquery.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="/dist/js/bootstrap.js"></script>
<!-- Custom Theme JavaScript -->
<!-- DatePicker JavaScript -->
<script src="/dist/js/moment-ko.js"></script>
<script src="/dist/js/transition.js"></script>
<script src="/dist/js/collapse.js"></script>
<script src="/dist/js/bootstrap-datetimepicker.js"></script>


</head>

<body id="page-top">

	<!-- Navigation -->
	<nav
		class="navbar navbar-expand-lg bg-secondary fixed-top text-uppercase"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="#page-top">Start
				Bootstrap</a>
			<button
				class="navbar-toggler navbar-toggler-right text-uppercase bg-primary text-white rounded"
				type="button" data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				Menu <i class="fa fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
						href="#portfolio">Portfolio</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
						href="#about">About</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
						href="#contact">Contact</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Header -->
	<header class="masthead bg-primary text-white text-center">
		<div class="container">
			<img class="img-fluid mb-5 d-block mx-auto"
				src="${pageContext.request.contextPath}/dist/img/profile.png" alt="">
			<h1 class="text-uppercase mb-0">Start Bootstrap</h1>
			<hr class="star-light">
			<h2 class="font-weight-light mb-0">Web Developer - Graphic
				Artist - User Experience Designer</h2>
		</div>
	</header>

	<!-- Portfolio Grid Section -->
	<section class="portfolio" id="portfolio">
		<div class="container">
			<h2 class="text-center text-uppercase text-secondary mb-0">Portfolio</h2>
			<hr class="star-dark mb-5">
			<div class="row">
				<div class="col-lg-12">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">게시판 목록조회</div>
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
		</div>
	</section>

	<!-- About Section -->
	<section class="bg-primary text-white mb-0" id="about">
		<div class="container text-center">
			<div id="top_x_div" style="width: 500px; height: 300px;"></div>
		</div>
	</section>

	<!-- Contact Section -->
	<section id="contact">
		<div class="container">

		</div>
	</section>

	<!-- Footer -->
	<footer class="footer text-center">
		<div class="container">
			<div class="row">
				<div class="col-md-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4">Location</h4>
					<p class="lead mb-0">
						2215 John Daniel Drive <br>Clark, MO 65243
					</p>
				</div>
				<div class="col-md-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4">Around the Web</h4>
					<ul class="list-inline mb-0">
						<li class="list-inline-item"><a
							class="btn btn-outline-light btn-social text-center rounded-circle"
							href="#"> <i class="fa fa-fw fa-facebook"></i>
						</a></li>
						<li class="list-inline-item"><a
							class="btn btn-outline-light btn-social text-center rounded-circle"
							href="#"> <i class="fa fa-fw fa-google-plus"></i>
						</a></li>
						<li class="list-inline-item"><a
							class="btn btn-outline-light btn-social text-center rounded-circle"
							href="#"> <i class="fa fa-fw fa-twitter"></i>
						</a></li>
						<li class="list-inline-item"><a
							class="btn btn-outline-light btn-social text-center rounded-circle"
							href="#"> <i class="fa fa-fw fa-linkedin"></i>
						</a></li>
						<li class="list-inline-item"><a
							class="btn btn-outline-light btn-social text-center rounded-circle"
							href="#"> <i class="fa fa-fw fa-dribbble"></i>
						</a></li>
					</ul>
				</div>
				<div class="col-md-4">
					<h4 class="text-uppercase mb-4">About Freelancer</h4>
					<p class="lead mb-0">
						Freelance is a free to use, open source Bootstrap theme created by
						<a href="http://startbootstrap.com">Start Bootstrap</a>.
					</p>
				</div>
			</div>
		</div>
	</footer>

	<div class="copyright py-4 text-center text-white">
		<div class="container">
			<small>Copyright &copy; Your Website 2018</small>
		</div>
	</div>

	<!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
	<div class="scroll-to-top d-lg-none position-fixed ">
		<a class="js-scroll-trigger d-block text-center text-white rounded"
			href="#page-top"> <i class="fa fa-chevron-up"></i>
		</a>
	</div>

	<!-- Portfolio Modals -->

	<!-- Portfolio Modal 1 -->
	<div class="portfolio-modal mfp-hide" id="portfolio-modal-1">
		<div class="portfolio-modal-dialog bg-white">
			<a class="close-button d-none d-md-block portfolio-modal-dismiss"
				href="#"> <i class="fa fa-3x fa-times"></i>
			</a>
			<div class="container text-center">
				<div class="row">
					<div class="col-lg-8 mx-auto">
						<h2 class="text-secondary text-uppercase mb-0">Project Name</h2>
						<hr class="star-dark mb-5">
						<img class="img-fluid mb-5"
							src="${pageContext.request.contextPath}/dist/img/portfolio/cabin.png"
							alt="">
						<p class="mb-5">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias
							magnam, recusandae quos quis inventore quisquam velit asperiores,
							vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
						<a
							class="btn btn-primary btn-lg rounded-pill portfolio-modal-dismiss"
							href="#"> <i class="fa fa-close"></i> Close Project
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Portfolio Modal 2 -->
	<div class="portfolio-modal mfp-hide" id="portfolio-modal-2">
		<div class="portfolio-modal-dialog bg-white">
			<a class="close-button d-none d-md-block portfolio-modal-dismiss"
				href="#"> <i class="fa fa-3x fa-times"></i>
			</a>
			<div class="container text-center">
				<div class="row">
					<div class="col-lg-8 mx-auto">
						<h2 class="text-secondary text-uppercase mb-0">Project Name</h2>
						<hr class="star-dark mb-5">
						<img class="img-fluid mb-5"
							src="${pageContext.request.contextPath}/dist/img/portfolio/cake.png"
							alt="">
						<p class="mb-5">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias
							magnam, recusandae quos quis inventore quisquam velit asperiores,
							vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
						<a
							class="btn btn-primary btn-lg rounded-pill portfolio-modal-dismiss"
							href="#"> <i class="fa fa-close"></i> Close Project
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Portfolio Modal 3 -->
	<div class="portfolio-modal mfp-hide" id="portfolio-modal-3">
		<div class="portfolio-modal-dialog bg-white">
			<a class="close-button d-none d-md-block portfolio-modal-dismiss"
				href="#"> <i class="fa fa-3x fa-times"></i>
			</a>
			<div class="container text-center">
				<div class="row">
					<div class="col-lg-8 mx-auto">
						<h2 class="text-secondary text-uppercase mb-0">Project Name</h2>
						<hr class="star-dark mb-5">
						<img class="img-fluid mb-5"
							src="${pageContext.request.contextPath}/dist/img/portfolio/circus.png"
							alt="">
						<p class="mb-5">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias
							magnam, recusandae quos quis inventore quisquam velit asperiores,
							vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
						<a
							class="btn btn-primary btn-lg rounded-pill portfolio-modal-dismiss"
							href="#"> <i class="fa fa-close"></i> Close Project
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Portfolio Modal 4 -->
	<div class="portfolio-modal mfp-hide" id="portfolio-modal-4">
		<div class="portfolio-modal-dialog bg-white">
			<a class="close-button d-none d-md-block portfolio-modal-dismiss"
				href="#"> <i class="fa fa-3x fa-times"></i>
			</a>
			<div class="container text-center">
				<div class="row">
					<div class="col-lg-8 mx-auto">
						<h2 class="text-secondary text-uppercase mb-0">Project Name</h2>
						<hr class="star-dark mb-5">
						<img class="img-fluid mb-5"
							src="${pageContext.request.contextPath}/dist/img/portfolio/game.png"
							alt="">
						<p class="mb-5">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias
							magnam, recusandae quos quis inventore quisquam velit asperiores,
							vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
						<a
							class="btn btn-primary btn-lg rounded-pill portfolio-modal-dismiss"
							href="#"> <i class="fa fa-close"></i> Close Project
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Portfolio Modal 5 -->
	<div class="portfolio-modal mfp-hide" id="portfolio-modal-5">
		<div class="portfolio-modal-dialog bg-white">
			<a class="close-button d-none d-md-block portfolio-modal-dismiss"
				href="#"> <i class="fa fa-3x fa-times"></i>
			</a>
			<div class="container text-center">
				<div class="row">
					<div class="col-lg-8 mx-auto">
						<h2 class="text-secondary text-uppercase mb-0">Project Name</h2>
						<hr class="star-dark mb-5">
						<img class="img-fluid mb-5"
							src="${pageContext.request.contextPath}/dist/img/portfolio/safe.png"
							alt="">
						<p class="mb-5">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias
							magnam, recusandae quos quis inventore quisquam velit asperiores,
							vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
						<a
							class="btn btn-primary btn-lg rounded-pill portfolio-modal-dismiss"
							href="#"> <i class="fa fa-close"></i> Close Project
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Portfolio Modal 6 -->
	<div class="portfolio-modal mfp-hide" id="portfolio-modal-6">
		<div class="portfolio-modal-dialog bg-white">
			<a class="close-button d-none d-md-block portfolio-modal-dismiss"
				href="#"> <i class="fa fa-3x fa-times"></i>
			</a>
			<div class="container text-center">
				<div class="row">
					<div class="col-lg-8 mx-auto">
						<h2 class="text-secondary text-uppercase mb-0">Project Name</h2>
						<hr class="star-dark mb-5">
						<img class="img-fluid mb-5"
							src="${pageContext.request.contextPath}/dist/img/portfolio/submarine.png"
							alt="">
						<p class="mb-5">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias
							magnam, recusandae quos quis inventore quisquam velit asperiores,
							vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
						<a
							class="btn btn-primary btn-lg rounded-pill portfolio-modal-dismiss"
							href="#"> <i class="fa fa-close"></i> Close Project
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<form id=""></form>

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
	<script src="/dist/js/jquery.dataTables.js"></script>
	<script src="/dist/js/dataTables.bootstrap.js"></script>
	<script src="/dist/js/dataTables.responsive.js"></script>
	<script src="/dist/js/responsive.bootstrap.js"></script>
	<script src="/dist/js/dataTables.tableTools.js"></script>
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
	<!-- chart -->
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
		google.charts.load('current', {'packages' : [ 'bar' ]});
		google.charts.setOnLoadCallback(drawStuff);

		function drawStuff() {
			var data = new google.visualization.arrayToDataTable([
					[ 'Opening Move', 'Percentage' ],
					[ "King's pawn (e4)", 44 ], [ "Queen's pawn (d4)", 31 ],
					[ "Knight to King 3 (Nf3)", 12 ],
					[ "Queen's bishop pawn (c4)", 10 ], [ 'Other', 3 ] ]);

			var options = {
				title : 'Chess opening moves',
				width : 900,
				legend : {
					position : 'none'
				},
				chart : {
					title : 'Chess opening moves',
					subtitle : 'popularity by percentage'
				},
				bars : 'horizontal', // Required for Material Bar Charts.
				axes : {
					x : {
						0 : {
							side : 'top',
							label : 'Percentage'
						}
					// Top x-axis.
					}
				},
				bar : {
					groupWidth : "90%"
				}
			};

			var chart = new google.charts.Bar(document
					.getElementById('top_x_div'));
			chart.draw(data, options);
		};
	</script>

</body>

</html>
