class Question < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  has_many :answers, dependent: :destroy
  
  has_many :notifications, dependent: :destroy

  belongs_to :user


  def create_notification_answer!(current_user, answer_id)
    temp_ids = Answer.select(:user_id).where(question_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
        save_notification_answer!(current_user, answer_id, temp_id['user_id'])
    end
    save_notification_answer!(current_user, answer_id, user_id) if temp_ids.blank?
  end

  def save_notification_answer!(current_user, answer_id, visited_id)
    notification = current_user.active_notifications.new(
      question_id: id,
      answer_id: answer_id,
      visited_id: visited_id,
      action: 'answer'
    )
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end  
end
