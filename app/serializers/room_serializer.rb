class RoomSerializer < ActiveModel::Serializer
  attributes :id
  has_many :room_messages
  has_one :user_one
  has_one :user_two
end
