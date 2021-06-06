require 'rails_helper'

RSpec.describe 'ログインとログアウト', type: :system do
  before do
    @user = User.create!(username: 'samplename', email: 'example@example.com', password: '123456')
  end
  describe 'ログイン' do
    it 'ログインできる' do
      visit new_user_session_path
      fill_in 'user[email]', with: 'example@example.com'
      fill_in 'user[password]', with: '123456'
      find('.login_btn').click
      expect(page).to have_css('.post_index_title', text: 'すべての投稿')
    end
  end

  describe 'ログアウト' do
    before do
      sign_in @user
    end

    it 'ログアウトできる' do
      visit root_path
      find('#dropdown_icon').click
      click_on 'ログアウト'
      page.driver.browser.switch_to.alert.accept
      expect(page).to have_content('ログイン')
    end
  end
end
