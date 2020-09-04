class UserHousehold < ApplicationRecord
  belongs_to :user
  belongs_to :household
  validates :user, uniqueness: true
end
