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

String a1=request.getParameter("name");
String a2=request.getParameter("pass");

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medicalreport","root","root");
PreparedStatement pst =con.prepareStatement("select count(*),id from pati where id='"+a1+"' and passw='"+a2+"'");
ResultSet rs=pst.executeQuery();
int a=0;
String recid="";
while(rs.next()){
	
	a=rs.getInt(1);
	recid=rs.getString(2);
}
if(a==0){
	response.sendRedirect("patient.jsp?m=Login Details Wrong");
	
}
else if(a==1){
	
	session.setAttribute("patiid", recid);
	response.sendRedirect("patienthome.jsp");
	
}


%>
</body>
</html>