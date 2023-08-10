<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%
String bisbnnum = request.getParameter("bookISBNnum");
//String bookISBNum="1";
try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/siddhant", "root", "");
    PreparedStatement ps = conn.prepareStatement("SELECT * FROM addbook WHERE bisbnnum=?");
    ps.setString(1, bisbnnum);
    

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
    } 
    
    
} catch (Exception e) {
    out.println("<p>An error occurred: " + e.getMessage() + "</p>");
}
%>
