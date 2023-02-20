document.addEventListener("DOMContentLoaded", function() {
  let account = document.querySelector("#profile");
  account.addEventListener("click", function(event) {
    event.preventDefault();
    let menu = document.querySelector("#dropdown-menu");
    menu.classList.toggle("active");
  });
});
