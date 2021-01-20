class Post < ApplicationRecord
  validates :title, presence: true
  validates :prefecture, presence: true
  validates :content, presence: true

  belongs_to :user

  has_many_attached :images
end
