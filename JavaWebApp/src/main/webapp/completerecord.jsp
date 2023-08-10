<%@page import="java.net.UnixDomainSocketAddress"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%
 String uemail=session.getAttribute("uemail").toString();
 String uname="";
 String ucontact="";
 String ugender="";
 String uaddress="";
 try
 {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3307/siddhant","root","");
		PreparedStatement ps=conn.prepareStatement("select * from user_details where uemail=?");
		ps.setString(1, uemail);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			uname=rs.getString(2);
			ucontact=rs.getString(4);
			ugender=rs.getString(5);
			uaddress=rs.getString(6);
		}
	
 }
 catch(Exception e){
 }
 
 %>
<html>
<head>
<title>KVCH Noida</title>
<link rel="stylesheet" href="css/userhome.css" />
</head>
<body>
<div>
<div id="header"><% out.println(uname); %></div>
<div id="content">
<div id="left">
<ul id="usermenu">
<li><a href="userhome.jsp">home</a></li>
<li><a href="manageprofile.jsp">manage profile</a></li>
<li><a href="addrecord.jsp">add record</a></li>
<li><a href="updaterecord.jsp">Update record</a></li>
<li><a href="deleterecord.jsp">delete record</a></li>
<li><a href="searchrecord.jsp">search record</a></li>
<li><a href="completerecord.jsp">complete record</a></li>
<li><a href="changepassword.jsp">change password</a></li>
<li><a href="logout.jsp">logout</a></li>
</ul>

</div>
<div id="right">

<center>
<%

try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/siddhant", "root", "");
    PreparedStatement ps = conn.prepareStatement("SELECT * FROM addbook");
    

    ResultSet rs = ps.executeQuery();

    while(rs.next()) {
    	//String bookISBNum= rs.getString("bookISBNum");
        String bookname = rs.getString("bname");
        String author = rs.getString("author");
        String yearOFRelease = rs.getString("year");
        String publisher = rs.getString("publisher");

        //out.println("<p>Book ISBN: " + bookISBNnum + "</p>");
        out.println("<p>Book Name: " + bookname + "</p>");
        out.println("<p>Author: " + author + "</p>");
        out.println("<p>Year of Release: " + yearOFRelease + "</p>");
        out.println("<p>Publisher: " + publisher + "</p>");
        out.println("************************************************");
    } 
    
    
} catch (Exception e) {
    out.println("<p>An error occurred: " + e.getMessage() + "</p>");
}
%>


</center>

</div>
</div>
<div id="footer">Footer</div>
</div>
</body>
</html>