// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application"
import '@fortawesome/fontawesome-free/js/all'
import { gsap } from "gsap/all";

Rails.start();
Turbolinks.start();
ActiveStorage.start();

document.addEventListener('turbolinks:load', function() {
const element = document.querySelector('.element');

gsap.to('.element', {
  opacity: 0,
  y: 100,
  duration: 1
});


function handleScroll() {
 const scrollTop = window.pageYOffset || document.documentElement.scrollTop;

  gsap.to('.element', {
    opacity: 0,
    y: 100,
    duration: 1
  });
}

window.addEventListener('scroll', handleScroll);
});