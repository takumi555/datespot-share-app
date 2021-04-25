require 'rails_helper'

RSpec.describe 'Follow', type: :system do
  let!(:user) { create(:user) }
  let!(:other_user) {create(:user) }
 
  describe 'ログインしている状態で' do
    before do
      sign_in user
    end

    context "フォローしていない場合" do

      it 'フォローできる' do
        visit account_path(other_user)
        click_on 'フォローする'
        visit account_path(other_user)
        expect(page).to have_button 'フォロー解除'
      end

    end

    context "フォロー中の場合" do
      before { user.follow!(other_user) }
      
      it "フォロー解除できる" do
        visit account_path(other_user)
        click_on 'フォロー解除'
        visit account_path(other_user)
        expect(page).to have_button 'フォローする'
      end
    end
  end
end