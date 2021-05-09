class RenameVisiterIdColummsToNotifications < ActiveRecord::Migration[6.0]
  def change
    rename_column :notifications, :visiter_id, :visitor_id
  end
end
