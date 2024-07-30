class User < ApplicationRecord
    has_secure_password
    has_many :comments
    has_many :ratings

    validates :email, presence: true, uniqueness: true
    normalizes :email, with: -> (email) { email.strip.downcase }
    # validates :password, presence: true, length: { minimum: 6 }

    generates_token_for :password_reset, expires_in: 1.hour do
        password_salt&.last(10);
    end

    generates_token_for :email_verification, expires_in: 1.day do
        email;
    end

end