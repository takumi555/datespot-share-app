require 'rails_helper'

RSpec.describe 'Post', type: :system do
  let!(:user) { create(:user) }
  let!(:questions) { create_list(:question, 3, user: user) }
 
  it '質問一覧が表示される' do
    visit questions_path
    questions.each do |question|
      expect(page).to have_css('.questions_title', text: question.title)
    end
  end

  it '詳細画面へ遷移' do
    visit questions_path
    page.first(".questions_title").click
    expect(page). to have_css('.question_title')
  end

  describe 'ログインしている場合' do
    before do
      sign_in user
    end
    it '質問投稿画面へ遷移' do
      visit questions_path
      click_link '質問投稿'
      expect(page).to have_content 'タイトル'
      expect(page).to have_content '質問内容'
    end

    it '投稿を保存できる' do
      visit new_question_path
      fill_in 'question[title]', with: 'Faker::Lorem.characters(number: 10)'
      fill_in 'question[content]', with: 'Faker::Lorem.characters(number: 30)'
      find(".question_submit").click
      expect(page).to have_content '投稿が完了しました'
      expect(page).to have_content '質問部屋'
    end
  end
end