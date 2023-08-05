<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="CSS/login.css" />
    <script src="/login.js" defer></script>
    <script
      type="module"
      src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"
    ></script>
    <script
      nomodule
      src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"
    ></script>
    <title>D.Deserts - Login</title>
  </head>
  <body>
    <header>
      <h1 class="logo">D.DESERTS</h1>
      <ul>
        <li><a href="/index.html" class="active">Return</a></li>
      </ul>
    </header>

    <section class="wrapper">
      <div class="form-box" id="form-box">
        <h2>Login</h2>

        <form action="check_user" method="get">
          <div id="error"></div>
          <div class="input-box" id="input-box-mail">
            <span class="icon"><ion-icon name="mail"></ion-icon></span>
            <input type="email" id="email-input" name = "emailID" required />
            <label id="email">Email*</label>
          </div>
          <div class="input-box" id="input-box-password">
            <span class="icon"><ion-icon name="lock-closed"></ion-icon></span>
            <input type="password" id="password-input" name = "password" required />
            <label id="password">Password*</label>
          </div>
          <div class="remember-forgot" id="remember-forgot">
            <label><input type="checkbox" />Remember Me </label>
            <a href="#">Forgot Password?</a>
          </div>

          <button type="submit" class="btn" id="submit-btn">Login</button>

          <div class="login-register" id="login-register">
            <p>
              Don't have an account?
              <a href="/signup.html">Register</a>
            </p>
          </div>
        </form>
      </div>
    </section>
  </body>
</html>
