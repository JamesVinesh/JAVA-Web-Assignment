b<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="Model.Prod"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Display Product</title>
        <jsp:include page="header/header.jsp" />
        <%@ page import="java.sql.*" %>
    </head>
    <body>
      
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
                padding: 10px;
                width: 1400px;
                height: 100px;
                margin: 0 auto;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
                display: flex;
                flex-wrap: wrap;
                gap: 20px;
            }
            
            .image {
                width: 100px;
                height: 100px;
            }
            
            section.secSearch {
                border: 1px solid #ccc;
            }
            
            section.prod div.box-img {
                float: left;
                margin: 5px;
                border: 1px solid #ccc;
                background: white;
                width:200px;
                height:450px;
            }
            
            input.inSearch {
                margin-top: 100px;
                margin: auto;
                width: 500px;
                height: 30px;
            }
            
            button.btnSearch {
                margin-top: 40px;
            }
            
            div.box-img:hover {
                background: orange;
            }
            
            img.image {
                width: 200px;
                height: 300px;
                border: 2px solid orange;
            }
            
            div.imName {
                padding: 10px;
                text-align: center;
                color: black;
                height: 60px; /* or adjust based on your needs */
                text-align: center;
            }
            
            div.imPrice {
                font-weight: bold;
                color: orange;
                margin-top: 50px;
                text-align: center;
            }
            
            ul.cat{
                background: white;
                width: 100px;
                height: 500px;
                border: 1px solid #555;
            }
            
            li {
                text-align: center;
                border-bottom: 1px solid #555;
            }
            
            li:hover {
                background-color: #555;
                color: white;
            }
            
            button.dropbtn {
                background-color: #4CAF50;
                color: white;
                padding: 16px;
                font-size: 16px;
                border: none;
                cursor: pointer;
            }
            
            div.dropdown {
                position: relative;
                display: inline-block;
            }
        </style>
                <%
                    Connection conn = null;
                    PreparedStatement stmt = null;
                    ResultSet rs = null;

                    try {
                        Class.forName("org.apache.derby.jdbc.ClientDriver");

                        conn = DriverManager.getConnection("jdbc:derby://localhost:1527/Appliance", "James", "1234");
                        
                        String keyword = request.getParameter("keyword");
                        String sql = "SELECT PRODUCTID, ADMINID, CATEGORY, PRODUCTNAME, PRODUCTPRICE, PRODUCTDESCRIPTION, STOCK, PRODUCTIMAGE, IMAGEPATH FROM PRODUCTS";
                        
                        if (keyword != null && !keyword.trim().isEmpty()) {
                            sql += " WHERE LOWER(PRODUCTNAME) LIKE ?";
                        }
                        
                        stmt = conn.prepareStatement(sql);
                        
                        if (keyword != null && !keyword.trim().isEmpty()) {
                            stmt.setString(1, "%" + keyword.toLowerCase() + "%");
                        }
                        
                        rs = stmt.executeQuery();
                %>
                
                <section class=secSearch">
                    <div class="container">
                        <h1>Product</h1>
                        <form method="get" action="CustDisplayProd.jsp">
                            <input type="text" class="inSearch" name="keyword" placeholder="Search"
                                value="<%= request.getParameter("keyword") != null ? request.getParameter("keyword") : "" %>"/>
                            <button type="submit" class="btnSearch">Search</button>
                        </form>
                    </div>  
                </section>
                
                
                <%

                        while (rs.next()){
                %>
                <section class="prod">
                    <div class="box-img">
                        <a href="ProdInformation.jsp?PRODUCTID=<%= rs.getString("PRODUCTID") %>"" >
                            <img src="<%= rs.getString("IMAGEPATH") %>" class="image"/>
                            <div class="imName"><%= rs.getString("PRODUCTNAME") %></div>
                            <div class="imPrice">RM<%= rs.getDouble("PRODUCTPRICE") %></div>
                        </a>
                    </div>
                </section>      
                
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
