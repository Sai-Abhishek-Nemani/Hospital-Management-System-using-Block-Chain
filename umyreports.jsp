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
        <li > <a href="patienthome.jsp">Home</a> </li>
        <li > <a href="mydetails.jsp">My Profile</a> </li>
        <li class="active"> <a href="umyreports.jsp">My Reports</a> </li><li><a href="docreq.jsp">Doctor Request</a></li>
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
          
          
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
			 <%@ page import="javax.mail.internet.*,javax.activation.*"%>
			 <%@ page import="javax.servlet.http.*,javax.servlet.*"%>
			 <%@page import="java.util.*"%>
			 <%@page import="java.sql.*"%>
			 <%@page import="java.io.*"%>




			 <%@ page import="java.io.*,java.util.*,javax.mail.*"%>
			 <%@ page import="javax.mail.internet.*,javax.activation.*"%>
			 <%@ page import="javax.servlet.http.*,javax.servlet.*" %>
			 <%@page import="java.sql.*"%>
			 				<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
			 				<%@ page import="javax.mail.internet.*,javax.activation.*"%>
			 				<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
			 			
<%


Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medicalreport","root","root");
PreparedStatement pst =con.prepareStatement("select email from pati where id='"+session.getAttribute("patiid")+"' ");

String emaill="";
Random r = new Random( System.currentTimeMillis() );
int rr= ((1+ r.nextInt(9)) * 10000 + r.nextInt(10000));

session.setAttribute("otpis", rr);
//out.println(rr);
ResultSet rs=pst.executeQuery();
while(rs.next()){
	
	emaill=rs.getString(1);
	
}

%>          
          
<div align="center">

<form action="umyreports1.jsp" style="">
<p>Check Your Mail for OTP </p>

<h3 style="font-weight: bold;color: blue;">Submit OTP</h3>


<table>

<tr><td>Email</td><td><input type="text" name="name" readonly="readonly" value="<%=emaill %>" required="required"></td></tr>
<tr><td>OTP</td><td><input type="text" pattern="[0-9]{5}" name="pass"  required="required"></td></tr>

</table>
<input type="submit" value="View Reports">
</form>


</div>



<%



try
	{
		
				
				
				String host="", user="", pass="";

				host ="smtp.gmail.com"; //"smtp.gmail.com";

				user ="januram513@gmail.com"; //"YourEmailId@gmail.com" // email id to send the emails

				pass ="janakiram"; //Your gmail password

				String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";

				String to =emaill; // out going email id

				String from ="januram513@gmail.com"; //Email id of the recipient
				String subject="OTP for Your Report View";
				//String subject ="welcome";

				String messageText ="Hi , <br> Your OTP is : <h1>"+rr+"</h1>";


				session.setAttribute("toaddress",to);
				boolean sessionDebug = true;

				Properties props = System.getProperties();
				props.put("mail.host", host);
				props.put("mail.transport.protocol.", "smtp");
				props.put("mail.smtp.auth", "true");
				props.put("mail.smtp.", "true");
				props.put("mail.smtp.port", "465");
				props.put("mail.smtp.socketFactory.fallback", "false");
				props.put("mail.smtp.socketFactory.class", SSL_FACTORY);
				Session mailSession = Session.getDefaultInstance(props, null);
				mailSession.setDebug(sessionDebug);
				Message msg = new MimeMessage(mailSession);
				msg.setFrom(new InternetAddress(from));
				InternetAddress[] address = {new InternetAddress(to)};
				msg.setRecipients(Message.RecipientType.TO, address);
				msg.setSubject(subject);
				msg.setContent(messageText, "text/html; charset=utf-8"); // use setText if you want to send text
				Transport transport = mailSession.getTransport("smtp");
				transport.connect(host, user, pass);
				try 
				{
				transport.sendMessage(msg, msg.getAllRecipients());
				
				// response.sendRedirect("payments.jsp?msg=Amount Paid");

				//out.println("message successfully sended"); // assume it was sent
				//response.sendRedirect("sendcorier.jsp?message=Password is send to Your Mail Id");
				}
				catch (Exception err) {
					
					out.println("message not successfully sended"); // assume it’s a fail
					}
				transport.close();

		}
catch(Exception e)
{
	e.printStackTrace();
	}





%>            
          </div>
        </div>
      </div>
    </div>
</header>

<script type="text/javascript" src="js/jquery.1.11.1.js"></script> 
<script type="text/javascript" src="js/bootstrap.js"></script> 
<script type="text/javascript" src="js/SmoothScroll.js"></script> 
<script type="text/javascript" src="js/jqBootstrapValidation.js"></script> 
<script type="text/javascript" src="js/contact_me.js"></script> 
<script type="text/javascript" src="js/main.js"></script>
</body>
</html>
