<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Medical</title>
<meta name="description" content="">
<meta name="author" content="">

<!-- Favicons
    ================================================== -->
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon" href="img/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="72x72" href="img/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114" href="img/apple-touch-icon-114x114.png">

<!-- Bootstrap -->
<link rel="stylesheet" type="text/css"  href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="fonts/font-awesome/css/font-awesome.css">

<!-- Stylesheet
    ================================================== -->
<link rel="stylesheet" type="text/css"  href="css/style.css">
<link href="https://fonts.googleapis.com/css?family=Raleway:300,400,500,600,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Rochester" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
     <style>
 body  {
  background-image: url("img/bg.png");
  background-color: #cccccc;
  background-size:cover;
  
} 
</style> 
</head>
<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">
<!-- Navigation
    ==========================================-->
<nav id="menu" class="navbar navbar-default navbar-fixed-top">
  <div class="container"> 
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
    </div>
    
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    <h1 style="font-weight: bold;color: red">Enhancing Data Security in Cloud Using Blockchain</h1></br>
      <ul class="nav navbar-nav">
        <li > <a href="adminhome.jsp">Home</a> </li>
        <li> <a href="adoc.jsp">Add Doctor</a> </li>
        <li  class="active"> <a href="arec.jsp">Add Receptionist</a> </li>
		<li><a href="vdoc.jsp">View Doctor</a></li>
		<li><a href="vrec.jsp">View Receptionist</a></li>
		<li><a href="vpat.jsp">View Patients</a></li>
		<li><a href="index.html">Logout</a></li>
      </ul>
    </div>
    <!-- /.navbar-collapse --> 
  </div>
</nav>
<!-- Header -->
<header id="header">
  <!-- <div class="intro"> -->
    <div class="overlay">
      <div class="container">
        <div class="row">
          <div class="intro-text">
            
          </div>
        </div>
      </div>
    </div>
</header>

<div align="center">
<form action="arecb.jsp" style="">
<h3 style="font-weight: bold;color: blue;">Receptionist Details</h3>
<table>

<tr><td>Receptionist Name</td><td><input type="text" name="a1" required="required"></td></tr>
<tr><td>Number</td><td><input type="number" name="a2" required="required"></td></tr>
<tr><td>Email</td><td><input type="email" name="a3" required="required"></td></tr>
<tr><td>Address</td><td><input type="text" name="addr" required="required"></td></tr>

<tr><td>Password</td><td><input type="password" name="pass" required="required"></td></tr>

</table>
<input type="submit" value="Add">

</form>

</div>

<script type="text/javascript" src="js/jquery.1.11.1.js"></script> 
<script type="text/javascript" src="js/bootstrap.js"></script> 
<script type="text/javascript" src="js/SmoothScroll.js"></script> 
<script type="text/javascript" src="js/jqBootstrapValidation.js"></script> 
<script type="text/javascript" src="js/contact_me.js"></script> 
<script type="text/javascript" src="js/main.js"></script>
</body>
</html>
