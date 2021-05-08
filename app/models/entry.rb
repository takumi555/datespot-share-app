class Entry < ApplicationRecord
  validates :room_id, uniqueness: { scope: :user_id }

  belongs_to :user
  belongs_to :room
end
