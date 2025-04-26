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
        <title>Product Information</title>
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
            max-width: 800px;
            margin: 0 auto;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        img {
            width: 200px;
            height: 300px;
            border: 2px solid orange;
        }
        
        div.prodInfo {
            text-align: center;
        }
        
        table.prodDetail {
            border: 1px #1c1c1c solid;
            width: 700px;
            margin-left: 30px;
            border-collapse: collapse;
        }
        
        tr {
            border-bottom: 1px #1c1c1c solid;;
        }
        
        button {
            margin-left: 660px;
        }
    </style>
    
    <body>
        <div class="container">
        <h1>Product Info</h1>
        
        <div class="prodInfo">
            <img src="<%= img %>" width="100"><br />
            <%= prodName %>
        </div>
        
        <table class="prodDetail">
            <tr>
                <td>RM<%= prodPrice %></td>
            </tr>
            <tr>
                <td>Stock: <%= stock %></td>
            </tr>
            <tr>
                <td><%= prodDesc %></td>
            </tr>
        </table>
        
            <button>Add to Cart</button>
        </div>
    </body>
</html>
