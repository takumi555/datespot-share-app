require 'rails_helper'

RSpec.describe Question, type: :model do
  
  context 'タイトルと内容が保存されている場合' do
    let!(:question) { build(:question) }

    it '投稿を保存できる' do
      expect(question).to be_valid
    end
  end

  context 'タイトルが空の場合' do
    let!(:question) { build(:question, title: nil) }
    it 'エラーになる' do
      question.valid?
      expect(question.errors.messages[:title][0]).to eq("を入力してください")
    end
  end

  context '内容が空の場合' do
    let!(:question) { build(:question, content: nil) }
    it 'エラーになる' do
      question.valid?
      expect(question.errors.messages[:content][0]).to eq("を入力してください")
    end
  end

  context 'userがいない場合' do 
    let!(:question) { build(:question, user: nil) }

    it 'エラーになる' do
      question.valid?
      expect(question.errors.messages[:user]).to include "を入力してください"
    end
  end
end
