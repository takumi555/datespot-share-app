require 'rails_helper'

RSpec.describe Comment, type: :model do
  let!(:user) { create(:user) }
  context 'コメントの内容がある場合' do 
    let!(:comment) { build(:comment) }

    it 'コメントを保存できる' do
      expect(comment).to be_valid
    end
  end

  context 'コメントが空の場合' do 
    let!(:comment) { build(:comment, content: nil) }

    it 'エラーになる' do
      comment.valid?
      expect(comment.errors.messages[:content][0]).to eq("を入力してください")
    end
  end

  context 'userがいない場合' do 
    let!(:comment) { build(:comment, user: nil) }

    it 'エラーになる' do
      comment.valid?
      expect(comment.errors.messages[:user][0]).to eq("を入力してください")
    end
  end
  context 'postがない場合' do 
    let!(:comment) { build(:comment, post: nil) }

    it 'エラーになる' do
      comment.valid?
      expect(comment.errors.messages[:post][0]).to eq("を入力してください")
    end
  end

end
