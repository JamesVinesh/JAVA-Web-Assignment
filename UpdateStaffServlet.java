package controller;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import model.Staff;  

@WebServlet("/UpdateStaff")
public class UpdateStaffServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        Staff staff = new Staff();
        staff.setId(request.getParameter("id"));
        staff.setName(request.getParameter("name"));
        staff.setTel(request.getParameter("tel"));
        staff.setEmail(request.getParameter("email"));
        staff.setRole(request.getParameter("role"));

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/Appliance", "James", "1234");

            String sql = "UPDATE USERS SET NAME=?, TEL=?, EMAIL=?, ROLE=? WHERE ID=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, staff.getName());
            ps.setString(2, staff.getTel());
            ps.setString(3, staff.getEmail());
            ps.setString(4, staff.getRole());
            ps.setString(5, staff.getId());

            int rowsAffected = ps.executeUpdate();
            conn.close();

            if (rowsAffected > 0) {
                HttpSession session = request.getSession();
                session.setAttribute("updatedStaff", staff); // you can change the name as needed
                response.sendRedirect("StaffDetails.jsp");
            } else {
                response.getWriter().println("Update failed: No staff found with ID " + staff.getId());
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Update failed: " + e.getMessage());
        }
    }
}
