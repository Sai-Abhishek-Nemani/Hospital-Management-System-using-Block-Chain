<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<%@page import="java.text.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="java.lang.*" %>
<%@page import="java.util.Date" %>
<%@page import=" java.math.BigInteger" %>
<%@page import=" java.security.MessageDigest" %>
<%@page import=" java.security.NoSuchAlgorithmException" %>
<%
String brln =  "\n"; 
String id=request.getParameter("pid");
String report=request.getParameter("report");

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medicalreport","root","root");

String record="";


PreparedStatement pdd=con.prepareStatement("select aes_decrypt(record,'key') from pati where id='"+id+"'");
ResultSet rd=pdd.executeQuery();
while(rd.next()){
	
	record=rd.getString(1);
}
System.out.println(record);


String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());


System.out.println("update pati set record=aes_encrypt(concat('"+record+"','------Start------','"+brln+"','Doc ID: "+session.getAttribute("docid")+"' Time:','"+time+"','"+brln+"','"+report+"','"+brln+"------End------"+brln+"'),'key') where id='"+id+"'");


String sql="update pati set record=aes_encrypt(concat('"+record+"','------Start------','"+brln+"','Doc ID: "+session.getAttribute("docid")+" Time:','"+time+"','"+brln+"','"+report+"','"+brln+"------End------"+brln+"'),'key') where id='"+id+"'";


System.out.println("=========== "+sql);


//record=record+brln+"','------Start------','"+brln+"','Doc ID: "+session.getAttribute("docid")+" Time: ' ,CURRENT_TIMESTAMP(),'"+brln+"','"+report+"','"+brln+"','------End------';
//String record1="------Start------"+brln+"Doc ID: "+session.getAttribute("docid")+" Time:"+time+brln+report+brln+"------End------"+brln;
//System.out.println("==============================="+record+"==========================");

PreparedStatement ps=con.prepareStatement("update pati set record=aes_encrypt(concat('"+record+"','------Start------','"+brln+"','Doc ID: "+session.getAttribute("docid")+" Time:','"+time+"','"+brln+"','"+report+"','"+brln+"------End------"+brln+"'),'key') where id='"+id+"'");



//PreparedStatement ps=con.prepareStatement("update pati set record=aes_encrypt(CONCAT(aes_decrypt(record,'key'),'"+brln+"','------Start------','"+brln+"','Doc ID: "+session.getAttribute("docid")+" Time: ' ,CURRENT_TIMESTAMP(),'"+brln+"','"+report+"','"+brln+"','------End------'),'key') where id='"+id+"'");


//System.out.println("update pati set record=CONCAT(record,'"+brln+"','------Start------','"+brln+"', 11111(),'"+brln+"','"+report+"','"+brln+"','------End------')");



ps.executeUpdate();

String input=report;

try {
	// getInstance() method is called with algorithm SHA-1
	MessageDigest md = MessageDigest.getInstance("SHA-1");

	// digest() method is called
	// to calculate message digest of the input string
	// returned as array of byte
	byte[] messageDigest = md.digest(input.getBytes());

	// Convert byte array into signum representation
	BigInteger no = new BigInteger(1, messageDigest);

	// Convert message digest into hex value
	String hashtext = no.toString(16);

	// Add preceding 0s to make it 32 bit
	while (hashtext.length() < 32) {
		hashtext = "0" + hashtext;
	}

	// return the HashText
	System.out.println(hashtext);
	System.out.println("insert into blocks(shaid,pid,did,data) values('"+hashtext+"','"+id+"','"+session.getAttribute("docid")+"','"+report+"' ");
	
	
	PreparedStatement po=con.prepareStatement("insert into blocks(shaid,pid,did,data) values('"+hashtext+"','"+id+"','"+session.getAttribute("docid")+"','"+report+"' )");
	
	po.executeUpdate();
	
	
}

// For specifying wrong message digest algorithms
catch (NoSuchAlgorithmException e) {
	throw new RuntimeException(e);
}








response.sendRedirect("addrep.jsp?id="+id);

//update pati set record=recordCONCAT('W3Schools', '.com');
%>

</body>
</html>