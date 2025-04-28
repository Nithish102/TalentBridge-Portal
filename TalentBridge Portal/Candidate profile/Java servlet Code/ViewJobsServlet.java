package com.demo;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

@WebServlet("/viewJobs")
public class ViewJobsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Job> jobList = new ArrayList<>();

        String jdbcURL = "jdbc:mysql://localhost:3306/jobi";  // Update DB name if needed
        String dbUser = "root";
        String dbPassword = "Nithi@1027";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
            String sql = "SELECT * FROM postjob";  // Update table name if different

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Job job = new Job();
                job.setJobtitle(rs.getString("jobtit"));
                job.setDepartment(rs.getString("department"));
                job.setLocation(rs.getString("location"));
                job.setSalaryrange(String.valueOf(rs.getLong("salaryrange")));
                job.setJobtype(rs.getString("jobtype"));
                job.setExperience(rs.getString("experience"));
                job.setQualification(rs.getString("qualification"));
                job.setSkills(rs.getString("skills"));
                job.setEmail(rs.getString("email"));
                job.setContact(rs.getLong("contact"));
                job.setDescription(rs.getString("description"));

                jobList.add(job);
            }

            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("jobs", jobList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("candidate.jsp");
        dispatcher.forward(request, response);
    }
}
