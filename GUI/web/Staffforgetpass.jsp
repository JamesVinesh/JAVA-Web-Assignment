<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Heaven Nowey Staff Forget Password</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Segoe UI', sans-serif;
    }

    body, html {
    height: 100%;
    margin: 0;
    padding: 0;
    background: url('images/Stafflogin.jpg') no-repeat center center fixed;
    background-size: cover;
    display: flex;
    align-items: center;
    justify-content: center;
}

    .login-box {
      background: rgba(0, 0, 0, 0.7);
      padding: 40px;
      border-radius: 10px;
      color: white;
      width: 350px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
    }

    .login-box h2 {
      text-align: center;
      margin-bottom: 20px;
    }

    .login-box input[type="email"],
    .login-box input[type="password"] {
      width: 100%;
      padding: 12px;
      margin: 10px 0;
      border: none;
      border-radius: 5px;
    }

    .login-box input[type="submit"] {
      width: 100%;
      padding: 12px;
      margin-top: 10px;
      background: #ff0066;
      border: none;
      border-radius: 5px;
      color: white;
      font-size: 16px;
      cursor: pointer;
    }

    .login-box input[type="submit"]:hover {
      background: #e6005c;
    }

    .login-box a {
      display: block;
      text-align: center;
      margin-top: 15px;
      font-size: 14px;
      color: #ccc;
      text-decoration: none;
    }

    .login-box a:hover {
      text-decoration: underline;
    }
    
    .error-msg {
      text-align: center;
      color: #ff4d4d;
      margin-bottom: 15px;
      font-size: 14px;
    }
  </style>
</head>
<body>
<div class="login-box">
  <h2>Forgot Password</h2>
  <form action="StaffforgetServlet" method="post">
    <input type="email" name="email" placeholder="Enter your email" required>
    <input type="submit" value="Submit"> 
    <a href="login.jsp">Go Back Login</a>
  </form>
</div>
</body>
</html>
