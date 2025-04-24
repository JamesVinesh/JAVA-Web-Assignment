<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%
    String id = request.getParameter("ID");
    String name = "", tel = "", email = "", role = "";

    try {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/Appliance", "James", "1234");
        
        String sql=("SELECT NAME, TEL, EMAIL, ROLE FROM USERS WHERE ID = ?");
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, id);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            name = rs.getString("NAME");
            tel = rs.getString("TEL");
            email = rs.getString("EMAIL");
            role = rs.getString("ROLE");
        }

        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Update Staff</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
      display: flex;
      justify-content: center;
      align-items: flex-start;
      padding-top: 50px;
    }

    .container {
      background-color: #ffffff;
      padding: 30px;
      width: 400px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      border-radius: 10px;
    }

    h2 {
      font-size: 22px;
      margin-bottom: 25px;
    }

    label {
      display: block;
      margin-bottom: 5px;
      font-size: 14px;
      color: #333;
    }

    input[type="text"],
    input[type="email"] {
      width: 100%;
      padding: 10px;
      margin-bottom: 20px;
      border: 1px solid #ccc;
      border-radius: 5px;
      font-size: 14px;
    }

    select {
      width: 100%;
      padding: 10px;
      margin-bottom: 20px;
      border: 1px solid #ccc;
      border-radius: 5px;
      font-size: 14px;
    }

    input[type="submit"] {
      background-color: #4CAF50;
      color: white;
      padding: 10px 16px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      font-size: 14px;
    }

    input[type="submit"]:hover {
      background-color: #45a049;
    }
    
  </style>
</head>
<body>
    
<div class="container">
  <h2>Update Staff</h2>
  <form action="UpdateStaff" method="post">
    <input type="hidden" name="id" value="<%= id %>">
    
    <label for="name">Name</label>
    <input type="text" name="name" value="<%= name %>" required>

    <label for="tel">Tel Number</label>
    <input type="text"name="tel" value="<%= tel %>" required>

    <label for="email">Email</label>
    <input type="email"name="email" value="<%= email %>" required>

    <label for="role">Role</label>
    <select id="role" name="role">
      <option value="Manager" <%= role.equals("Manager") ? "selected" : "" %>>Manager</option>
      <option value="Admin" <%= role.equals("Admin") ? "selected" : "" %>>Admin</option>
      <option value="Staff" <%= role.equals("Staff") ? "selected" : "" %>>Staff</option>
    </select>

    <input type="submit" value="Save Changes">
  </form>
</div>
</body>
</html>
