// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import * as bootstrap from 'bootstrap'

import "../util/checkcss.js"
import "../stylesheets/application.scss"

Rails.start()
ActiveStorage.start()

addEventListener("load", (event) => {
  let toasts = document.getElementsByClassName("toast")
  Array.from(toasts).map((toastFade) => {
    const toast = new bootstrap.Toast(toastFade)
    toast.show()
  })
});
