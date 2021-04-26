require 'rails_helper'

RSpec.describe "Questions", type: :request do
  let!(:user) { create(:user) }
  
  describe "GET /questions" do
    it '200ステータスが返ってくる' do
      get questions_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /question/show" do
    let!(:question) { create(:question, user: user) }
    it '200ステータスが返ってくる' do
      get question_path(id: question.id)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /question/new" do
    context 'ログインしている場合' do
      before do
        sign_in user
      end
      
      it '200ステータスが返ってくる' do
        get new_question_path
        expect(response).to have_http_status(200)
      end
    end 

    context 'ログインしていない場合' do
      it 'ログイン画面に遷移する' do
        get new_question_path
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "GET /question/edit" do
    let!(:question) { create(:question, user: user) }
    let!(:user2) { create(:user) }

    describe 'ログインしている場合' do

      context '編集者が質問投稿者の場合' do
        before do
          sign_in user
        end
        
        it '200ステータスが返ってくる' do
          get edit_question_path(id: question.id)
          expect(response).to have_http_status(200)
        end
      end

      context '編集者が質問投稿者ではない場合' do
        before do 
          sign_in user2
        end

        it '302ステータスが返ってくる' do
          get edit_question_path(id: question.id)
          expect(response).to have_http_status(302)
        end
      end
    end

    context 'ログインしていない場合' do
      it 'ログイン画面に遷移する' do
        get edit_question_path(id: question.id)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "POST /questions" do
    context 'ログインしている場合' do
      before do
        sign_in user
      end

      it '記事が保存される' do
        question_params = attributes_for(:question)
        post questions_path({question: question_params})
        expect(response).to have_http_status(302)
        expect(Question.last.title).to eq(question_params[:title])
        expect(Question.last.content).to eq(question_params[:content])
      end
    end

    context 'ログインしていない場合' do
      it 'ログイン画面に遷移する' do
        question_params = attributes_for(:question)
        post questions_path({question: question_params})
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'DELETE /question/destroy' do
    let!(:sample_question) { create(:question, user: user) }
    let!(:user2) {create(:user)}

    describe 'ログインしている場合' do
      context 'ログイン中のユーザーが質問投稿者の場合' do
        before do
          sign_in user
        end
        it '質問を削除できる' do
          count = Question.all.count
          delete question_path(id: sample_question.id)
          expect(response).to have_http_status(302)
          expect(Question.all.count).to eq (count - 1)
        end
      end

      context 'ログイン中のユーザーが質問者以外の場合' do
        before do
          sign_in user2
        end
        it '質問を削除できない' do
          count = Question.all.count
          delete question_path(id: sample_question.id)
          expect(response).to have_http_status(302)
          expect(Question.all.count).not_to eq (count - 1)
        end
      end
    end

    describe 'ログインしていない場合' do
      it '削除できない' do
        delete question_path(id: sample_question.id)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end