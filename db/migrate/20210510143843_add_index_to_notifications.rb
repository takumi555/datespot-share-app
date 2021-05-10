class AddIndexToNotifications < ActiveRecord::Migration[6.0]
  def change
    add_index :notifications, :visitor_id
  end
end
