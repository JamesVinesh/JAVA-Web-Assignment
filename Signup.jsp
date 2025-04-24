<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Heaven Nowey Sign-Up</title>
  <style>
    *  {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: "Titillium Web", sans-serif;
    list-style: none;
    text-decoration: none;
}

body {
    background: grey;
    padding: 30px;
}


    .bg {
      background: url('images/appliance.jpg') no-repeat center center/cover;
      height: 100vh;
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 0 10%;
      color: white;
    }

    .welcome-text {
      max-width: 40%;
    }

    .welcome-text h1 {
      font-size: 36px;
      margin-bottom: 10px;
    }

    .welcome-text p {
      font-size: 16px;
      color: black;
      margin-bottom: 20px;
    }

    .socials i {
      margin-right: 10px;
      font-size: 20px;
      color: #fff;
    }

    .signup-form {
      background: rgba(0, 0, 0, 0.6);
      padding: 30px;
      border-radius: 10px;
      width: 320px;
    }

    .signup-form h2 {
      margin-bottom: 20px;
      color: #fff;
    }

    .signup-form input[type="text"],
    .signup-form input[type="password"],
    .signup-form input[type="email"],
    .signup-form input[type="tel"] {
      width: 100%;
      padding: 10px;
      margin: 8px 0;
      border: none;
      border-radius: 5px;
    }

    .signup-form label {
      font-size: 14px;
      color: #ccc;
    }

    .signup-form .checkbox {
      margin: 10px 0;
    }

    .signup-form input[type="submit"] {
      width: 100%;
      padding: 12px;
      background: #ff0066;
      color: white;
      border: none;
      border-radius: 5px;
      font-size: 16px;
      cursor: pointer;
      margin-top: 10px;
    }

    .signup-form input[type="submit"]:hover {
      background: #e6005c;
    }

    .signup-form a {
      color: #ccc;
      font-size: 14px;
      display: block;
      margin-top: 10px;
      text-align: center;
    }
  </style>
  <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</head>
<body>

<div class="bg">
  <div class="welcome-text">
    <h1>Welcome!<br>To Our Heaven Nowey</h1>
    <p>Making Every House a Home.</p>
    <div class="socials">
      <i class="fab fa-facebook-f"></i>
      <i class="fab fa-twitter"></i>
      <i class="fab fa-instagram"></i>
      <i class="fab fa-youtube"></i>
      <i class="fab fa-linkedin-in"></i>
    </div>
  </div>

  <div class="signup-form">
    <h2>Sign Up</h2>
    <form action="Signup" method="post">
      <input type="text" name="Name" placeholder="Name" required>
      <input type="tel" name="contact" placeholder="Contact Number" required>
      <input type="text" name="email" placeholder="Email" required>
      <input type="text" name="address" placeholder="Address" required>
      <input type="password" name="password" placeholder="Password" required>
      <label style="color: #ccc; font-size: 14px;">Gender:</label><br>
      <input type="radio" name="gender" value="Male" required> Male
      <input type="radio" name="gender" value="Female" required> Female
      <input type="radio" name="gender" value="Other" required> Other
        <br><br>


      <div class="checkbox">
        <label><input type="checkbox" required> I agree with this statement</label>
      </div>

      <input type="submit" value="Sign Up">
      <a href="login.jsp">Already have an account? Sign In</a>
    </form>
  </div>
</div>

</body>
</html>
