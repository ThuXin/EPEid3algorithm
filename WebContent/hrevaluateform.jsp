<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="java.util.*"%>
<%@ page import="action.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Evaluate From HR Admin</title>
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
    <style>
    .header{
		overflow:hidden;
		background-color: #04B4AE;
		padding: 5px 5px;
		border-radius: 5px;
		height:30px;

	}
	.button{
		background-image: linear-gradient(-90deg, #04B4AE, #A9F5BC);
		border-radius: 10px;
	}
	body{
		background-image: url(img/bakcground.jpg);
    background-repeat: no-repeat;
    background-position: center center;
     background-size: cover;
      background-attachment: fixed;

	}
	.bg{
		background-color: black;
		opacity:0.1;
	}
	textarea{
  background-color:transparent !important ;
  color: white;
 border-color:white;
  }
      label {
        width: 25%;
        margin-left: 2em;
      }
      form {
        width: 45%;
        margin: auto auto;
      }
      .flex {
        display: flex;
        flex-wrap: nowrap;
      }
      input[type="submit"] {
        margin-left: 30%;
      }
      select {
        width: 150px;
        height: auto;
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
				<a href="index.jsp" class="scrollto">EPEsystem </a>
			</h1>
		</div>

		<nav id="nav-menu-container">
		<ul class="nav-menu">
			<li><a href="#"><s:property value="#session.username" /></a></li>
			<li><a href="login.jsp"><i class="fas fa-sign-out-alt"></i>&nbsp;LogOut</a></li>

		</ul>
		</nav>
		
	</div>
	</header>
	<!-- #header -->
	
		<%  Connection con;
        ResultSet rs;
        String cname=null;
        double salary=0.0;
    	Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost:3306/db";
		String uname="root";
		String pass="password";
		con=DriverManager.getConnection(url, uname, pass);
		System.out.println(session.getAttribute("EmpID"));
      String sql="select name,salary from employee where empregister_id="+session.getAttribute("EmpID")+""; 
               Statement st=con.createStatement();
               rs=st.executeQuery(sql);
               while(rs.next()){
            	   cname=rs.getString(1);
            	   salary=rs.getDouble(2);
            			   
               }%>
      
               
   <div class="container1" style="margin-top:90px;">
		<div class="shadow-lg p-5 mb-5 bg rounded z-depth-5" style="opacity: 0.8;">
		
	
      
 <div class="header n" style="margin-top: 10px; height: 50px;">

				<center>
					<font
						style="color: white; font-size: 20px; font-family: Trebuchet MS;">
						<marquee><h3 style="color:white; font-family:Trebuchet MS; ">Employee Performance Review</h3></marquee>
      
					</font>
				</center>


			</div>
			<br>
    
    <font color="red"><s:actionerror/></font>
    <s:form class="form-horizontal" action="hrevaluate" method="GET" >
    <div class="flex">
        <label for="name">Name</label>
        <label><%=cname %></label>
        
      </div>
      <br>

            <div class="flex">
        <label for="salary">Salary</label>
        <label><%=salary %></label>
      </div>
      <br>
      <div class="flex">
        <label for="id_a">Attendence</label>
        <select name="Attendence" id="attendence">
          <option value="above90%">Above 90%</option>
          <option value="75%-90%">75%-90%</option>
          <option value="below75%">Below 75%</option>
        </select>
      </div>
      <br>

      

      <div class="flex">
        <label for="id_es">English Skill</label>
        <select name="eng_skill"  id="id_es" >
          <option value="advance">Advance</option>
          <option value="intermediate">Intermediate</option>
          <option value="basic">Basic</option>
        </select>
      </div>
      <br>

     

            <div class="flex">
        <label for="id_jp">Job Position</label>
        <select name="job_position" id="id_jp" >
          <option value="Senior">Senior</option>
          <option value="junior">Junior</option>
        </select>
      </div>
      <br>
            
<div class="flex">
<label></label>
      <button type="submit" class="btn btn-lg " style="color:white; font-family:Trebuchet MS;border-radius:10px;font-size:16px;background-color:#4AA5D5" onclick=" return confirm('Are you sure you want to evaluate!!!!')">
      Evaluation</button>
      
      </div>
   
    </s:form>  
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
