class Post < ApplicationRecord
  validates :title, presence: true
  validates :prefecture, presence: true
  validates :content, presence: true

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :tagmaps, dependent: :destroy
  has_many :tags, through: :tagmaps

  belongs_to :user

  has_many_attached :images


  def self.search(search)
    if search
      Post.where(['title LIKE ? OR content LIKE ? OR prefecture LIKE ? OR area LIKE ?', "%#{search}%","%#{search}%","%#{search}%","%#{search}%"])
    else
      Post.all
    end
  end

  def save_posts(tags)
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    old_tags = current_tags - tags
    new_tags = tags - current_tags

    #Destroy
    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(tag_name:old_name)
    end

    #Create
    new_tags.each do |new_name|
      post_tag = Tag.find_or_create_by(tag_name:new_name)
      self.tags << post_tag
    end
  end


end