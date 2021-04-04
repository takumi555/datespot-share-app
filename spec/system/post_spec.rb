require 'rails_helper'

RSpec.describe 'Post', type: :system do
  it '記事一覧が表示される' do
    visit root_path
  end
end