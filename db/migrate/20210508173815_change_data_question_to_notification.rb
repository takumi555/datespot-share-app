class ChangeDataQuestionToNotification < ActiveRecord::Migration[6.0]
  def change
    change_column :notifications, :question_id, 'integer USING CAST(question_id AS integer)'
    change_column :notifications, :answer_id,  'integer USING CAST(answer_id AS integer)'
  end
end
