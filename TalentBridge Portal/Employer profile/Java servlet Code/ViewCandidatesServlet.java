package com.demo;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

@WebServlet("/viewCandidates")
public class ViewCandidatesServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ArrayList<Candidate> candidateList = new ArrayList<>();
        String jdbcURL = "jdbc:mysql://localhost:3306/jobi";
        String dbUser = "root";
        String dbPassword = "Nithi@1027";

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("JDBC Driver Loaded");

            // Establish database connection
            try (Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword)) {
                System.out.println("Database connected successfully");

                // Execute query
                String query = "SELECT * FROM candidatedetails";
                try (Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(query)) {
                    while (rs.next()) {
                        Candidate c = new Candidate();
                        c.setFullName(rs.getString("FullName"));
                        c.setEmailId(rs.getString("EmailId"));
                        c.setContactNumber(rs.getLong("ContactNumber"));
                        c.setLocation(rs.getString("location"));
                        c.setLinkedIn(rs.getString("LinkedIn"));
                        c.setPortfolio(rs.getString("portfolio"));
                        c.setSummary(rs.getString("Summary"));
                        c.setDegree(rs.getString("Degree"));
                        c.setInstitution(rs.getString("Institution"));
                        c.setYearOfGraduation(rs.getInt("YearOfGraduation"));
                        c.setPercentage(rs.getString("percentage"));
                        c.setJobTitle(rs.getString("JobTitle"));
                        c.setCompanyName(rs.getString("companyName"));
                        c.setKeyResponsibilities(rs.getString("KeyResponsibilities"));
                        c.setSkills(rs.getString("Skills"));
                        c.setCertification(rs.getString("Certification"));
                        c.setJobPreference(rs.getString("jobPreference"));

                        candidateList.add(c);
                        System.out.println("Candidate added: " + c.getFullName());
                    }
                }
            }

        } catch (ClassNotFoundException e) {
            System.out.println("JDBC Driver not found: " + e.getMessage());
        } catch (SQLException e) {
            System.out.println("Database error: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Unexpected error: " + e.getMessage());
        }

        // Pass the list to JSP
        request.setAttribute("candidates", candidateList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("Employee.jsp");
        dispatcher.forward(request, response);
    }
}
