// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

//= require jquery
//= require jquery.turbolinks
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

window.$ = $;

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import $ from 'jquery'
import axios from 'axios'
import { csrfToken } from 'rails-ujs'

axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()


$(function () {
  document.addEventListener('turbolinks:load', function() {
    const btn = document.getElementById('dropdwn_btn');
    if(btn) {
      btn.addEventListener('click', function(){
        this.classList.toggle('is-open');
      });
    }
  });
}());

$(function(){
  $(".thumbs__lists__item__image").first().css('opacity', '1'); 
  $(".thumbs__lists__item__image").mouseover(function(e){       
    let mainDataIndex = $(this).parent().attr('data-index')     
    $(".thumbs__lists__item__image").each(function(){           
      let subDataIndex = $(this).parent().attr('data-index');   
      if (subDataIndex == mainDataIndex){                       
        $(this).css('opacity', '1');
      } else {
        $(this).css('opacity', '0.5');
      };
    });
    $(".main__lists__image").each(function(index){              
      if(index == mainDataIndex){                               
        $(this).css('z-index', 99);
      } else {
        $(this).css('z-index', -1);
      };
    });
  });
}); 