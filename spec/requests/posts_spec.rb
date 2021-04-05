require 'rails_helper'

RSpec.describe "Posts", type: :request do
  let!(:user) { create(:user) }
  let!(:posts) { create_list(:post, 3, user: user) }
  
  describe "GET /posts" do
    it '200ステータスが返ってくる' do
      get posts_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /post/show" do
    let!(:post) { create(:post, user: user) }
    it '200ステータスが返ってくる' do
      get post_path(id: post.id)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /post/new" do
    context 'ログインしている場合' do
      before do
        sign_in user
      end
      
      it '200ステータスが返ってくる' do
        get new_post_path
        expect(response).to have_http_status(200)
      end
    end 

    context 'ログインしていない場合' do
      it 'ログイン画面に遷移する' do
        get new_post_path
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "GET /post/edit" do
    let!(:post) { create(:post, user: user) }
    let!(:user2) { create(:user) }

    describe 'ログインしている場合' do

      context '編集者が投稿者の場合' do
        before do
          sign_in user
        end
        
        it '200ステータスが返ってくる' do
          get edit_post_path(id: post.id)
          expect(response).to have_http_status(200)
        end
      end

      context '編集者が投稿者ではない場合' do
        before do 
          sign_in user2
        end

        it '302ステータスが返ってくる' do
          get edit_post_path(id: post.id)
          expect(response).to have_http_status(302)
        end
      end
    end

    context 'ログインしていない場合' do
      it 'ログイン画面に遷移する' do
        get edit_post_path(id: post.id)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "POST /posts" do
    context 'ログインしている場合' do
      before do
        sign_in user
      end

      pending '記事が保存される' do
        post_params = attributes_for(:post)
        post posts_path({post: post_params})
        expect(response).to have_http_status(302)
        expect(Post.last.title).to eq(post_params[:title])
        expect(Post.last.content).to eq(post_params[:content])
        expect(Post.last.prefecture).to eq(post_params[:prefecture])
      end
    end

    context 'ログインしていない場合' do
      it 'ログイン画面に遷移する' do
        post_params = attributes_for(:post) 
        post posts_path({post: post_params})
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'DELETE /post/destroy' do
    let!(:sample_post) { create(:post, user: user) }
    let!(:user2) {create(:user)}

    describe 'ログインしている場合' do
      context 'ログイン中のユーザーが投稿者の場合' do
        before do
          sign_in user
        end
        it '投稿を削除できる' do
          count = Post.all.count
          delete post_path(id: sample_post.id)
          expect(response).to have_http_status(302)
          expect(Post.all.count).to eq (count - 1)
        end
      end

      context 'ログイン中のユーザーが投稿者以外の場合' do
        before do
          sign_in user2
        end
        it '投稿を削除できない' do
          count = Post.all.count
          delete post_path(id: sample_post.id)
          expect(response).to have_http_status(302)
          expect(Post.all.count).not_to eq (count - 1)
        end
      end
    end

    describe 'ログインしていない場合' do
      it '削除できない' do
        delete post_path(id: sample_post.id)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

end
