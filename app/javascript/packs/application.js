// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "../util/checkcss.js"

import "../stylesheets/application.scss"
import * as bootstrap from "bootstrap"

Rails.start()
ActiveStorage.start()

const dropdownElementList = document.querySelectorAll('.dropdown-toggle');
const dropdownList = [...dropdownElementList].map(dropdownToggleEl => new bootstrap.Dropdown(dropdownToggleEl));
