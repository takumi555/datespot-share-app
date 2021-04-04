require 'rails_helper'

RSpec.describe "Comments", type: :request do
  let!(:user) { create(:user) }
  let!(:new_post) { create(:post, user: user) }

  describe 'コメントの投稿' do
    context 'ログインしている場合' do
      before do
        sign_in user
      end
      it 'コメントが保存される' do
        comment_params = attributes_for(:comment)
        post post_comments_path(post_id: new_post.id), params: { comment: comment_params}, xhr: true
        expect(response).to have_http_status(200)
        expect(Comment.last.content).to eq(comment_params[:content])
      end
    end

    context 'ログインしていない場合' do
      it 'ログイン画面へ遷移される' do
        comment_params = attributes_for(:comment)
        post post_comments_path(post_id: new_post.id), params: { comment: comment_params}, xhr: true
        expect(response).to have_http_status(401)
      end
    end
  end

  describe 'コメントの削除' do
    let!(:comment) {create(:comment, user: user, post: new_post)}
    context 'ログインしている場合' do
      before do
        sign_in user
      end
      it 'コメントが削除される' do
        delete post_comment_path(post_id: new_post.id, id: comment.id), xhr: true
        expect(response).to have_http_status(200)
      end
    end

    context 'ログインしていない場合' do
      it '401エラーが出る' do
        delete post_comment_path(post_id: new_post.id, id: comment.id), xhr: true
        expect(response).to have_http_status(401)
      end
    end
  end

end