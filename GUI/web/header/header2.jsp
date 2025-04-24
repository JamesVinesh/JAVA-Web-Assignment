<%-- 
    Document   : header
    Created on : Apr 20, 2025, 9:04:44 PM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>
        .navbar-brand img {
            height: 30px;
            display: inline-block;
            margin-left: 10px;
            vertical-align: middle;
        }
        
        .navbar.navbar-inverse.navbar-fixed-top {
            background-color: #004179;  /* dark blue example */
            border: none;
        }
    </style>
    
    <body>
   <nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand">
                <img src="images/logo.jpg" alt="Logo">
                Heaven Nowey Admin
            </a>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="#" class="nav-link"><i class="fas fa-box-open"></i> Product</a></li>
            <li><a href="#" class="nav-link"><i class="fas fa-circle-info""></i> About us</a></li>
            <li><a href="#" class="nav-link"><i class="fas fa-cart-shopping"></i> Cart</a></li>
            <li><a href="#" class="nav-link"><i class="fas fa-comment-alt"></i> Review</a></li>
            <li><a href="#" class="nav-link"><i class="fas fa-phone-alt"></i> Contact us</a></li>
            <li><a href="#" class="nav-link"><i class="fas fa-user-alt"></i> Account</a></li>
            <li><a href="login.jsp"><i class="fa fa-sign-out-alt"></i> Logout</a></li>
        </ul>
    </div>
</nav>
    </body>
</html>
