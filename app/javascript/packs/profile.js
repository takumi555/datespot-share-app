import $ from 'jquery'
import axios from 'axios'
import { csrfToken } from 'rails-ujs'

axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()

$(document).on('turbolinks:load', function() {
  $('.profile_avatar').on('click', () => {
    if ($('.avatar_form').hasClass('hidden')){
      $('.avatar_form').removeClass('hidden');
    } else {
       $('.avatar_form').addClass('hidden');
    }
  });
});