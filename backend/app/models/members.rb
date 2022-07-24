class Members < ApplicationRecord
  has_secure_password

  validates :name, :email, :birthday, :gender, presence: true
  validates :email, uniqueness: { message: 'Duplicated.' }
end
