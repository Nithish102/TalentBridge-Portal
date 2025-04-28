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

@WebServlet("/logincan")
public class logincan extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobi", "root", "Nithi@1027");
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM candidate WHERE EmailId=? AND Password=?");
            ps.setString(1, request.getParameter("Email"));
            ps.setString(2, request.getParameter("Password"));
            ResultSet rs=  ps.executeQuery();
            PrintWriter out = response.getWriter();
            if(rs.next()) {
            	
            	 HttpSession session = request.getSession();
                 session.setAttribute("userName", rs.getString("FullName"));
      
                 
                PreparedStatement pt1 = conn.prepareStatement("SELECT * FROM candidateDetails WHERE EmailId=?");
 				pt1.setString(1, request.getParameter("Email"));
 				ResultSet rs1 = pt1.executeQuery();

 				if (rs1.next()) {
 					// Store user profile details in session
 					 session.setAttribute("userName", rs1.getString("FullName"));
 	                 session.setAttribute("Email", rs1.getString("EmailId"));
 	                 session.setAttribute("Phonenum", rs1.getString("ContactNumber"));
 	                 session.setAttribute("location", rs1.getString("location"));
 	                 session.setAttribute("linkedid", rs1.getString("LinkedIn"));
 	                 session.setAttribute("portfolio", rs1.getString("Portfolio"));
 	                 session.setAttribute("professional", rs1.getString("Summary"));
 	                 session.setAttribute("degree", rs1.getString("Degree"));
 	                 session.setAttribute("institution", rs1.getString("Institution"));
 	                 session.setAttribute("yog", rs1.getString("YearofGraduation"));
 	                 session.setAttribute("percentage", rs1.getString("percentage"));
 	                 session.setAttribute("jobTitle", rs1.getString("JobTitle"));
 	                 session.setAttribute("companyName", rs1.getString("companyName"));
 	                 session.setAttribute("key", rs1.getString("Keyresponsibilities"));
 	                 session.setAttribute("skills", rs1.getString("Skills"));
 	                 session.setAttribute("certification", rs1.getString("Certification"));
 	                 session.setAttribute("resume", rs1.getString("ResumeUpload"));
 	                 session.setAttribute("preference", rs1.getString("jobPreference"));
 				}

            	RequestDispatcher rd = request.getRequestDispatcher("candidate.jsp");
				rd.forward(request,response);
            }
            else {
            	RequestDispatcher gt = request.getRequestDispatcher("login.html");
				gt.include(request,response);
				out.println("<p style='margin-left: 41.5em; position:relative; bottom:20px; color: red;'>Invalid Username or Password</h2>");

            	
            }
            ps.close();
            conn.close();
		}
		catch(Exception e) {
			
			System.out.println(e.toString());
			
		}
	}

}
