class User < ApplicationRecord
    has_many :posts

    validates :username, 
        presence: true, 
        uniqueness: true, 
        length: {minimum:3, maximum:25}

    EMAIL_FORMAT = /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/i
    validates :email, 
        presence: true, 
        uniqueness: true, 
        length: {maximum: 100},
        format: { with: EMAIL_FORMAT }

    has_secure_password
end
