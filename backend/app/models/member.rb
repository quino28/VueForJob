class Member < ApplicationRecord
  validates :name, :email, :pasword, presence: true
end
