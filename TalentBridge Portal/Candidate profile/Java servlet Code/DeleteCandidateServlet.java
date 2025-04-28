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

@WebServlet("/DeleteCandidateServlet")
public class DeleteCandidateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession(false); // fetch existing session
        if (session == null || session.getAttribute("Email") == null) {
            out.println("<p style='color:red;'>Session expired. Please login again.</p>");
            RequestDispatcher rd = request.getRequestDispatcher("login.html");
            rd.include(request, response);
            return;
        }

        String email = (String) session.getAttribute("Email");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobi", "root", "Nithi@1027");

            // Delete from candidateDetails first (child table if FK constraint exists)
            PreparedStatement ps1 = conn.prepareStatement("DELETE FROM candidateDetails WHERE EmailId=?");
            ps1.setString(1, email);
            ps1.executeUpdate();

            // Delete from candidate table
            PreparedStatement ps2 = conn.prepareStatement("DELETE FROM candidate WHERE EmailId=?");
            ps2.setString(1, email);
            int rows = ps2.executeUpdate();

            if (rows > 0) {
                session.invalidate(); // Clear session after deletion
                out.println("<p style='color:green; text-align:center;'>Your account has been deleted successfully.</p>");
                RequestDispatcher rd = request.getRequestDispatcher("deletesuccess.html");
                rd.include(request, response);
            } else {
                out.println("<p style='color:red; text-align:center;'>Unable to delete account. Please try again.</p>");
            }

            ps1.close();
            ps2.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p style='color:red; text-align:center;'>Something went wrong: " + e.getMessage() + "</p>");
        }
    }
}
