class Members < ApplicationRecord
  has_secure_password

  validates :name, :email, :password, :password_confirmation, presence: true
  validates :email, uniqueness: { message: 'Duplicated.' }
  validates :password, confirmation: { case_sensitive: false }
end
