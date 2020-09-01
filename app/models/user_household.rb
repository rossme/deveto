class UserHousehold < ApplicationRecord
  belongs_to :user
  belongs_to :household
end
