<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="CSS/signup.css" />
    <script src="JS/signup.js" defer></script>
    <script
      type="module"
      src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"
    ></script>
    <script
      nomodule
      src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"
    ></script>
    <title>D.Deserts - Sign Up</title>
  </head>
  <body>
    <header>
      <h1 class="logo">D.DESERTS</h1>
      <ul>
        <li><a href="index.html" class="active">Return</a></li>
      </ul>
    </header>

    <section class="wrapper">
      <div class="form-box" id="form-box">
        <h2>Sign Up</h2>

        <form action="add_user" method="post">
          <div id="error"></div>
          <div class="input-box" id="input-box-name">
            <span class="icon"><ion-icon name="person"></ion-icon></span>
            <input type="text" id="name-input" name = "name-input" required />
            <label id="name">Full Name*</label>
          </div>
          <div class="input-box" id="input-box-mail">
            <span class="icon"><ion-icon name="mail"></ion-icon></span>
            <input type="email" id="email-input" name = "email-input" required />
            <label id="email">Email*</label>
          </div>
          <div class="input-box" id="input-box-number">
            <span class="icon"><ion-icon name="call"></ion-icon></span>
            <input type="tel" id="number-input" name = "number-input" required />
            <label id="number">Contact Number*</label>
          </div>
          <div class="input-box" id="input-box-password">
            <span class="icon"><ion-icon name="lock-closed"></ion-icon></span>
            <input type="password" id="password-input" name = "password-input" required />
            <label id="password">Password*</label>
          </div>

          <button type="submit" class="btn" id="submit-btn">Sign Up</button>

          <div class="signup-register" id="signup-register">
            <p>
              Already have an account?
              <a href="/login.html">Login</a>
            </p>
          </div>
        </form>
      </div>
    </section>
  </body>
</html>
