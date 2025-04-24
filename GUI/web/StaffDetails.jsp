<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Staff" %>
<%@ page import="model.Staff" %>
<%
    Staff updatedStaff = (Staff) session.getAttribute("updatedStaff");
    if (updatedStaff != null) {
%>
    <p hidden>ID: <%= updatedStaff.getId() %></p>
    <p hidden>Name: <%= updatedStaff.getName() %></p>
    <p hidden>Tel: <%= updatedStaff.getTel() %></p>
    <p hidden>Email: <%= updatedStaff.getEmail() %></p>
    <p hidden>Role: <%= updatedStaff.getRole() %></p>
<%
    } else {
%>
    <p hidden>No staff details found in session.</p>
<%
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update/ Delete Staff Details</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding-top: 50px;
        }

        .header {
            background-color: #343a40;
            padding: 15px;
            color: white;
            font-size: 22px;
            font-weight: bold;
        }

        .container {
            padding: 20px;
        }

        h2 {
            text-align: center;
            margin-top: 20px;
            color: #343a40;
        }

        .btn-add {
            background-color: #007bff;
            color: white;
            padding: 10px 16px;
            border: none;
            border-radius: 5px;
            text-decoration: none;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: white;
            box-shadow: 0px 0px 10px #ccc;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }

        th {
            background-color: #343a40;
            color: white;
        }

        .btn {
            padding: 8px 12px;
            border: none;
            border-radius: 4px;
            color: white;
            cursor: pointer;
            text-decoration: none;
        }

        .btn-update {
            background-color: #17a2b8;
        }

        .btn-delete {
            background-color: #dc3545;
        }

        .btn-view {
            background-color: #6c757d;
        }

        .footer {
            text-align: center;
            padding: 15px;
            background-color: #f1f1f1;
            font-size: 14px;
            margin-top: 40px;
        }
    </style>
</head>
<body>
<jsp:include page="header/header.jsp" />
<%@ page import="java.sql.*" %>
<div class="container">
    <a href="ManagerPage.jsp" class="btn-add">Back To Page</a>

    <h2>Staff List</h2>

    <table action="">
        <tr>
            <th>Staff ID</th>
            <th>Staff Name</th>
            <th>Staff Tel</th>
            <th>Staff Email</th>
            <th>Role</th>
            <th>Update/Delete</th>
        </tr>
   <%
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("org.apache.derby.jdbc.ClientDriver");

        conn = DriverManager.getConnection("jdbc:derby://localhost:1527/Appliance", "James", "1234");

        String sql = "SELECT ID,NAME,TEL, EMAIL, ROLE FROM USERS";
        stmt = conn.prepareStatement(sql);
        rs = stmt.executeQuery();

        while (rs.next()){
%>
        <tr>
            <td><%= rs.getString("ID") %></td>
            <td><%= rs.getString("NAME") %></td>
            <td><%= rs.getString("TEL") %></td>
            <td><%= rs.getString("EMAIL") %></td>
            <td><%= rs.getString("ROLE") %></td>
            <td>
                <a href="UpdateStaff.jsp?ID=<%= rs.getString("ID") %>" class="btn btn-update">Update</a>
                <form action="DeleteStaffServlet" method="post" style="display:inline;" onsubmit="return confirm('Are you sure to delete this staff?')">
                     <input type="hidden" name="id" value="<%= rs.getString("ID") %>" />
                     <button type="submit" class="btn btn-delete">Delete</button>
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
</div>

</body>
</html>
