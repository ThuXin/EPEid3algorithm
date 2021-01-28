<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
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
  <!-- Favicons 
  <link href="img/favicon.png" rel="icon">
  <link href="img/apple-touch-icon.png" rel="apple-touch-icon"> -->

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Montserrat:300,400,500,700" rel="stylesheet">

  <!-- Bootstrap CSS File -->
  <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Libraries CSS Files -->
  <link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="lib/animate/animate.min.css" rel="stylesheet">
  <link href="lib/ionicons/css/ionicons.min.css" rel="stylesheet">
  <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
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
  body{
  background-image:url(img/bird-s-eye-view-photography-of-high-rise-buildings-2304917.jpg);
  background-repeat:no-repeat;
  background-position: center center;
  background-size: cover;
  background-attachment: fixed;
  opacity:0.8px;
  }
  input[type=text],input[type=password],input[type=checkbox]{
  background-color: transparent !important;
  color:white;
  border-color:white;
  }
  .bg{
  background-color:black;
  opacity:0.1;
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
        <h1><a href="index.jsp" class="scrollto">EPEsystem
        </a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="#intro"><img src="img/logo.png" alt="" title="" /></a>-->
      </div>

       <nav id="nav-menu-container">
        <!--  <li class="menu-active"><a href="index.jsp">Home</a></li>
          <li><a href="index.jsp#about">About Us</a></li>
          <li><a href="index.jsp#services">Services</a></li>
          <li><a href="index.jsp#portfolio">Portfolio</a></li>
          <li><a href="index.jsp#team">Team</a></li>
	     <li><a href="login.jsp">Sign In</a></li>
          <li><a href="index.jsp#contact">Contact</a></li>-->
      </nav><!-- #nav-menu-container -->
    </div>
  </header><!-- #header -->

  <!--==========================
      login Section
    ============================-->
 <div class="container col-sm-4">
      <div class="shadow-lg p-5 mb-5 bg rounded z-depth-5" style="opacity: 0.8;margin-top:90px;">
        
      
        <h2 style="color:white;text-align:center;font-family: Trebuchet MS; font-weight:bold;">Login Form</h2>
      
      <br/>
    
    <font color="red"><s:actionerror/></font>
    
    <s:form class="form-horizontal" action="logingo" >
    <!--<form class="form-inline">-->
    <div class="form-group row">
     
      <div class="col-sm-12 p">
      
        <input type="text" class="form-control  id="empname" placeholder="username" name="adloginname" style="color:white;font-family:Trebuchet MS;font-size:16px;font-weight:bold;">
        <font color="red"><s:fielderror fieldName="adloginname"></s:fielderror></font>
        
      </div>
    </div>
    
    <div class="form-group row ">
      
      <div class="col-sm-12 p">
     
        <input type="password" class="form-control" id="myInput" placeholder="password" name="adloginpas" style="color:white;font-family:Trebuchet MS;font-size:16px;font-weight:bold;">
        <font color="red"><s:fielderror fieldName="adloginpas"></s:fielderror></font><br>
         <input type="checkbox" onclick="myFunction()"><label style="color:gray;font-family:Trebuchet MS;font-size:14px;"> &nbsp;Show Password</label>
        
      </div>
    </div>
   
    
  
    

      <div class="form-group row">
                
          <div class="col-sm-8">
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="rad" id="inlineRadio3" value="hradmin" checked="checked">
              <label class="form-check-label" for="inlineRadio3" style="color:white;font-family:Trebuchet MS;font-size:16px;font-weight:bold;">HR Admin</label>
            </div>
            <br>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="rad" id="inlineRadio1" value="systemadmin">
              <label class="form-check-label" for="inlineRadio1" style="color:white;font-family:Trebuchet MS;font-size:16px;font-weight:bold;">Team Leader</label>
            </div><br>          

            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="rad" id="inlineRadio2" value="manager">
              <label class="form-check-label" for="inlineRadio2" style="color:white;font-family:Trebuchet MS;font-size:16px;font-weight:bold;">Manager</label>
            </div>
            <br>
            
          </div>
      </div>
    
    <div class="form-group row">
      
         <div class="col-sm-12">
        <button type="submit" class="btn  btn-lg btn-block" style="border-radius:10px;font-family:Trebuchet MS;font-size:16px;color:white;background-color:#4AA5D5;">Login</button>
        </div>
    </div>
   
    </s:form>  
   </div>
   </div>   
    <!--==========================
      Contact Section
    ============================-->
    <!--<section id="contact" class="section-bg wow fadeInUp">
      <div class="container">

        <div class="section-header">
          <h3>Contact Us</h3>
          <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque</p>
        </div>

        <div class="row contact-info">

          <div class="col-md-4">
            <div class="contact-address">
              <i class="ion-ios-location-outline"></i>
              <h3>Address</h3>
              <address>A108 Adam Street, NY 535022, USA</address>
            </div>
          </div>

          <div class="col-md-4">
            <div class="contact-phone">
              <i class="ion-ios-telephone-outline"></i>
              <h3>Phone Number</h3>
              <p><a href="tel:+155895548855">+1 5589 55488 55</a></p>
            </div>
          </div>

          <div class="col-md-4">
            <div class="contact-email">
              <i class="ion-ios-email-outline"></i>
              <h3>Email</h3>
              <p><a href="mailto:info@example.com">info@example.com</a></p>
            </div>
          </div>

        </div>

        <div class="form">
          <div id="sendmessage">Your message has been sent. Thank you!</div>
          <div id="errormessage"></div>
          <form action="" method="post" role="form" class="contactForm">
            <div class="form-row">
              <div class="form-group col-md-6">
                <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
                <div class="validation"></div>
              </div>
              <div class="form-group col-md-6">
                <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" data-rule="email" data-msg="Please enter a valid email" />
                <div class="validation"></div>
              </div>
            </div>
            <div class="form-group">
              <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject" />
              <div class="validation"></div>
            </div>
            <div class="form-group">
              <textarea class="form-control" name="message" rows="5" data-rule="required" data-msg="Please write something for us" placeholder="Message"></textarea>
              <div class="validation"></div>
            </div>
            <div class="text-center"><button type="submit">Send Message</button></div>
          </form>
        </div>

      </div>
    </section><!-- #contact -->

  </main>

  <!--==========================
    Footer
  ============================-->
  <%-- <footer id="footer">  
    <div class="footer-top">
      <div class="container">
        <div class="row">

          <div class="col-lg-3 col-md-6 footer-info">
            <h3>EPEsystem</h3>
            <p> Employee Performance Evaluation System is a system to determine the performance of the staff. 
This system is a valuable tool for any business.
This system is to solve the problem of increasing the disqualified staffs.
This system is to help for increasing beliefs between each other as well as increasing in rank for organizations that have professional staffs. 
            </p>
          </div>

          <div class="col-lg-3 col-md-6 footer-links">
            <h4>Useful Links</h4>
            <ul>
              <li><i class="ion-ios-arrow-right"></i> <a href="#">Home</a></li>
              <li><i class="ion-ios-arrow-right"></i> <a href="#about">About us</a></li>
              <li><i class="ion-ios-arrow-right"></i> <a href="#team">Team</a></li>
            </ul>
          </div>

          <div class="col-lg-3 col-md-6 footer-contact">
            <h4>Contact Us</h4>
            <p>
              ICTRC <br>
              Yangon<br>
              Myanmar <br>
              <strong>Phone:</strong> 09691608223<br>
              <strong>Email:</strong> admin@epesystem.com<br>
            </p>

            <div class="social-links">
              <a href="#" class="twitter"><i class="fa fa-twitter"></i></a>
              <a href="#" class="facebook"><i class="fa fa-facebook"></i></a>
              <a href="#" class="instagram"><i class="fa fa-instagram"></i></a>
              <a href="#" class="google-plus"><i class="fa fa-google-plus"></i></a>
              <a href="#" class="linkedin"><i class="fa fa-linkedin"></i></a>
            </div>

          </div>

          <div class="col-lg-3 col-md-6 footer-newsletter">
            <h4>Our Newsletter</h4>
            <p>Without performance evaluation ,employee may not see how their work helps the company succeed on a large scale ,and this can decrease motivation when employees do not see the results of their efforts.
            </p>
            <form action="" method="post">
              <input type="email" name="email"><input type="submit"  value="Subscribe">
            </form>
          </div>

        </div>
      </div>
    </div>

    <div class="container">
      <div class="copyright">
        &copy; Copyright <strong>IMCEITS</strong>. All Rights Reserved
      </div>
      <div class="credits">
        
          All the links in the footer should remain intact.
          You can delete the links only if you purchased the pro version.
          Licensing information: https://bootstrapmade.com/license/
          Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=BizPage
        
       
      </div>
    </div>
  </footer> --%>

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
function myFunction() {
	  var x = document.getElementById("myInput");
	  if (x.type === "password") {
	    x.type = "text";
	  } else {
	    x.type = "password";
	  }
	} 
</script>
  
</body>
</html>
