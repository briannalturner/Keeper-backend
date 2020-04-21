class User < ApplicationRecord
    has_one_attached :image
    has_secure_password
    has_many :liked_users, foreign_key: :user_id, class_name: 'Like'
    has_many :likees, through: :liked_users
    has_many :liked_by_users, foreign_key: :user_id, class_name: 'Like'
    has_many :likers, through: :liked_by_users
    
    has_many :sent, foreign_key: :user_id, class_name: 'Message'
    has_many :sent_messages, through: :sent
    has_many :recieved, foreign_key: :user_id, class_name: 'Message'
    has_many :recieved_messages, through: :recieved
end
