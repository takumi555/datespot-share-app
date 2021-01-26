import $ from 'jquery'
import axios from 'axios'
import { csrfToken } from 'rails-ujs'

axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()

document.addEventListener('DOMContentLoaded', () => {


    $('.inactive-heart').on('click', (e) => {
      e.preventDefault();
      const id = $(e.currentTarget).attr('id')
      axios.post(`/posts/${id}/like`)
        .then((response) => {
          if (response.data.status === 'ok') {
            $(`.active-heart.${id}`).removeClass('hidden')
            $(`.inactive-heart.${id}`).addClass('hidden')
          }
        })
        .catch((e) => {
          window.alert('error')
          console.log(e)
        })
    })

    $('.active-heart').on('click', (e) => {
      e.preventDefault();
      const id = $(e.currentTarget).attr('id')
      axios.delete(`/posts/${id}/like`)
        .then((response) => {
          debugger
          if (response.data.status === 'ok') {
            $(`.active-heart.${id}`).addClass('hidden')
            $(`.inactive-heart.${id}`).removeClass('hidden')
          }
        })
        .catch((e) => {
          window.alert('error')
          console.log(e)
        })
    })
})