<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
    String name=request.getParameter("name");
	String email=request.getParameter("email");
	String contact=request.getParameter("contact");
	String message=request.getParameter("message");
	out.println(name+" "+email+" "+contact+" "+" "+message+" ");
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3307/siddhant","root","");
	PreparedStatement ps=conn.prepareStatement("insert into contactpage values(?,?,?,?,?)");
	ps.setInt(5, 0);
	ps.setString(1,name);
	ps.setString(2,email);
	ps.setString(3,contact);
	ps.setString(4,message);
	int x=ps.executeUpdate();
	if(x>0)
		out.println("Contact Created");
	else
		out.println("Contact Exist");
		
	
}
catch(Exception e)
{
	out.println("contact exist");
}




%>