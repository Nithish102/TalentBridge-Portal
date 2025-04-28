package com.demo;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


@WebServlet("/loginemp")
public class loginemp extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobi", "root", "Nithi@1027");
			PreparedStatement ptst = conn.prepareStatement("SELECT * FROM employee WHERE EmailId=? AND Password=?");
			ptst.setString(1, request.getParameter("Email")); 
			ptst.setString(2, request.getParameter("Password")); 
			ResultSet rs = ptst.executeQuery();
			PrintWriter out = response.getWriter();
			if(rs.next()) {
				
		    	 HttpSession session = request.getSession();
                 session.setAttribute("userName", rs.getString("FullName"));
                 
                 
                PreparedStatement pt1 = conn.prepareStatement("SELECT * FROM employeeDetails WHERE email=?");
  				pt1.setString(1, request.getParameter("Email"));
  				ResultSet rs1 = pt1.executeQuery();
  				
  				if (rs1.next()) {
 					// Store user profile details in session
 					 session.setAttribute("empid", rs1.getString("empid"));
 	                 session.setAttribute("name", rs1.getString("name"));
 	                 session.setAttribute("email", rs1.getString("email"));
 	                 session.setAttribute("Phonenum", rs1.getString("mobileno"));
 	                 session.setAttribute("department", rs1.getString("department"));
 	                 session.setAttribute("role", rs1.getString("role"));
 	                 session.setAttribute("reporting", rs1.getString("reporting"));
 	                 session.setAttribute("location", rs1.getString("location"));
 	                 session.setAttribute("salary", rs1.getString("salary"));
 	                 session.setAttribute("bonus", rs1.getString("bonus"));
 	                 session.setAttribute("notes", rs1.getString("notes"));

  				}
				RequestDispatcher rd = request.getRequestDispatcher("Employee.jsp");
				rd.forward(request,response);
				
			}
			else {
				RequestDispatcher gh = request.getRequestDispatcher("login.html");
				gh.include(request,response);
				out.println("<p style='margin-left: 41.5em; position:relative; bottom:20px; color: red;'>Invalid Username or Password</h2>");
			}
				
			}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}

}
