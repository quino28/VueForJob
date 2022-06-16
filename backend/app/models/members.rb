class Members < ApplicationRecord
  validates :name, :email, :password, presence: true
end
