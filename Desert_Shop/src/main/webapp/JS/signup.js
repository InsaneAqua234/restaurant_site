let form = document.getElementById("form");
let name = document.getElementById("name-input");
let email = document.getElementById("email-input");
let number = document.getElementById("number-input");
let password = document.getElementById("password-input");
let submitBtn = document.getElementById("submit-btn");
let errorElement = document.getElementById("error");

form.addEventListener("submit", (e) => {
  let messages = [];

  if (number.value.length < 10) {
    messages.push("Enter valid contact number!");
  }

  if (password.value.toLowerCase() == "password") {
    messages.push(`Password can't be ${password.value}!`);
  }

  if (password.value.length < 8) {
    messages.push("Password should be min 8 characters!");
  }

  if (messages.length > 0) {
    e.preventDefault();
    errorElement.innerText = messages[0];
    form.reset();
  }

  if (messages.length == 0) {
    form.reset();
  }
});
