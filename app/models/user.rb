class User < ApplicationRecord
    has_secure_password
    # has_one_attached :image
    has_many :liked_users, foreign_key: :liker_id, class_name: 'Like'
    has_many :likees, through: :liked_users
    has_many :liked_by_users, foreign_key: :likee_id, class_name: 'Like'
    has_many :likers, through: :liked_by_users

    has_many :messages

    has_many :ones, foreign_key: :user_one_id, class_name: 'Room'
    has_many :user_ones, through: :ones
    has_many :twos, foreign_key: :user_two_id, class_name: 'Room'
    has_many :user_twos, through: :twos
end