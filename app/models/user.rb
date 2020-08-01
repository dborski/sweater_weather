class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates :api_key, uniqueness: true, presence: true

  validates_confirmation_of :password
  has_secure_password
end
