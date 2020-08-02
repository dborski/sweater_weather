class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  # validates_presence_of :api_key
  validates_presence_of :password, require: true, confirmation: true
  validates_confirmation_of :password
  has_secure_password

  before_create do
    self.api_key = SecureRandom.uuid
  end
end
