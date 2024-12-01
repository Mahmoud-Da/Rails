class User < ApplicationRecord
  # Validations
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  # Associations
  has_many :posts

  # Business logic
  def full_name∑
    "#{first_name} #{last_name}"
  end
end