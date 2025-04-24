package controller;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/DeleteStaffServlet")
public class DeleteStaffServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String id = request.getParameter("id");

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/Appliance", "James", "1234");

            String sql = "DELETE FROM USERS WHERE ID=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);

            ps.executeUpdate();
            ps.close();
            conn.close();
            
            response.sendRedirect("StaffDetails.jsp");
            
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Update failed: " + e.getMessage());
        }
    }
}
