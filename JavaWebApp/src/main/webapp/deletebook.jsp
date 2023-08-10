<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String bookISBNnum=request.getParameter("bookISBNnum");
//out.println(bookname+bookISBNnum+author+yearOFRelease+publisher);

try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3307/siddhant","root","");
	PreparedStatement ps=conn.prepareStatement("delete from addbook where bisbnnum=?");
	ps.setString(1,bookISBNnum);
	
	int x=ps.executeUpdate();
	if(x>0)
		out.println("Book Deleted!!");
	else
		out.println("Book Not Deleted");
		
	
}
catch(Exception e)
{
	out.println("A/C already exist");
}

%>