class Post < ApplicationRecord
  validates :title, presence: true
  validates :prefecture, presence: true
  validates :content, presence: true

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :user

  has_many_attached :images
end
