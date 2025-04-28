package com.demo;



import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
@WebServlet("/registercan")
public class registercan extends HttpServlet {
	private static final long serialVersionUID = 1L;
       protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobi", "root", "Nithi@1027");
			PreparedStatement ptst = conn.prepareStatement("insert into candidate  values (?,?,?)");
			ptst.setString(1, request.getParameter("name")); 
			ptst.setString(2, request.getParameter("Email")); 
			ptst.setString(3, request.getParameter("Password")); 

			ptst.executeUpdate();
			ptst.close();
			conn.close();
			
			RequestDispatcher rc = request.getRequestDispatcher("registersuccesscan.html");
			rc.forward(request,response);
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		
		
	}

}
