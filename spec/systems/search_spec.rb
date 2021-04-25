require 'rails_helper'

RSpec.describe '検索フォーム' do

  it '入力した文字列で検索できる' do
    visit root_path
    fill_in 'search', with: '渋谷'
    click_on '検索'
    expect(page). to have_content '「 渋谷 」の検索結果 '
  end
end