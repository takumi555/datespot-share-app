require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'タイトルと都道府県と内容が保存されている場合' do
    let!(:post) { build(:post) }

    it '投稿を保存できる' do
      expect(post).to be_valid
    end
  end

  context 'タイトルが空の場合' do
    let!(:post) { build(:post, title: nil) }
    it 'エラーになる' do
      post.valid?
      expect(post.errors.messages[:title][0]).to eq('を入力してください')
    end
  end

  context '内容が空の場合' do
    let!(:post) { build(:post, content: nil) }
    it 'エラーになる' do
      post.valid?
      expect(post.errors.messages[:content][0]).to eq('を入力してください')
    end
  end

  context '都道府県が空の場合' do
    let!(:post) { build(:post, prefecture: nil) }
    it 'エラーになる' do
      post.valid?
      expect(post.errors.messages[:prefecture][0]).to eq('を入力してください')
    end
  end

  context 'userがいない場合' do
    let!(:post) { build(:post, user: nil) }

    it 'エラーになる' do
      post.valid?
      expect(post.errors.messages[:user]).to include 'を入力してください'
    end
  end
end
