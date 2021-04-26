require 'rails_helper'

RSpec.describe Relationship, type: :model do
  describe "フォロー機能のテスト" do
    let!(:user) { create(:user) }
    let!(:other_user) { create(:user) }
    
    context "フォローしていない場合" do
      
      it "フォローできる" do
        user.follow!(other_user)
        expect(user.has_followed?(other_user)).to be_truthy
        expect(other_user.followers.include?(user)).to be_truthy
      end

      it "フォロー解除に失敗する" do
        expect{user.unfollow!(other_user)}.to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    context "フォローしている場合" do
      before { user.follow!(other_user) }

      it "フォロー解除できる" do
        user.unfollow!(other_user)
        expect(user.has_followed?(other_user)).to be_falsy
        expect(other_user.followers.include?(user)).to be_falsy
      end

      it "フォローに失敗する" do
        expect{user.follow!(other_user)}.to raise_error(ActiveRecord::RecordInvalid)
      end

    end
  end
end