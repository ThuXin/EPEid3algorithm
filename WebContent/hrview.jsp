<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="service.DBOperation"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<title>Login Form</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">
<link rel="stylesheet" type="text/css" href="css/all.min.css">


<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Montserrat:300,400,500,700"
	rel="stylesheet">

<!-- Bootstrap CSS File -->
<link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Libraries CSS Files -->
<link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="lib/animate/animate.min.css" rel="stylesheet">
<link href="lib/ionicons/css/ionicons.min.css" rel="stylesheet">
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">

<!-- Main Stylesheet File -->
<link href="css/style.css" rel="stylesheet">

<link href="css/login.css" rel="stylesheet">
<style type="text/css">
.registerlink {
	padding: 10px;
	color: white;
	border-radius: 30px;
	text-decoration: none;
}

.companyregister {
	float: left;
	margin: 0px 20px 50px 0px;
}

.manager_info {
	color: white;
	text-align: center;
}

.a {
	margin-top: 2%;
	height: 500px;
	border-radius: 10px;
	background: linear-gradient(to left, #536976, #292e49);
}

article {
	height: 700px;
}
</style>

<!-- =======================================================
    Theme Name: BizPage
    Theme URL: https://bootstrapmade.com/bizpage-bootstrap-business-template/
    Author: BootstrapMade.com
    License: https://bootstrapmade.com/license/
  ======================================================= -->
<style>
body {
	background-image: url(img/bakcground.jpg);
	background-repeat: no-repeat;
	background-position: center center;
	background-size: cover;
	background-attachment: fixed;
}

.bg {
	background-color: black;
	opacity: 0.1;
}

td, th {
	color: white;
	font-family: Trebuchet MS;
}

.my-custom-scrollbar {
	position: relative;
	height: 200px;
	overflow: auto;
}

.table-wrapper-scroll-y {
	display: block;
}

#style-15::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
	background-color: #F5F5F5;
	border-radius: 10px;
}

#style-15::-webkit-scrollbar {
	width: 5px;
	background-color: #F5F5F5;
}

#style-15::-webkit-scrollbar-thumb {
	border-radius: 10px;
	background-color: #FFF;
	background-image: -webkit-gradient(linear, 40% 0%, 75% 84%, from(#536976),
		to(#292e49), color-stop(.6, #777B7E))
}

.n {
	background: linear-gradient(to left, #536976, #292e49);
}

select {
	background-color: transparent !important;
	color: white;
	border-color: white;
}
</style>


</head>

<body>

	<!--==========================
    Header
  ============================-->
	<header id="header">
	<div class="container-fluid">

		<div id="logo" class="pull-left">
			<h1>
				<a href="index.jsp" class="scrollto">EPE System </a>
			</h1>
			<!-- Uncomment below if you prefer to use an image logo -->
			<!-- <a href="#intro"><img src="img/logo.png" alt="" title="" /></a>-->
		</div>

		<nav id="nav-menu-container">
		<ul class="nav-menu">

			<li><a href="#"><s:property value="#session.username" /></a></li>
			<li><a href="login.jsp"><i class="fas fa-sign-out-alt"></i>&nbsp;LogOut</a></li>

		</ul>
		</nav>
		<!-- #nav-menu-container -->
	</div>
	</header>
	<!-- #header -->

	<div class="container1">
		<div class="shadow-lg p-5 mb-5 bg rounded z-depth-5 row"
			style="opacity: 0.8; margin-top: 90px;">
			<nav class="col-md-2 col-sm-6 col-xs-12 a" style="height:140px;">
			<br />
			<br />
			<center>
				<div class="companyregister" style="margin-left: 20px;">
					<a href="employeeregister.jsp" class="registerlink btn"
						style="border-radius: 10px; background-color: #4AA5D5; font-size: 16px; font-family: Trebuchet Ms; color: white;">Employee
						Register</a>
				</div>

			</center>
			</nav>

			<article class="col-md-10 col-sm-12 col-xs-12"> <br>

			<div class="header n" style="margin-top: 10px;">
				<br> <br>
				<center>
					<font
						style="color: white; font-size: 20px; font-family: Trebuchet MS;">Company
						Name: AKK co.ltd; </font>
				</center>

				<center>
					<font
						style="color: white; font-size: 20px; font-family: Trebuchet MS;">Department
						Name: IT Department<s:property value="IT Department" />
					</font>
				</center>


			</div>


			<div
				class="table-responsive table-wrapper-scroll-y my-custom-scrollbar"
				id="style-15" style="margin-top: 20px;" id="style-15">
				<table class="table table-striped mb-0">

					<tbody>

						<s:iterator value="employeelist">
							<tr>
								<td
									style="text-align: center; color: white; font-family: Trebuchet MS; font-size: 18px;">
									<s:property value="empname" />
								</td>
								<td
									style="text-align: center; color: white; font-family: Trebuchet MS; font-size: 18px;">
									<s:url action="hrevaluation" var="evl">
										<s:param name="idvalue" value="id">
										</s:param>
										<s:param name="emp_name" value="empname">
										</s:param>
									</s:url> <s:a href="%{evl}">Evaluate</s:a>
								</td>
								<td
									style="text-align: center; color: white; font-family: Trebuchet MS; font-size: 18px;">
									<s:url action="empupdate" var="update">
										<s:param name="idvalue" value="id">
										</s:param>
										<s:param name="emp_name" value="empname">
										</s:param>
									</s:url> <s:a href="%{update}" onclick=" return confirm('Are you sure you want to Update!!!!')">Update</s:a>
								</td>
								<td
									style="text-align: center; color: white; font-family: Trebuchet MS; font-size: 18px;">
									<s:url action="hrdelete" var="del">
										<s:param name="idvalue" value="id">
										</s:param>
										<s:param name="emp_name" value="empname">
										</s:param>
									</s:url> <s:a href="%{del}" onclick=" return confirm('Are you sure you want to Delete!!!!')">Delete</s:a>
								</td>

							</tr>
						</s:iterator>

					</tbody>
				</table>
			</div>
			<br>
			<br>



			</article>
		</div>
	</div>


	<!-- #footer -->
	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
	<!-- Uncomment below i you want to use a preloader -->
	<!-- <div id="preloader"></div> -->

	<!-- JavaScript Libraries -->
	<script src="lib/jquery/jquery.min.js"></script>
	<script src="lib/jquery/jquery-migrate.min.js"></script>
	<script src="lib/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/superfish/hoverIntent.js"></script>
	<script src="lib/superfish/superfish.min.js"></script>
	<script src="lib/wow/wow.min.js"></script>
	<script src="lib/waypoints/waypoints.min.js"></script>
	<script src="lib/counterup/counterup.min.js"></script>
	<script src="lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="lib/isotope/isotope.pkgd.min.js"></script>
	<script src="lib/lightbox/js/lightbox.min.js"></script>
	<script src="lib/touchSwipe/jquery.touchSwipe.min.js"></script>
	<!-- Contact Form JavaScript File -->
	<script src="contactform/contactform.js"></script>

	<!-- Template Main Javascript File -->
	<script src="js/main.js"></script>
	<script src="lib/bootstrap/js/bootstrap.min.js"></script>
	<script src="js/jquery.js"></script>

</body>
</html>