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


@WebServlet("/EmployeeDetails")
public class EmployeeDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobi", "root", "Nithi@1027");
			PreparedStatement ps = conn.prepareStatement("insert into employeeDetails  values (?,?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1, request.getParameter("EmployeeId"));
			ps.setString(2, request.getParameter("FullName"));
			ps.setString(3, request.getParameter("Email"));
			ps.setString(4, request.getParameter("Phnum"));
			ps.setString(5, request.getParameter("Department"));
			ps.setString(6, request.getParameter("Role"));
			ps.setString(7, request.getParameter("Manager"));
			ps.setString(8, request.getParameter("Location"));
			ps.setString(9, request.getParameter("Salary"));
			ps.setString(10, request.getParameter("Bonus"));
			ps.setString(11, request.getParameter("Notes"));
			
			int rs = ps.executeUpdate();
			if(rs>0) {
				  out.println("<script type='text/javascript'>");
				  out.println("alert('PROFILE SUCCESS FULLY UPDATED!');");
				  out.println("</script>");
	          	 RequestDispatcher rd = request.getRequestDispatcher("login.html");
				 rd.include(request,response);
			}
			else {
				out.println("sorry check you details");
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


