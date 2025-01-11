class User < ApplicationRecord
  EMAIL_VALID_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  has_many :articles
  # 存在していること
  # 重複作成できないこと
  # 長さ 3 ~25
  validates :username, presence: true, uniqueness: true, length: { in: 3..25 }

  # 存在していること
  # 長さの最大 100
  # emailの形式に合っていること
  validates :email, presence: true, length: { maximum: 100 }, format: { with: EMAIL_VALID_REGEX,
    message: "pattern is not valid" }

  has_secure_password
end
