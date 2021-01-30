class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  
  has_many :favorite_posts, through: :likes, source: :post
  has_one :profile
  

  def prepare_profile
    profile || build_profile
  end

  def has_liked?(post)
    likes.exists?(post_id: post.id)
  end

  def avatar_image
    if profile&.avatar&.attached?
      profile.avatar
    else
      'nice-hiyoko.png'
    end
  end
end
