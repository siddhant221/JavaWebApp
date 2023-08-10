<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    
    <%
    String cpass=request.getParameter("cpass");
    String npass=request.getParameter("npass");
    String confpass=request.getParameter("confpass");
    String uemail=session.getAttribute("uemail").toString();
    		
   // out.println(cpass+npass+confpass);
    if(npass.equals(confpass))
    {
    	try
    	{
    		Class.forName("com.mysql.jdbc.Driver");
    		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3307/siddhant","root","");
    		PreparedStatement ps=conn.prepareStatement("select * from user_details where uemail=? and upassword=? ");
    		ps.setString(1,uemail );
    		ps.setString(2,cpass);
    		ResultSet rs=ps.executeQuery();
    		int c=0;
    		while(rs.next())
    		{
    			c++;
    		}
    		if(c==1)
    		{
    			PreparedStatement pss=conn.prepareStatement("update user_details set upassword=? where uemail=?");
    	    	pss.setString(1, npass);
    	    	pss.setString(2, uemail);
    	    	int x=pss.executeUpdate();
    	    	if(x>0)
    	    		out.println("Password Updated!!");
    	    	else
    	    		out.println("Password Not Updated!!");
    	    		
    		}
    		else
    		{
    			out.println("Wrong Password!!");
    		}
    	}
    	catch(Exception e)
    	{
    		
    		}
    }
    else
    {
    	out.println("Please Input Correct Password..");
    }
    
    %>