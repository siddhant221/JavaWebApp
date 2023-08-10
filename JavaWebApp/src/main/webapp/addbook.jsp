<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String bookname=request.getParameter("bookname");
String bookISBNnum=request.getParameter("bookISBNnum");
String author=request.getParameter("author");
String yearOFRelease=request.getParameter("yearOFRelease");
String publisher=request.getParameter("publisher");
//out.println(bookname+bookISBNnum+author+yearOFRelease+publisher);

try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3307/siddhant","root","");
	PreparedStatement ps=conn.prepareStatement("insert into addbook values(?,?,?,?,?,?)");
	ps.setInt(1, 0);
	ps.setString(2,bookname);
	ps.setString(3,bookISBNnum);
	ps.setString(4,author);
	ps.setString(5,yearOFRelease);
	ps.setString(6,publisher);
	
	int x=ps.executeUpdate();
	if(x>0)
		out.println("Book Added!!");
	else
		out.println("Book already exist");
		
	
}
catch(Exception e)
{
	out.println("A/C already exist");
}

%>