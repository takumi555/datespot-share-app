require 'rails_helper'

RSpec.describe 'Answer', type: :system do
  let!(:user) { create(:user) }
  let!(:question) { create(:question) }
 
  describe 'ログインしている場合' do
    before do
      sign_in user
    end

    it '質問詳細画面に遷移し回答できる' do
      visit question_path(question.id)
      fill_in 'answer[content]', with: 'あいうえお'
      click_on '回答'
      expect(page). to have_content('あいうえお')
    end
  end
end