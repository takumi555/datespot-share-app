import $ from 'jquery'
import axios from 'axios'
import { csrfToken } from 'rails-ujs'

axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()

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