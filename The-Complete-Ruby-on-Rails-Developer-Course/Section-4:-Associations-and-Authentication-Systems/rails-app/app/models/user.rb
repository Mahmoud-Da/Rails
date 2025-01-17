class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  has_many :articles
  
  before_save { self.email = email.downcase }
  validates :username, presence: true, uniqueness: true, length: { in: 3..25 }
  validates :email, presence: true, uniqueness: true, length: { maximum: 150 }, format: { with: VALID_EMAIL_REGEX,
    message: "only allow email pattern" }

  has_secure_password
end
