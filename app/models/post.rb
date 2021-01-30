class Post < ApplicationRecord
  validates :title, presence: true
  validates :prefecture, presence: true
  validates :content, presence: true

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  belongs_to :user

  has_many_attached :images


  def self.search(search)
    if search
      Post.where(['title LIKE ? OR content LIKE ? OR prefecture LIKE ? OR area LIKE ?', "%#{search}%","%#{search}%","%#{search}%","%#{search}%"])
    else
      Post.all
    end
  end
end
