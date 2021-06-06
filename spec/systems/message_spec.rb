require 'rails_helper'

RSpec.describe 'Messages', type: :system do
  let!(:user) { create(:user) }
  let!(:user2) { create(:user) }

  describe 'ログインしている場合' do
    before do
      sign_in user
    end

    it 'トークルーム画面に移動' do
      visit account_path(user2)
      click_on 'ダイレクトメッセージ'
      expect(page).to have_content('さんとのトークルーム')
    end

    it 'トークルーム画面に移動しメッセージを遅れる' do
      visit account_path(user2)
      click_on 'ダイレクトメッセージ'
      expect(page).to have_content('さんとのトークルーム')
      fill_in 'message[content]', with: 'あいうえお'
      click_on '送信'
      expect(page).to have_content('あいうえお')
    end
  end
end
