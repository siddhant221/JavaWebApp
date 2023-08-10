

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;

/**
 * Servlet implementation class loginuser
 */
public class loginuser extends HttpServlet {
	public void service(HttpServletRequest req,HttpServletResponse resp) throws IOException
	{
		String email = req.getParameter("email");
		String password=req.getParameter("password");
		
		PrintWriter pw=resp.getWriter();
		pw.print(email+password);
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3307/siddhant","root","");
			PreparedStatement ps=conn.prepareStatement("select * from user_details where uemail=? AND upassword=?");
			ps.setString(1, email);
			ps.setString(2, password);
			
			ResultSet rs=ps.executeQuery();
			int c=0;
			while(rs.next())
			{
				c++;
			}
			pw.print(c);
			if(c==1)
			{
				HttpSession session=req.getSession();
				session.setAttribute("uemail",email);
				resp.sendRedirect("userhome.jsp");
			}
			else {
				resp.sendRedirect("index.jsp");
			}
		}
		catch(Exception e)
		{
			pw.print("sorry error");
		}
	}
	

	
}
