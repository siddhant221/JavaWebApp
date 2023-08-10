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
<!-- <form action="updateprofile.jsp" method="post"> -->
<table border=2>
<tr>
<th>Name</th>
<td>
<input type="text" id="name" name="name" value="<% out.println(uname); %>"> </td>
</tr>
<tr>
<th>Email</th>
<td>
<input type="text" id="email" name="email" readonly value="<% out.println(uemail);  %>"> </td>
</tr>
<tr>
<th>Contact</th>
<td>
<input type="text" id="contact" name="contact" value="<% out.println(ucontact); %>"> </td>
</tr>
<tr>
<th>Gender</th>
<td>
<input type="text" id="gender" name="gender" value="<% out.println(ugender); %>"> </td>
</td>
</tr>
<tr>
<th>address</th>
<td>
<input type="text" id="address" name="address" value="<% out.println(uaddress); %>"> </td>
</td>
</tr>
<tr>
<th></th>
<td><input type="button" id="btn" value="SUBMIT" ></td>
</tr>
</table>
</center>

</div>
</div>
<div id="footer">Footer</div>
</div>
<script src="JS/jquery.js"></script>
<script>

$("document").ready(function(){
	$("#btn").click(function(){
	var name=$("#name").val();
	var email=$("#email").val();
	var contact=$("#contact").val();
	var gender=$("#gender").val();
	var address=$("#address").val();
	//var password=$("#password").val();
	//alert(name+email+contact+gender+address);
	$.post("updateprofile.jsp",{name:name, email:email, contact:contact, gender:gender, address:address}, function(data){
alert(data);
		});
		});
});
</script>
</body>
</html>