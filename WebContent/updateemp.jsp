<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="java.util.*"%>
<%@ page import="action.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>Employee Update</title>
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

<!-- =======================================================
    Theme Name: BizPage
    Theme URL: https://bootstrapmade.com/bizpage-bootstrap-business-template/
    Author: BootstrapMade.com
    License: https://bootstrapmade.com/license/
  ======================================================= -->
<style type="text/css">
body {
	background-image: url(img/bakcground.jpg);
	background-repeat: no-repeat;
	background-position: center center;
	background-size: cover;
	background-attachment: fixed;
	opacity: 0.8px;
}

input[type=text], input[type=password], input[type=email] {
	background-color: transparent !important;
	color: white;
	border-color: white;
}

.bg {
	background-color: black;
	opacity: 0.1;
}

textarea {
	background-color: transparent !important;
	color: white;
	border-color: white;
}
</style>
</head>

<body>
	<%
	Connection con;
		ResultSet rs;
		String cname = "",password="",address="",email="",phone="";
		double salary=0.0;
		EmployeeRegister emp = new EmployeeRegister();
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/db";
		String uname = "root";
		String pass = "password";
		con = DriverManager.getConnection(url, uname, pass);
		System.out.println(session.getAttribute("EmpID"));
		String sql = "select * from employee where empregister_id=" + session.getAttribute("EmpID") + "";
		Statement st = con.createStatement();
		rs = st.executeQuery(sql);
		while (rs.next()) {
			cname = rs.getString("name");
			
			salary=(rs.getDouble("salary"));
			email=(rs.getString("email"));
			password=(rs.getString("password"));
			address=(rs.getString("address"));
			phone=(rs.getString("phone"));
		}
	%>

	<!--==========================
    Header
  ============================-->
	<header id="header">
	<div class="container-fluid">

		<div id="logo" class="pull-left">
			<h1>
				<a href="index.jsp" class="scrollto">EPEsystem </a>
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

	</div>
	</header>


	<div class="container col-sm-4" style="margin-top: 90px;">
		<div class="shadow-lg p-5 mb-5 bg rounded z-depth-5"
			style="opacity: 0.8;">


			<h2
				style="color: white; text-align: center; font-family: Trebuchet MS; font-weight: bold;">Employee
				Registration Form</h2>



			<br /> <font color="red"><s:actionerror /></font>
			<form class="form-horizontal" action="updateemployee">
				<!--<form class="form-inline">-->
				<div class="form-group row">

					<div class="col-sm-12">
						<input type="text" class="form-control" id="empname"
							name="empname" value="<%=cname%>"
							style="color: white; font-family: Trebuchet MS; font-size: 16px; font-weight: bold;">
						<font color="red"><s:fielderror fieldName="e.empname"></s:fielderror></font>

					</div>
				</div>

				<div class="form-group row">

					<div class="col-sm-12">
						<input type="password" class="form-control" id="city"
							value="<%=password%>" name="emppass"
							style="color: white; font-family: Trebuchet MS; font-size: 16px; font-weight: bold;">
						<font color="red"><s:fielderror fieldName="e.emppass"></s:fielderror></font>
						<input type="checkbox" onclick="myFunction()"><label
							style="color: gray; font-family: Trebuchet MS; font-size: 14px;">
							&nbsp;Show Password</label>
					</div>
				</div>

				<div class="form-group row">

					<div class="col-sm-12">
						<input type="email" class="form-control" id="email"
							value="<%=email%>" name="empemail"
							style="color: white; font-family: Trebuchet MS; font-size: 16px; font-weight: bold;">
						<font color="red"><s:fielderror fieldName="e.empemail"></s:fielderror></font>
					</div>
				</div>

				<div class="form-group row">

					<div class="col-sm-12">
						<input type="text" class="form-control" id="salary"
							value="<%=salary%>" name="empsalary"
							style="color: white; font-family: Trebuchet MS; font-size: 16px; font-weight: bold;">
						<font color="red"><s:fielderror fieldName="e.empsalary"></s:fielderror></font>
					</div>
				</div>

				<div class="form-group row">

					<div class="col-sm-12">
						<input class="form-control" id="address" rows="3" type="text"
							value="<%=address%>" name="empaddress"
							style="color: white; font-family: Trebuchet MS; font-size: 16px; font-weight: bold;">
						<font color="red"><s:fielderror fieldName="e.empaddress"></s:fielderror></font>
					</div>
				</div>

				<div class="form-group row">

					<div class="col-sm-12">
						<input type="text" class="form-control" id="ph"
							value="<%=phone%>" name="empphone"
							style="color: white; font-family: Trebuchet MS; font-size: 16px; font-weight: bold;">
						<font color="red"><s:fielderror fieldName="e.empphone"></s:fielderror></font>
					</div>
				</div>
				<div class="form-group row">

					<div class="col-sm-12">
						<button type="submit" class="btn  btn-lg btn-block"
							style="border-radius: 10px; font-family: Trebuchet MS; color: white; font-size: 16px; background-color: #4AA5D5;">Update
							Employee</button>
					</div>
				</div>


			</form>

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
	<script src="js/jquery.js"></script>

	<script src="lib/jquery/jquery.validate.min.js"></script>
	<script>
		$('form').validate({
			rules : {
				empname : {
					required : true,
					maxlength : 20
				},
				empemail : {
					required : true,
					email : true
				},
				empphone : {
					required : true,
					number : true,
					minlength : 11
				},
				emppass : {
					required : true,
					minlength : 6

				},
				empaddress : {
					required : true
				}

			}
		});
	</script>
	<script>
		function myFunction() {
			var x = document.getElementById("city");
			if (x.type === "password") {
				x.type = "text";
			} else {
				x.type = "password";
			}
		}
	</script>

</body>
</html>
