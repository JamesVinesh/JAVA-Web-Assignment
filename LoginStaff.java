package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Staff;

@WebServlet("/Loginstaff")
public class LoginStaff extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String host = "jdbc:derby://localhost:1527/Appliance";
    private static final String user = "James";
    private static final String pwd = "1234";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        response.setContentType("text/html;charset=UTF-8");

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection(host, user, pwd);

            String checkEmail = "SELECT NAME, PASSWORD, ROLE FROM USERS WHERE EMAIL = ?";
            PreparedStatement stmt = conn.prepareStatement(checkEmail);
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();

            if (!rs.next()) {
                response.sendRedirect("Loginstaff.jsp?error=email");
            } else {
                String dbPassword = rs.getString("PASSWORD");
                if (dbPassword.equals(password)) {
                    Staff staff = new Staff();
                    staff.setEmail(email);
                    staff.setPassword(password);
                    staff.setName(rs.getString("NAME"));
                    staff.setRole(rs.getString("ROLE"));

                    HttpSession session = request.getSession();
                    session.setAttribute("staff", staff);

                    response.sendRedirect("ManagerPage.jsp");
                } else {
                    response.sendRedirect("Loginstaff.jsp?error=password");
                }
            }

            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("Loginstaff.jsp?error=server");
        }
    }
}
