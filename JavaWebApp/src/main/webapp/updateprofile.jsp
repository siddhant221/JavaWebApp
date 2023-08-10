<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
    String name=request.getParameter("name");
	String email=request.getParameter("email");
	String contact=request.getParameter("contact");
	String gender=request.getParameter("gender");
	String address=request.getParameter("address");
	//String password=request.getParameter("password");
	//out.println(name+" "+email+" "+contact+" "+gender+" "+address+" "+password);
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3307/siddhant","root","");
	PreparedStatement ps=conn.prepareStatement("update user_details set uname=?,ucontact=?, ugender=?, uaddress=? where uemail=?");
	//ps.setInt(1, 0);
	ps.setString(1,name);
	ps.setString(5,email);
	ps.setString(2,contact);
	ps.setString(3,gender);
	ps.setString(4,address);
	//ps.setString(7,password);
	int x=ps.executeUpdate();
	if(x>0)
		out.println("user value updated");
	else
		out.println("not updated");
		
	
}
catch(Exception e)
{
	out.println("A/C already exist");
}




%>