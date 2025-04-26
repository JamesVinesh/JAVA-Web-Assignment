package Controller;

import java.io.File;
import java.io.PrintWriter;
import javax.servlet.http.Part;
import javax.servlet.annotation.MultipartConfig;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AdminProdAdd")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50)

public class ProdAddServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private static final String host = "jdbc:derby://localhost:1527/Appliance";
    private static final String user = "James";
    private static final String pwd = "1234";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
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

            try (Connection conn = DriverManager.getConnection(host, user, pwd)) {

                // Generate new product ID starting from 1001
                int newProdID = 1001;
                try (Statement stmt2 = conn.createStatement();
                     ResultSet rs = stmt2.executeQuery("SELECT MAX(PRODUCTID) FROM PRODUCTS")) {

                    if (rs.next()) {
                        int maxID = rs.getInt(1);
                        if (maxID >= 1000) {
                            newProdID = maxID + 1;
                        }
                    }
                }

                String sql = "INSERT INTO PRODUCTS (PRODUCTID, ADMINID, CATEGORY, PRODUCTNAME, PRODUCTPRICE, PRODUCTDESCRIPTION, STOCK, PRODUCTIMAGE, IMAGEPATH) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setInt(1, (newProdID));
                    stmt.setInt(2, Integer.parseInt(adminID));
                    stmt.setString(3, category);
                    stmt.setString(4, prodName);
                    stmt.setDouble(5, Double.parseDouble(prodPrice));
                    stmt.setString(6, prodDesc);
                    stmt.setInt(7, Integer.parseInt(stock));
                    stmt.setString(8, fileName);
                    stmt.setString(9, relativePath); // ✅ Relative image path like "/images/fan.jpg"

                    int result = stmt.executeUpdate();

                    if (result > 0) {
                        out.println("<script type='text/javascript'>");
                        out.println("alert('Add successful!');");
                        out.println("window.location='AdminDisplayProd.jsp';");
                        out.println("</script>");
                    } else {
                        out.println("<script type='text/javascript'>");
                        out.println("alert('Add failed, please try again!');");
                        out.println("history.back();");
                        out.println("</script>");
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace(out);
            out.println("<script type='text/javascript'>");
            out.println("alert('Database error: " + e.getMessage().replace("'", "\\'") + "');");
            out.println("history.back();");
            out.println("</script>");
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