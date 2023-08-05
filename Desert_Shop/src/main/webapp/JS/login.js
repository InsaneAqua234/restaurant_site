let form = document.getElementById("form");
let email = document.getElementById("email-input");
let password = document.getElementById("password-input");
let nameField = document.getElementById("input-box-name");
let numberField = document.getElementById("input-box-number");
let submitBtn = document.getElementById("submit-btn");
let errorElement = document.getElementById("error");

form.addEventListener("submit", (e) => {
  let messages = [];

  if (messages.length > 0) {
    e.preventDefault();
    errorElement.innerText = messages[0];
    form.reset();
  }

  if (messages.length == 0) {
    form.submit();
  }
});
