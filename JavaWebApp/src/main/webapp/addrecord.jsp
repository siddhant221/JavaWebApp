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
<!-- <form action="addbook.jsp" method="post"> -->
<table border=2>
<tr>
<th>Book Name</th>
<td><input type="text" id="bookname" name="bookname" required></td>
</tr>
<tr>
<th>Book ISBN Number</th>
<td><input type="text" id="bookISBNnum" name="bookISBNnum" required></td>
</tr>
<tr>
<th>Author</th>
<td><input type="text" id="author" name="author" required></td>
</tr>
<tr>
<th>Year of Release</th>
<td><input type="text" id="yearOFRelease" name="yearOFRelease" required></td>
</tr>
<tr>
<th>Publisher</th>
<td><input type="text" id="publisher" name="publisher" required></td>
</tr>
<tr>
<th></th>
<td><input type="button" id="btn" value="ADD BOOK" /></td>
</tr>
</table>
<!-- </form> -->
</center>

</div>
</div>
<div id="footer">Footer</div>
</div>
</body>
</html>


<script src="JS/jquery.js"></script>
<script>
$("document").ready(function(){
$("#btn").click(function(){

var bookname=$("#bookname").val();
var bookISBNnum=$("#bookISBNnum").val();
var author=$("#author").val();
var yearOFRelease=$("#yearOFRelease").val();
var publisher=$("#publisher").val();
//alert(bookname+bookISBNnum+author+yearOFRelease+publisher);
$.post("addbook.jsp",{bookname:bookname,bookISBNnum:bookISBNnum,author:author,yearOFRelease:yearOFRelease,publisher:publisher},function(data){
	alert(data);
	$("#bookname").val('');
	$("#bookISBNnum").val('');
	$("#author").val('');
	$("#yearOFRelease").val('');
	$("#publisher").val('');
});	
});

	
});

</script>