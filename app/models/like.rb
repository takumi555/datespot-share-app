class Like < ApplicationRecord
  validates :user_id, presence: true
  validates :post_id, presence: true
  validates :user_id, presence: true, uniqueness: { scope: :post_id }

  belongs_to :user
  belongs_to :post
end
