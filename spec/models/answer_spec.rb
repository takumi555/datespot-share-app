require 'rails_helper'

RSpec.describe Answer, type: :model do
  context '回答の内容がある場合' do
    let!(:answer) { build(:answer) }

    it '回答を保存できる' do
      expect(answer).to be_valid
    end
  end

  context '回答が空の場合' do
    let!(:answer) { build(:answer, content: nil) }

    it 'エラーになる' do
      answer.valid?
      expect(answer.errors.messages[:content][0]).to eq('を入力してください')
    end
  end

  context 'userがいない場合' do
    let!(:answer) { build(:answer, user: nil) }

    it 'エラーになる' do
      answer.valid?
      expect(answer.errors.messages[:user][0]).to eq('を入力してください')
    end
  end

  context 'questionがない場合' do
    let!(:answer) { build(:answer, question: nil) }

    it 'エラーになる' do
      answer.valid?
      expect(answer.errors.messages[:question][0]).to eq('を入力してください')
    end
  end
end
