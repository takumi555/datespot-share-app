require 'rails_helper'

RSpec.describe 'Relationships', type: :request do
  let!(:user) { create(:user) }
  let!(:other_user) { create(:user) }

  describe 'フォロー機能のテスト' do
    context 'ログインしている場合' do
      before do
        sign_in user
      end

      it '200ステータス返ってくる' do
        post account_follows_path(other_user), xhr: true
        expect(response).to have_http_status(200)
      end
    end

    context 'ログインしていない場合' do
      it 'フォローすると401ステータス返ってくる' do
        post account_follows_path(other_user), xhr: true
        expect(response).to have_http_status(401)
      end
    end
  end

  describe 'フォロー解除機能のテスト' do
    context 'ログインしている場合' do
      before do
        sign_in user
      end

      context '既にフォロー中の場合' do
        before { user.follow!(other_user) }

        it '200ステータス返ってくる' do
          post account_unfollows_path(other_user), xhr: true
          expect(response).to have_http_status(200)
        end
      end
    end

    context 'ログインしていない場合' do
      it 'フォロー解除すると401ステータス返ってくる' do
        post account_follows_path(other_user), xhr: true
        expect(response).to have_http_status(401)
      end
    end
  end
end
