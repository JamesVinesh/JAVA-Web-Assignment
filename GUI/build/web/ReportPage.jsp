<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            margin: 0;
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

<div class="sidebar">
    <ul class="nav nav-pills nav-stacked">
        <li class="active"><a href="ManagerPage.jsp"><i class="fa fa-tachometer-alt"></i> Dashboard</a></li>
        <li><a href="#"><i class="fa fa-file"></i> Report</a></li>
        <li><a href="#"><i class="fa fa-box-open"></i> Product</a></li>
        <li><a href="CreateStaff.jsp"><i class="fa fa-user-plus"></i> Create Staff</a></li>
        <li><a href="StaffDetails.jsp"><i class="fa fa-tasks"></i> Staff Details</a></li>
    </ul>
</div>

<!-- Main content -->
<div class="main">
   

    <table action="">
        <tr>
            <th>Product ID</th>
            <th>Product Name</th>
            <th>Categories</th>
            <th>Product Price</th>
            <th>Product Sales</th>
            
        </tr>
   
        
     
      
    </table>

</div>

</body>
</html>
