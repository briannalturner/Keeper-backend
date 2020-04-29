class User < ApplicationRecord
    has_secure_password
    # has_one_attached :image
    has_many :liked_users, foreign_key: :liker_id, class_name: 'Like'
    has_many :likees, through: :liked_users
    has_many :liked_by_users, foreign_key: :likee_id, class_name: 'Like'
    has_many :likers, through: :liked_by_users
    
    has_many :sending_users, foreign_key: :recipient_id, class_name: 'Message'
    has_many :senders, through: :sending_users
    has_many :recieving_users, foreign_key: :sender_id, class_name: 'Message'
    has_many :recipients, through: :recieving_users
end