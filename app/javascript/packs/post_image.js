import $ from 'jquery'
import axios from 'axios'
import { csrfToken } from 'rails-ujs'

axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()

$(document).on('turbolinks:load', function() {
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
        $(this).css('z-index', 10);
      } else {
        $(this).css('z-index', -1);
      };
    });
  });
}); 


$(document).on('turbolinks:load', function() {
  $('.show_image_main').on('click',() => {
    if ($('.show_image_main').hasClass('js_image')){
      $('.show_image_main').removeClass('js_image');
    } else {
      $('.show_image_main').addClass('js_image');
    }
  });
}); 