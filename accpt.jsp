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

<%

String a1=request.getParameter("id");

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medicalreport","root","root");
PreparedStatement pst =con.prepareStatement("update docreq set sts='Accepted' where id='"+a1+"'");
pst.executeUpdate();
response.sendRedirect("docreq.jsp?msg=Request Accepted");




%>
</body>
</html>