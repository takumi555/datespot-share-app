require 'rails_helper'

RSpec.describe "Likes", type: :request do
  let!(:user) { create(:user) }
  let!(:post) { create(:post)}
  let(:like) { create(:like, user_id: user.id, post_id: post.id) }

  describe "POST posts/:post_id/like(post_id: post.id)" do
    before do
      sign_in user
    end
    
    it "200ステータス返ってくる" do
      post post_like_path(post_id: post.id, user_id: user.id)
      expect(response).to have_http_status(200)
    end
  end
end
