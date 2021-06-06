require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーションのテスト' do
    context 'username, email ,passwordが登録されている場合' do
      let!(:user) { build(:user) }

      it 'ユーザーを保存できる' do
        user.valid?
        expect(user).to be_valid
      end
    end

    context 'usernameがない場合' do
      let!(:user) { build(:user, username: nil) }

      it 'エラーが出る' do
        user.valid?
        expect(user.errors.messages[:username]).to include('を入力してください')
      end
    end

    context 'emailがない場合' do
      let!(:user) { build(:user, email: nil) }
      it 'エラーが出る' do
        user.valid?
        expect(user.errors[:email]).to include('を入力してください')
      end
    end

    context 'passwordがない場合' do
      let!(:user) { build(:user, password: nil) }
      it 'エラーが出る' do
        user.valid?
        expect(user.errors[:password]).to include('を入力してください')
      end
    end
  end
end
