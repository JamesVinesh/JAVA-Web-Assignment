package controller;

import model.Staff;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/CreateStaff")
public class addStaffServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private static final String host = "jdbc:derby://localhost:1527/Appliance";
    private static final String user = "James";
    private static final String pwd = "1234";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String tel = request.getParameter("tel");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        response.setContentType("text/html;charset=UTF-8");

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection(host, user, pwd);

            // Check if email already exists
            String checkSql = "SELECT COUNT(*) FROM USERS WHERE EMAIL = ?";
            PreparedStatement checkStmt = conn.prepareStatement(checkSql);
            checkStmt.setString(1, email);
            ResultSet rs = checkStmt.executeQuery();
            rs.next();
            int count = rs.getInt(1);

            if (count > 0) {
                response.getWriter().println("<script type='text/javascript'>");
                response.getWriter().println("alert('This email is already registered!');");
                response.getWriter().println("history.back();");
                response.getWriter().println("</script>");
            } else {
                String sql = "INSERT INTO USERS (NAME, TEL, EMAIL, PASSWORD, ROLE) VALUES (?, ?, ?, ?, ?)";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, name);
                stmt.setString(2, tel);
                stmt.setString(3, email);
                stmt.setString(4, password);
                stmt.setString(5, role);

                int result = stmt.executeUpdate();
                stmt.close();

                if (result > 0) {
                    Staff staff = new Staff();
                    staff.setName(name);
                    staff.setTel(tel);
                    staff.setEmail(email);
                    staff.setPassword(password);
                    staff.setRole(role);

                    HttpSession session = request.getSession();
                    session.setAttribute("staff", staff);

                    response.getWriter().println("<script type='text/javascript'>");
                    response.getWriter().println("alert('Add new staff successful!');");
                    response.getWriter().println("window.location='ManagerPage.jsp';");
                    response.getWriter().println("</script>");
                } else {
                    response.getWriter().println("<script type='text/javascript'>");
                    response.getWriter().println("alert('Add new staff failed, please try again!');");
                    response.getWriter().println("history.back();");
                    response.getWriter().println("</script>");
                }
            }

            rs.close();
            checkStmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<script type='text/javascript'>");
            response.getWriter().println("alert('Database error: " + e.getMessage().replace("'", "\\'") + "');");
            response.getWriter().println("history.back();");
            response.getWriter().println("</script>");
        }
    }
}
