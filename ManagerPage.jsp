<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" import="model.Staff" %>
<%
    Staff staff = (Staff) session.getAttribute("staff");
    if (staff == null) {
        response.sendRedirect("Loginstaff.jsp"); // force login if no session
    } else {
%>
    <h2 hidden>Welcome, <%= staff.getName() %> (Role: <%= staff.getRole() %>)</h2>
    <p hidden>Email: <%= staff.getEmail() %></p>
<%
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Staff Dashboard</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        body {
            padding-top: 50px;
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
        .notification-panel {
            border: 1px solid #ddd;
            border-radius: 4px;
            padding: 15px;
            margin-top: 30px;
            background-color: #fff;
        }
        .notification-panel h4 {
            margin-top: 0;
        }
        .notification-item {
            padding: 10px;
            border-bottom: 1px solid #eee;
        }
        .notification-item:last-child {
            border-bottom: none;
        }
        .notification-time {
            color: #999;
            font-size: 12px;
            float: right;
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

<!-- Main content -->
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
                <i class="fa fa-user-plus fa-2x"></i> Create Staff
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


    <div class="notification-panel">
        <h4><i class="fa fa-bell"></i> Notifications</h4>
        
        <div class="notification-item">
            <span class="label label-success">New Staff</span> Alice Wong has joined the Sales team.
            <span class="notification-time">2 mins ago</span>
        </div>
        <div class="notification-item">
            <span class="label label-warning">Stock Alert</span> Product X450 only 5 units left in inventory.
            <span class="notification-time">8 mins ago</span>
        </div>
        <div class="notification-item">
            <span class="label label-info">System</span> Backup completed successfully.
            <span class="notification-time">20 mins ago</span>
        </div>
        <div class="notification-item">
            <span class="label label-danger">Error</span> Payment gateway connection failed.
            <span class="notification-time">1 hour ago</span>
        </div>
        <div class="notification-item">
            <span class="label label-success">New Staff</span> Samuel Lee has been added to the HR department.
            <span class="notification-time">12 hour ago</span>
        </div>
        <div class="notification-item">
            <span class="label label-warning">Stock Alert</span> Product Z900 is below safety stock level.
            <span class="notification-time">13 hour ago</span>
        </div>
        <div class="notification-item">
            <span class="label label-info">System</span> New update available: Version 2.1.4.
            <span class="notification-time">1 day ago</span>
        </div>
        <div class="notification-item">
            <span class="label label-danger">Error</span> User data sync failed for account #5534.
            <span class="notification-time">9 days ago</span>
        </div>
        <div class="notification-item">
            <span class="label label-success">New Staff</span> Alice Wong has joined the Sales team.
            <span class="notification-time">20 days ago</span>
        </div>
        <div class="notification-item">
            <span class="label label-warning">Stock Alert</span> Product X450 only 5 units left in inventory.
            <span class="notification-time">30 days ago</span>
        </div>
        <div class="notification-item">
            <span class="label label-info">System</span> Backup completed successfully.
            <span class="notification-time">1 month ago</span>
        </div>
        <div class="notification-item">
            <span class="label label-danger">Error</span> Payment gateway connection failed.
            <span class="notification-time">5 month ago</span>
        </div>
        <div class="notification-item">
            <span class="label label-success">New Staff</span> Samuel Lee has been added to the HR department.
            <span class="notification-time">9 month ago</span>
        </div>
        <div class="notification-item">
            <span class="label label-warning">Stock Alert</span> Product Z900 is below safety stock level.
            <span class="notification-time">10 hour ago</span>
        </div>
        <div class="notification-item">
            <span class="label label-info">System</span> New update available: Version 2.1.4.
            <span class="notification-time">1 year ago</span>
        </div>
        <div class="notification-item">
            <span class="label label-danger">Error</span> User data sync failed for account #5534.
            <span class="notification-time">3 year ago</span>
        </div>
        

    </div>

</div>

</body>
</html>
