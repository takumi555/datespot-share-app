class Answer < ApplicationRecord
  validates :content, presence: true
  
  belongs_to :user
  belongs_to :question

  has_many :notifications, dependent: :destroy
end
