class Members < ApplicationRecord
  validates :name, :email, :password, presence: true
  validates :email, uniqueness: { message: 'Duplicated.' }
end
