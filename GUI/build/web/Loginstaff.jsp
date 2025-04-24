<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Heaven Nowey Staff Login</title>
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
      background: url('images/Stafflogin.jpg');
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
      border-radius: 5px;
      background: rgba(255, 255, 255, 0.1);
      color: white;
      border: 1px solid white;
      font-size: 15px;
    }

    .login-box input[type="email"]::placeholder,
    .login-box input[type="password"]::placeholder {
      color: #ccc;
    }

    .login-box input[type="submit"] {
      width: 100%;
      padding: 12px;
      margin-top: 10px;
      background: #c20051;
      border: none;
      border-radius: 5px;
      color: white;
      font-size: 15px;
      cursor: pointer;
    }

    .login-box input[type="submit"]:hover {
      background: #a10045;
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
  <h2>Staff Login</h2>

  <%
    String error = request.getParameter("error");
    String errorMessage = (String) request.getAttribute("errorMessage");

    if ("email".equals(error)) {
  %>
    <div class="error-msg">Email does not exist.</div>
  <%
    } else if ("password".equals(error)) {
  %>
    <div class="error-msg">Incorrect password.</div>
  <%
    } else if ("server".equals(error)) {
  %>
    <div class="error-msg">Server error. Please try again later.</div>
  <%
    } else if (errorMessage != null) {
  %>
    <div class="error-msg"><%= errorMessage %></div>
  <% } %>

  <form action="Loginstaff" method="post">
    <input type="email" name="email" placeholder="Email" required>
    <input type="password" name="password" placeholder="Password" required>
    <input type="submit" value="Login">
    <a href="Staffforgetpass.jsp">Forget Password?</a>
    <a href="login.jsp">Go Back Customer Login</a>
  </form>
</div>

</body>
</html>
