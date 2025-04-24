package controller;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import model.Customer; 

@WebServlet("/Signup")
public class SignupServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private static final String host = "jdbc:derby://localhost:1527/Appliance";
    private static final String user = "James";
    private static final String pwd = "1234";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Customer customer = new Customer();
        customer.setName(request.getParameter("Name"));
        customer.setEmail(request.getParameter("email"));
        customer.setPassword(request.getParameter("password"));
        customer.setContact(request.getParameter("contact"));
        customer.setAddress(request.getParameter("address"));
        customer.setGender(request.getParameter("gender"));

        response.setContentType("text/html;charset=UTF-8");

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection(host, user, pwd);

            String checkSql = "SELECT COUNT(*) FROM CUSTOMER WHERE CUSTEMAIL = ?";
            PreparedStatement checkStmt = conn.prepareStatement(checkSql);
            checkStmt.setString(1, customer.getEmail());

            ResultSet rs = checkStmt.executeQuery();
            rs.next();
            int count = rs.getInt(1);

            if (count > 0) {
                response.getWriter().println("<script>alert('This email is already registered!'); history.back();</script>");
            } else {
                String sql = "INSERT INTO CUSTOMER (CUSTNAME, CUSTTEL, CUSTEMAIL, CUSTADDRESS, CUSTPASSWORD, CUSTGENDER) VALUES (?, ?, ?, ?, ?, ?)";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, customer.getName());
                stmt.setString(2, customer.getContact());
                stmt.setString(3, customer.getEmail());
                stmt.setString(4, customer.getAddress());
                stmt.setString(5, customer.getPassword());
                stmt.setString(6, customer.getGender());

                int result = stmt.executeUpdate();
                stmt.close();

                if (result > 0) {
                    response.getWriter().println("<script>alert('Sign up successful!'); window.location='login.jsp';</script>");
                } else {
                    response.getWriter().println("<script>alert('Sign up failed, please try again!'); history.back();</script>");
                }
            }

            checkStmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<script>alert('Database error: " + e.getMessage().replace("'", "\\'") + "'); history.back();</script>");
        }
    }
}
