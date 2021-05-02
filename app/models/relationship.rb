class Relationship < ApplicationRecord
  validates :follower, uniqueness: { scope: :following }
  validates :following, uniqueness: { scope: :follower }

  belongs_to :follower, class_name: 'User'
  belongs_to :following, class_name: 'User'


end
