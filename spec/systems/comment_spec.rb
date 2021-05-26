require 'rails_helper'

RSpec.describe 'Comment', type: :system do
  let!(:user) { create(:user) }
  let!(:post) { create(:post) }
 
  describe 'ログインしている場合' do
    before do
      sign_in user
    end

    it '投稿詳細画面に遷移しコメントできる' do
      visit post_path(post.id)
      fill_in 'comment[content]', with: 'あいうえお'
      click_on 'コメント'
      expect(page). to have_content('あいうえお')
    end
  end
end