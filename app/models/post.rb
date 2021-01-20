class Post < ApplicationRecord
  validates :title, presence: true
  validates :prefecture, presence: true
  validates :content, presence: true

  has_many :comments, dependent: :destroy
  belongs_to :user

  has_many_attached :images
end
