require 'rails_helper'

RSpec.describe "Comments", type: :request do
  let!(:user) { create(:user) }
  let!(:new_question) { create(:question, user: user) }

  describe '回答の投稿' do
    context 'ログインしている場合' do
      before do
        sign_in user
      end
      it '回答が保存される' do
        answer_params = attributes_for(:answer)
        post question_answers_path(question_id: new_question.id), params: { answer: answer_params}, xhr: true
        expect(response).to have_http_status(200)
        expect(Answer.last.content).to eq(answer_params[:content])
      end
    end

    context 'ログインしていない場合' do
      it 'ログイン画面へ遷移される' do
        answer_params = attributes_for(:answer)
        post question_answers_path(question_id: new_question.id), params: { answer: answer_params}, xhr: true
        expect(response).to have_http_status(401)
      end
    end
  end

  describe '回答の削除' do
    let!(:answer) {create(:answer, user: user, question: new_question)}
    context 'ログインしている場合' do
      before do
        sign_in user
      end
      it '回答が削除される' do
        delete question_answer_path(question_id: new_question.id, id: answer.id), xhr: true
        expect(response).to have_http_status(200)
      end
    end

    context 'ログインしていない場合' do
      it '401エラーが出る' do
        delete question_answer_path(question_id: new_question.id, id: answer.id), xhr: true
        expect(response).to have_http_status(401)
      end
    end
  end

end