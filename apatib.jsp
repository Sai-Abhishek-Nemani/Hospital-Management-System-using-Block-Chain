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
String sql="";
String a1=request.getParameter("a1");
String a2=request.getParameter("a2");
String a3=request.getParameter("a3");
String a4=request.getParameter("a4");
String a5=request.getParameter("a5");
String a6=request.getParameter("a6");
String a7=request.getParameter("a7");
String pass=request.getParameter("pass");

System.out.println("select count(*) from pati where email='"+a4+"'");

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medicalreport","root","root");

 sql="insert into pati(name1,age,phno,email,addres,sympt,cat,passw,joiningtime,record) values('"+a1+"','"+a2+"','"+a3+"','"+a4+"','"+a5+"','"+a6+"','"+a7+"','"+pass+"',CURRENT_TIMESTAMP(),aes_encrypt('','key'))";
	System.out.println(sql);
	PreparedStatement pd=con.prepareStatement(sql);
	pd.executeUpdate();
	response.sendRedirect("apati.jsp?m=details added successfully Share password and and ID to Patient");



%>
</body>
</html>