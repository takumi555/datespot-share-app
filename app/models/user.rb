class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  validates :username, presence: true
  validates :email, presence: true
  validates :password, presence: true

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  
  has_many :favorite_posts, through: :likes, source: :post
  has_one :profile

  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy

  has_many :following_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  has_many :followings, through: :following_relationships, source: :following

  has_many :follower_relationships, foreign_key: 'following_id', class_name: 'Relationship', dependent: :destroy
  has_many :followers, through: :follower_relationships, source: :follower

  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :rooms, through: :entries

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
      'fish.jpeg'
    end
  end

  def follow!(user)
    user_id = get_user_id(user)
    following_relationships.create!(following_id: user_id)
  end

  def unfollow!(user)
    user_id = get_user_id(user)
    relation = following_relationships.find_by!(following_id: user_id)
    relation.destroy!
  end

  def has_followed?(user)
    following_relationships.exists?(following_id: user.id)
  end

  def following_count
    followings.count
  end

  def follower_count
    followers.count
  end

  private
  def get_user_id(user)
    if user.is_a?(User)
      user_id = user.id
    else
      user_id = user
    end
  end
end
