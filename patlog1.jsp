<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="java.sql.*" %>

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

String a1=request.getParameter("a1");
String a2=request.getParameter("a2");

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medicalreport","root","root");
PreparedStatement pst =con.prepareStatement("select count(*),email,passw from pati where id='"+a1+"' and email='"+a2+"' or id='"+a1+"' and phno='"+a2+"'");
ResultSet rs=pst.executeQuery();
int a=0;
String emaill="";
String paswd="";
while(rs.next()){
	
	a=rs.getInt(1);
	emaill=rs.getString(2);
	paswd=rs.getString(3);
}
if(a==0){
	response.sendRedirect("forget.jsp?m= Details not Found ");
	
}
else if(a==1){
	


try
	{
		
				
				
				String host="", user="", pass="";

				host ="smtp.gmail.com"; //"smtp.gmail.com";

				user ="januram513@gmail.com"; //"YourEmailId@gmail.com" // email id to send the emails

				pass ="janakiram"; //Your gmail password

				String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";

				String to =emaill; // out going email id

				String from ="januram513@gmail.com"; //Email id of the recipient
				String subject="Block chain Password Recovery";
				//String subject ="welcome";

				String messageText ="Hi , <br> Your PAssword is : <h1>"+paswd+"</h1>";


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
	
	
	
	
	//session.setAttribute("patiid", recid);
	response.sendRedirect("forget.jsp?m=Password sended to your mail");
	
}


%>
</body>
</html>