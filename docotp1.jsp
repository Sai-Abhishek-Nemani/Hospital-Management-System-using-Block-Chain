<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>



<%
String pass=request.getParameter("pass");
String otp=session.getAttribute("dotpis").toString();

if(pass.equals(otp)){
	
	out.println("ssssssssss");
	response.sendRedirect("dvrec.jsp");
	
}else{
	
	response.sendRedirect("docotp2.jsp");

	out.println("fffffffffff	");
	
	
	
}


%>
</body>
</html>