// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------
//= require jquery3
//= require popper
//= require bootstrap-sprockets

// External imports
import "bootstrap";

// Internal imports, e.g:
// chatroom import function
import { initChatroomCable } from '../channels/chatroom_channel';
// import { initSelect2 } from '../components/init_select2';
import { randomizeMovieNameOnClick } from "../components/randomize";

import { vetoTimer } from "../components/timer";

import { initHouseholdCable } from "../channels/household_channel";


document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  //import chatroom

  // ACTION CABLE BELOW
  initHouseholdCable();

  if (document.querySelector(".pages-home")){
    randomizeMovieNameOnClick();
  };
  if (document.querySelector(".households-start_game") || document.querySelector(".households-random_pick")){
    vetoTimer();
  }

});


