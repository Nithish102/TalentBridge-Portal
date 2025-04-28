package com.demo;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


@WebServlet("/CandidateDetails")
public class CandidateDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobi", "root", "Nithi@1027");
		PreparedStatement ps = conn.prepareStatement("insert into candidateDetails  values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
		ps.setString(1, request.getParameter("FullName"));
		ps.setString(2, request.getParameter("Email"));
		ps.setString(3, request.getParameter("phnum"));
		ps.setString(4, request.getParameter("Address"));
		ps.setString(5, request.getParameter("LinkedIn"));
		ps.setString(6, request.getParameter("Profileinfo"));
		ps.setString(7, request.getParameter("Summary"));
		ps.setString(8, request.getParameter("Degree"));
		ps.setString(9, request.getParameter("Institution"));
		ps.setString(10, request.getParameter("Year passedout"));
		ps.setString(11, request.getParameter("percentage"));
		ps.setString(12, request.getParameter("jobTitle"));
		ps.setString(13, request.getParameter("CompanyName"));
		ps.setString(14, request.getParameter("responsibilities"));
		ps.setString(15, request.getParameter("skills"));
		ps.setString(16, request.getParameter("Certification"));
		ps.setString(17, request.getParameter("resume"));
		ps.setString(18, request.getParameter("jobpreferences"));
		
		int rs = ps.executeUpdate();
		if(rs>0) {
			
			  out.println("<script type='text/javascript'>");
			  out.println("alert('PROFILE SUCCESS FULLY UPDATED!');");
			  out.println("</script>");
          	 RequestDispatcher rd = request.getRequestDispatcher("login.html");
			 rd.include(request,response);
			 
			  
		}
		else {
			   out.println("<script type='text/javascript'>");
               out.println("alert('OOPS ERROR OCCURED TRY AGAIN!');");
               out.println("window.location.href='login.html';"); 
               out.println("</script>");
		}
		ps.close();
		conn.close();
	}
	catch(Exception e )
	{
		System.out.println(e.toString());
	}
	
	}

}
