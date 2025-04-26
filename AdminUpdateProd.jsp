<%-- 
    Document   : AdminUpdateProd
    Created on : 22 Apr 2025, 1:31:21 am
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String prodID = request.getParameter("PRODUCTID");
    String adminID = "", category = "", prodName = "", prodPrice = "", prodDesc = "", stock = "", img = "";

    try {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/Appliance", "James", "1234");
        
        String sql = ("SELECT ADMINID, CATEGORY, PRODUCTNAME, PRODUCTPRICE, PRODUCTDESCRIPTION, STOCK, PRODUCTIMAGE, IMAGEPATH FROM PRODUCTS WHERE PRODUCTID = ?");
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, prodID);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            adminID = rs.getString("ADMINID");
            category = rs.getString("CATEGORY");
            prodName = rs.getString("PRODUCTNAME");
            prodPrice = rs.getString("PRODUCTPRICE");
            prodDesc = rs.getString("PRODUCTDESCRIPTION");
            stock = rs.getString("STOCK");
            img = rs.getString("IMAGEPATH");
        }

        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Product</title>
    </head>
    
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Titillium Web", sans-serif;
            list-style: none;
            text-decoration: none;
        }

        body {
            background: grey;
            padding: 30px;
        }

        h1 {
            text-align: center;
            margin-top: 30px;
            margin-bottom: 20px;
        }

        .container {
            background: #fff;
            padding: 25px;
            max-width: 600px;
            margin: 0 auto;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        table {
            background: white;
            border-collapse: collapse;
            width: 100%;
        }

        td {
            border: 1px solid black;
            padding: 10px;
            text-align: left;
        }

        input[type=text], select, textarea {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .subbtn {
            width: 48%;
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            margin-top: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .resetbtn {
            background-color: #f44336;
            float: right;
        }
        
        textarea {
            resize: none;
        }     
        
        .image {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
    </style>
    
    <body>
        <div class="container">
        <h1>Edit Product</h1>
        <form action="AdminUpdateProd" method="post" enctype="multipart/form-data">
            <table>
                <tr>
                    <td>Product Id:</td>
                    <td><input type="hidden" name="prodID" value="<%= prodID %>" required></td>
                </tr>
                <tr>
                    <td>Admin Id:</td>
                    <td><input type="text" name="adminID" value="<%= adminID %>" required></td>
                </tr>
                <tr>
                    <td>Category:</td>
                    <td>
                    <select id="category" name="category" value="<%= category %>">
                        <option value="Refrigerator" <%= category.equals("refrigerator") ? "selected" : "" %>>Refrigerator</option>
                        <option value="Television" <%= category.equals("television") ? "selected" : "" %>>Television</option>
                        <option value="Rice Cooker" <%= category.equals("riceCooker") ? "selected" : "" %>>Rice Cooker</option>
                        <option value="Washing Machine" <%= category.equals("washingMachine") ? "selected" : "" %>>Washing Machine</option>
                    </select>
                    </td>
                </tr>
                <tr>
                    <td>Product Name:</td>
                    <td><input type="text" name="prodName" value="<%= prodName %>" required></td>
                </tr>
                <tr>
                    <td>Product Price:</td>
                    <td><input type="text" name="prodPrice" value="<%= prodPrice %>" required></td>
                </tr>
                <tr>
                    <td>Product Description:</td>
                    <td><textarea type="text" name="prodDesc" required><%= prodDesc %></textarea></td>
                </tr>
                <tr>
                    <td>Stock:</td>
                    <td><input type="text" name="stock" value="<%= stock %>" required></td>
                </tr>
                <tr>
                    <td>Product Image:</td>
                    <td>
                        <img src="<%= img %>" alt="Product Image" width="100"><br>
                        <input type="file" name="prodIm" accept="image/*" class="image" required/>
                    </td>   
                </tr>
            </table>
            <input type="submit" value="Save Changes" class="subbtn">
        </form>
        </div>
    </body>
</html>
