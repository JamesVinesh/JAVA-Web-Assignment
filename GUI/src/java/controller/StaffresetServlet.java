package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Asus
 */
@WebServlet("/StaffresetServlet")
public class StaffresetServlet extends HttpServlet {

    private static final String host = "jdbc:derby://localhost:1527/Appliance";
    private static final String user = "James";
    private static final String pwd = "1234";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String newPassword = request.getParameter("newpassword");
        String confirmPassword = request.getParameter("conpassword");
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("resetEmail");

        if (email == null) {
            response.getWriter().println("<script>alert('Session expired.'); window.location='forgetPassword.jsp';</script>");
            return;
        }

        if (!newPassword.equals(confirmPassword)) {
            response.getWriter().println("<script>alert('Passwords do not match.'); history.back();</script>");
            return;
        }

        try (Connection conn = DriverManager.getConnection(host, user, pwd)) {
            String sql = "UPDATE USERS SET PASSWORD = ? WHERE EMAIL = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, newPassword);
            stmt.setString(2, email);

            int updated = stmt.executeUpdate();
            if (updated > 0) {
                session.removeAttribute("resetEmail");
                response.getWriter().println("<script>alert('Password reset successful!'); window.location='Loginstaff.jsp';</script>");
            } else {
                response.getWriter().println("<script>alert('Password reset failed.'); history.back();</script>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<script>alert('Error updating password.'); history.back();</script>");
        }
    }
}

