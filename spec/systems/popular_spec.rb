require 'rails_helper'

RSpec.describe 'Popular', type: :system do

  it '人気投稿一覧画面へ遷移' do
    visit root_path
    click_link '人気投稿を見る'
    expect(page). to have_css('.popular_post_title', text: '人気投稿')
  end

end