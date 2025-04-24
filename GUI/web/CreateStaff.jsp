<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Staff" %>
<%
    Staff staff = (Staff) session.getAttribute("staff");
    if (staff == null) {
        response.sendRedirect("Loginstaff.jsp");
        return;
    } else if (!staff.getRole().equalsIgnoreCase("admin") && !staff.getRole().equalsIgnoreCase("manager")) {
        response.sendRedirect("AccessDenied.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Create Staff</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        body {
            padding-top: 50px;
            background: #f8f9fa;
        }
        .sidebar {
            position: fixed;
            top: 50px;
            bottom: 0;
            left: 0;
            width: 200px;
            background-color: #f8f9fa;
            padding-top: 20px;
            border-right: 1px solid #ddd;
        }
        .main {
            margin-left: 210px;
            padding: 20px;
        }
        .panel-green { background-color: #5cb85c; color: white; }
        .panel-blue { background-color: #337ab7; color: white; }
        .panel-orange { background-color: #f0ad4e; color: white; }
        .panel-red { background-color: #d9534f; color: white; }
        .panel-box {
            color: white;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
        }
        .panel-box a {
            color: white;
            text-decoration: underline;
        }
        .add-form {
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 12px rgba(0, 0, 0, 0.05);
            margin-top: 30px;
        }
        .add-form h2 {
            margin-bottom: 20px;
            color: #333;
            border-bottom: 1px solid #e0e0e0;
            padding-bottom: 10px;
        }
        .add-form label {
            font-weight: 500;
            margin-top: 10px;
            display: block;
            color: #555;
        }
        .add-form input,
        .add-form select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .add-form input:focus,
        .add-form select:focus {
            border-color: #337ab7;
            outline: none;
        }
        .submit-button {
            background-color: #337ab7;
            color: white;
            border: none;
            padding: 12px;
            margin-top: 20px;
            width: 100%;
            border-radius: 4px;
            cursor: pointer;
        }
        .submit-button:hover {
            background-color: #23527c;
        }
    </style>
</head>
<body>

<jsp:include page="header/header.jsp" />

<div class="sidebar">
    <ul class="nav nav-pills nav-stacked">
        <li class="active"><a href="ManagerPage.jsp"><i class="fa fa-tachometer-alt"></i> Dashboard</a></li>
        <li><a href="ReportPage.jsp"><i class="fa fa-file"></i> Report</a></li>
        <li><a href="#"><i class="fa fa-box-open"></i> Product</a></li>
        <li><a href="CreateStaff.jsp"><i class="fa fa-user-plus"></i> Create Staff</a></li>
        <li><a href="StaffDetails.jsp"><i class="fa fa-tasks"></i> Staff Details</a></li>
    </ul>
</div>

<div class="main">
    <div class="row">
        <div class="col-md-3">
            <div class="panel-box panel-blue">
                <i class="fa fa-file fa-2x"></i>  Report
                <div><a href="ReportPage.jsp">View/Generate Report</a></div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="panel-box panel-green">
                <i class="fa fa-tasks fa-2x"></i> Staff Details
                <div><a href="StaffDetails.jsp">View Details</a></div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="panel-box panel-orange">
                <i class="fa fa-user-plus fa-2x""></i> Create Staff
                <div><a href="CreateStaff.jsp">Add Staff</a></div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="panel-box panel-red">
                <i class="fa fa-box-open fa-2x"></i> Product
                <div><a href="#">View Details</a></div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="staff">
            <div class="add-form">
                <h2>Add New Staff</h2>
                <form action="CreateStaff" method="post">
                    <label>Name:</label>
                    <input type="text" name="name" required>

                    <label>Tel Number:</label>
                    <input type="tel" name="tel" required>

                    <label>Email:</label>
                    <input type="email" name="email" required>

                    <label>Password:</label>
                    <input type="password" name="password" required>

                    <label>Role:</label>
                    <select name="role">
                        <option value="admin">Admin</option>
                        <option value="manager">Manager</option>
                        <option value="staff">Staff</option>
                    </select>

                    <button type="submit" class="submit-button">Add a New Staff</button>
                    <button class="submit-button" onclick="window.location.href='ManagerPage.jsp'">Back</button>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>
