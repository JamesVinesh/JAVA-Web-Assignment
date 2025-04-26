/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import java.io.File;
import java.io.PrintWriter;
import javax.servlet.http.Part;
import javax.servlet.annotation.MultipartConfig;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AdminUpdateProd")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50)
public class UpdateProdServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String prodID = request.getParameter("prodID");
        String adminID = request.getParameter("adminID");
        String category = request.getParameter("category");
        String prodName = request.getParameter("prodName");
        String prodPrice = request.getParameter("prodPrice");
        String prodDesc = request.getParameter("prodDesc");
        String stock = request.getParameter("stock");
        String img = request.getParameter("prodIm");
        
        Part part = request.getPart("prodIm");
        String fileName = extractFileName(part);
        String uploadPath = "C:\\Users\\User\\Documents\\NetBeansProjects\\GUI-Assignment(1)\\web\\img";
        String fullPath = uploadPath + File.separator + fileName;
        String relativePath = "img/" + fileName;
     
        File imageDir = new File(uploadPath);
        if (!imageDir.exists()) {
            imageDir.mkdirs(); // 确保文件夹存在
        }
        try (InputStream input = part.getInputStream()) {
            Files.copy(input, Paths.get(fullPath), StandardCopyOption.REPLACE_EXISTING);
        } catch (IOException ioe) {
            ioe.printStackTrace();
            out.println("<script>alert('Upload failed: " + ioe.getMessage() + "');history.back();</script>");
            return;
        }

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/Appliance", "James", "1234");

            String sql = "UPDATE PRODUCTS SET ADMINID=?, CATEGORY=?, PRODUCTNAME=?, PRODUCTPRICE=?, PRODUCTDESCRIPTION=?, STOCK=?, PRODUCTIMAGE=?, IMAGEPATH=? WHERE PRODUCTID=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1,Integer.parseInt(adminID));
            ps.setString(2, category);
            ps.setString(3, prodName);
            ps.setDouble(4, Double.parseDouble(prodPrice));
            ps.setString(5, prodDesc);
            ps.setInt(6, Integer.parseInt(stock));
            ps.setString(7, fileName);
            ps.setString(8, relativePath); // ✅ Relative image path like "/images/fan.jpg"
            ps.setInt(9, Integer.parseInt(prodID));
            
            
            int rowsAffected = ps.executeUpdate();
            conn.close();
            
            
            if (rowsAffected > 0) {
                response.sendRedirect("AdminDisplayProd.jsp");
            } else {
                response.getWriter().println("Update failed: No staff found with ID " + prodID);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Update failed: " + e.getMessage());
        }
    }
    
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        if (contentDisp == null) return "";

        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
    
}
