class Room < ApplicationRecord
    has_many :room_messages, dependent: :destroy
    belongs_to :user_one, class_name: 'User'
    belongs_to :user_two, class_name: 'User'
end
