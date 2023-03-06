class User < ApplicationRecord
    has_one :cart

    VALID_PASSWORD_REGEX = /\A(?!\s)(?=\D*\d)(?=[^a-z]*[a-z])(?=[^A-Z]*[A-Z])(?=.*[!@#$%^+=])\S{8,}\Z/
    validates :username, presence: true, length:  {minimum: 8, maximum: 20}
    validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX, message: "must include lowercase, uppercase, number, and special character"}

    has_secure_password
end
