class Members < ApplicationRecord
  has_secure_password

  validates :name, :email, presence: true
  validates :email, uniqueness: { message: 'Duplicated.' }
  validates :password, confirmation: { case_sensitive: false }, presence: true
  validates :password_confirmation, presence: true
end
