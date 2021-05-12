require 'rails_helper'

RSpec.describe Message, type: :model do
  context 'メッセージの内容がある場合' do 
    let!(:message) { build(:message) }

    it 'メッセージを保存できる' do
      expect(message).to be_valid
    end
  end

  context 'メッセージが空の場合' do 
    let!(:message) { build(:message, content: nil) }

    it 'エラーになる' do
      message.valid?
      expect(message.errors.messages[:content][0]).to eq("を入力してください")
    end
  end

  context 'userがいない場合' do 
    let!(:message) { build(:message, user: nil) }

    it 'エラーになる' do
      message.valid?
      expect(message.errors.messages[:user][0]).to eq("を入力してください")
    end
  end

  context 'roomがない場合' do 
    let!(:message) { build(:message, room: nil) }

    it 'エラーになる' do
      message.valid?
      expect(message.errors.messages[:room][0]).to eq("を入力してください")
    end
  end
  
end
