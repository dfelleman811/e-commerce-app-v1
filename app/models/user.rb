class User < ApplicationRecord
    has_one :cart
    has_many :items through: :cart

    validates :username, presence: true, length:  {minimum: 8, maximum: 20}
    validate :password_must_have_special_characters

    def password_must_have_special_characters
        if password != "password"
            errors.add(:password, "must be password")
        end
    end
end