<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="Model.Prod"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Display Product</title>
    </head>
    <body>
        <jsp:include page="header/header.jsp" />
        <%@ page import="java.sql.*" %>
        
        <style>
            * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Titillium Web", sans-serif;
            list-style: none;
            text-decoration: none !important;
            }

            body {
                background: grey;
                padding: 20px;
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
            
            th {
                background: orange;
            }

            th, td {
                border: 1px solid black;
                padding: 10px;
                text-align: left;
            }
            
            tr:hover {background-color: coral;}
            
            .add {
                width: 48%;
                background-color: lightskyblue;
                color: white;
                padding: 5px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                text-decoration: none;   
            }
            
            .edit {
                width: 48%;
                background-color: lightskyblue;
                color: white;
                padding: 5px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                text-decoration: none;            
            }
            button.btn {
                width: 48%;
                background-color: lightskyblue;
                color: white;
                padding: 5px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
            button.btnAdd {
                width: 5%;
                background-color: lightskyblue;
                color: white;
                padding: 5px;
                margin-left: 1267px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
            .image {
                width: 100px;
                height: 100px;
            }
        </style>
        
        
        <h1>Product</h1>
        <table>
            <tr>
            <button class="btnAdd"><a href="AdminProdAdd.jsp" class="add">Add</a></button>
                <table>
                     
                <tr>
                    <th>Product ID</th>
                    <th>Admin ID</th>
                    <th>Category</th>
                    <th>Product Name</th>
                    <th>Product Price</th>
                    <th>Product Description</th>
                    <th>Stock</th>
                    <th>Product Image</th>
                    <th>Function</th>
                </tr>
                
                <%
                    Connection conn = null;
                    PreparedStatement stmt = null;
                    ResultSet rs = null;

                    try {
                        Class.forName("org.apache.derby.jdbc.ClientDriver");

                        conn = DriverManager.getConnection("jdbc:derby://localhost:1527/Appliance", "James", "1234");

                        String sql = "SELECT PRODUCTID, ADMINID, CATEGORY, PRODUCTNAME, PRODUCTPRICE, PRODUCTDESCRIPTION, STOCK, PRODUCTIMAGE, IMAGEPATH FROM PRODUCTS";
                        stmt = conn.prepareStatement(sql);
                        rs = stmt.executeQuery();

                        while (rs.next()){
                %>
                
                <tr>
                    <td><%= rs.getInt("PRODUCTID") %></td>
                    <td><%= rs.getInt("ADMINID") %></td>
                    <td><%= rs.getString("CATEGORY") %></td>
                    <td><%= rs.getString("PRODUCTNAME") %></td>
                    <td>RM<%= rs.getDouble("PRODUCTPRICE") %></td>
                    <td><%= rs.getString("PRODUCTDESCRIPTION") %></td>
                    <td><%= rs.getInt("STOCK") %></td>
                    
                    
                    <td><img src="<%= rs.getString("IMAGEPATH") %>" width="100" height="100"class="image"/></td>
                    <td  style="width:150px">
                        <button class="btn"><a href="AdminUpdateProd.jsp?PRODUCTID=<%= rs.getInt("PRODUCTID")%>" class="edit">Edit</a></button>
                        <form action="DeleteProdServlet" method="post" style="display:inline;" onsubmit="return confirm('Are you sure to delete this Product?')">
                            <input type="hidden" name="prodID" value="<%= rs.getInt("PRODUCTID") %>" />
                            <button type="submit" class="btn">Delete</button>
                        </form>
                    </td>
                </tr>      
                
                <%
                    }
                    } catch (Exception e) {
                        out.println("<tr><td colspan='5'>Error: " + e.getMessage() + "</td></tr>");
                      } finally {
                        if (rs != null) try { rs.close(); } catch (Exception e) {}
                        if (stmt != null) try { stmt.close(); } catch (Exception e) {}
                        if (conn != null) try { conn.close(); } catch (Exception e) {}
                      }
                %>
                
            </table>

            </tr>
        </table>
    </body>
</html>
