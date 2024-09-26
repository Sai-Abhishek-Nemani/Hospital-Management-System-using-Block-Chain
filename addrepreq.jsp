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

Class.forName("com.mysql.jdbc.Driver");

Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medicalreport","root","root");

PreparedStatement ps=con.prepareStatement("select count(*),sts from docreq where did='"+session.getAttribute("docid")+"' and pid='"+request.getParameter("id")+"'");

ResultSet rs=ps.executeQuery();

String sts="";int coun=0;
while(rs.next()){
	sts=rs.getString(2);
	coun=rs.getInt(1);
}


if(coun>0){
if(sts.equalsIgnoreCase("waiting")){
	
	response.sendRedirect("dvpati.jsp?You Already sent a request for report adding");
			
			
	
	
}

else{
	
response.sendRedirect("addrep.jsp?id="+request.getParameter("id")+"");
	
}


}
else{
	PreparedStatement pp=con.prepareStatement("insert into docreq(did,pid) values('"+session.getAttribute("docid")+"' ,'"+request.getParameter("id")+"')");
	pp.executeUpdate();
	
	response.sendRedirect("dvpati.jsp?msg=You send a request for adding reports into patients reports information");
}

%>

</body>
</html>