class User < ApplicationRecord
    has_one_attached :image
    has_secure_password
end
