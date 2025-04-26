/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/DeleteProdServlet")
public class DeleteProdServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
                String prodID = request.getParameter("prodID");

                try {
                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                    Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/Appliance", "James", "1234");

                    String sql = "DELETE FROM PRODUCTS WHERE PRODUCTID=?";
                    PreparedStatement ps = conn.prepareStatement(sql);
                    ps.setString(1, prodID);

                    ps.executeUpdate();
                    ps.close();
                    conn.close();
            
                    response.sendRedirect("AdminDisplayProd.jsp");
            
                } catch (Exception e) {
                    e.printStackTrace();
                    response.getWriter().println("Delete failed: " + e.getMessage());
                }
            }
    
}
