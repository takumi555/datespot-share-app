require 'rails_helper'

RSpec.describe 'Favorite', type: :system do
  let!(:user) { create(:user) }
  let!(:posts) { create_list(:post, 3, user: user) }
 
  describe 'ログインしている場合' do
    before do
      sign_in user
    end

    it 'いいね一覧画面に遷移' do
      visit root_path
      find('.dropdwn_btn').click
      click_link 'いいねした投稿'
      expect(page). to have_text('いいねした投稿')
    end
  end
end