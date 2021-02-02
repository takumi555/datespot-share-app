import $ from 'jquery'
import axios from 'axios'
import { csrfToken } from 'rails-ujs'

axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()

const appendNewComment = (comment) => {
  $('.comments-container').append(
    `<div class="comment-username"><p>${comment.user.username}</p></div>
    <div class="comment-content"><p>${comment.content}</p></div>`
  )
}

document.addEventListener('DOMContentLoaded', () => {
  
  const dataset = $('#post-show').data()
  const postId = dataset.postId

  axios.get(`/posts/${postId}/comments`)
    .then((response) => {
      const comments = response.data
      comments.forEach((comment) => {
        appendNewComment(comment) 
      })
    })

    $('.add_comment_btn').on('click', () => {
      const content = $('#comment_content').val()
      if (!content) {
        window.alert('コメントを入力してください')
      } else {
        axios.post(`/posts/${postId}/comments`, {
          comment: {content: content}
        })
        .then((res) => {
          const comment = res.data
          appendNewComment(comment) 
          $('#comment_content').val('')
        })
      }
    })
})